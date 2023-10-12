import 'package:injectable/injectable.dart';
import 'package:let_tutor/core/dependency_injection/app_core_factory.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';

@module
abstract class ServiceModules {
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  @Named("BaseUrl")
  String get baseUrl => 'https://sandbox.api.lettutor.com';

  @lazySingleton
  Dio dio(@Named('BaseUrl') String url) => AppCoreFactory.createDio(url);
}
