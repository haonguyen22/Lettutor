part of 'auth_bloc.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;
  const factory AuthState.loading() = _Loading;
  const factory AuthState.loginSuccess() = _LoginSuccess;
  const factory AuthState.loginFailed(String message) = _LoginFailed;
}
