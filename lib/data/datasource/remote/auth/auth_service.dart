import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:let_tutor/data/models/forgot_password/forgot_password_response.dart';
import 'package:let_tutor/data/models/token/sign_in_model.dart';
import 'package:let_tutor/data/models/token/token.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_service.g.dart';

@RestApi()
@injectable
abstract class AuthService {
  static const String loginApi = '/auth/login';
  static const String registerApi = '/auth/register';
  static const String loginByPhoneApi = '/auth/phone-login';
  static const String loginByGoogleApi = '/auth/google';
  static const String loginByFacebookApi = '/auth/facebook';
  static const String registerByPhoneApi = '/auth/phone-register';
  static const String forgotPwApi = '/user/forgotPassword';
  static const String refreshTokenApi = '/user/refreshToken';

  @factoryMethod
  factory AuthService(Dio dio) = _AuthService;

  @POST(loginApi)
  Future<AuthResponse?> login({@Body() required Map<String, dynamic> body});

  @POST(forgotPwApi)
  Future<ForgotPasswordResponse> forgotPassword(
      {@Body() required Map<String, dynamic> body});

  @POST(registerApi)
  Future<AuthResponse?> register({@Body() required Map<String, dynamic> body});

  @POST(refreshTokenApi)
  Future<Token?> refreshToken({@Body() required Map<String, dynamic> body});

  @POST(loginByGoogleApi)
  Future<AuthResponse?> loginByGoogle(
      {@Body() required Map<String, dynamic> body});

  @POST(loginByFacebookApi)
  Future<AuthResponse?> loginByFacebook(
      {@Body() required Map<String, dynamic> body});
}
