// ignore_for_file: deprecated_member_use

import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';
import 'package:let_tutor/core/dependency_injection/di.dart';
import 'package:let_tutor/data/datasource/remote/auth/auth_service.dart';
import 'package:let_tutor/domain/usecase/shared_preferences_usecase.dart';

/// References: https://github.com/nguyenminhhung2011/State_manage_stream/blob/main/lib/core/app_core_factory.dart
class AppCoreFactory {
  static Dio createDio(String baseUrl) {
    final dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        headers: {
          "content-type": "application/json;encoding=utf-8",
          "Accept": "*/*",
        },
      ),
    )
      ..interceptors.add(TokenInterceptor())
      ..interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
    if (!kIsWeb) {
      (dio.httpClientAdapter as IOHttpClientAdapter).onHttpClientCreate =
          (HttpClient client) {
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
        return client;
      };
    }
    return dio;
  }
}

class TokenInterceptor implements Interceptor {
  // final AuthApi _authApi = injector.get<AuthApi>();

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    return handler.next(err);
  }

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    String accessToken =
        injector.get<SharedPreferencesUseCase>().getAccessToken();
    String refreshToken =
        injector.get<SharedPreferencesUseCase>().getRefreshToken();
    int expiredTime = injector.get<SharedPreferencesUseCase>().getExpireTime();

    log('🌟[Access] $accessToken\n[Refresh] $refreshToken');

    if (accessToken.isEmpty || refreshToken.isEmpty || expiredTime == -1) {
      return handler.next(options);
    }

    final expiredTimeParsed = DateTime.fromMillisecondsSinceEpoch(expiredTime);
    final isExpired = DateTime.now().isAfter(expiredTimeParsed);

    if (isExpired) {
      ///[Warning] if don't have this line code render dio call => duplicate
      await injector.get<SharedPreferencesUseCase>().setExpireTime(-1);
      try {
        final res = await injector.get<AuthService>().refreshToken(body: {
          'refreshToken': refreshToken,
          'timezone': "7",
        });
        if (res != null) {
          options.headers["Authorization"] = "Bearer ${res.access.token}";
          await injector
              .get<SharedPreferencesUseCase>()
              .setAccessToken(res.access.token);
          await injector
              .get<SharedPreferencesUseCase>()
              .setRefreshToken(res.refresh.token);
          await injector
              .get<SharedPreferencesUseCase>()
              .setExpireTime(res.access.expires.millisecondsSinceEpoch);
          // return handler.next(options);
        } else {
          log("Logging out");
        }
      } catch (e) {
        log(e.toString());
        return;
      }
    } else {
      options.headers["Authorization"] = "Bearer $accessToken";
      return handler.next(options);
    }
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    return handler.next(response);
  }
}
