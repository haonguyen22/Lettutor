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
