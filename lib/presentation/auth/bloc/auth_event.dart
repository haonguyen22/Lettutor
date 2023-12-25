part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class Login extends AuthEvent {
  final String username;
  final String password;

  Login(this.username, this.password);
}

class LogOut extends AuthEvent {}

class Register extends AuthEvent {
  final String username;
  final String password;

  Register(this.username, this.password);
}

class EditUserProfile extends AuthEvent {
  final Map<String, dynamic> body;

  EditUserProfile(this.body);
}

class FetchUser extends AuthEvent {}

class ForgotPassword extends AuthEvent {
  final String email;

  ForgotPassword(this.email);
}

class UploadAvatar extends AuthEvent {
  final String path;

  UploadAvatar(this.path);
}

class GoogleLogin extends AuthEvent {}

class FacebookLogin extends AuthEvent {}
