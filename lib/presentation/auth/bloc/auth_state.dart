part of 'auth_bloc.dart';

@immutable
abstract class AuthState {
  final bool isLoading;
  final User? user;
  final int? totalLearning;

  const AuthState({
    this.isLoading = false,
    this.user,
    this.totalLearning,
  });
}

class AuthInitial extends AuthState {
  const AuthInitial({
    super.isLoading,
    super.user,
    super.totalLearning,
  });
}

class AuthSuccess extends AuthState {
  const AuthSuccess({
    super.isLoading,
    super.user,
    super.totalLearning,
  });
}


class RegisterSuccess extends AuthState {
  final String? message;

  const RegisterSuccess({
    super.isLoading,
    this.message,
    super.user,
    super.totalLearning,
  });
}

class AuthFailed extends AuthState {
  final String? message;
  const AuthFailed({
    super.isLoading,
    super.user,
    this.message,
    super.totalLearning,
  });
}

class ForgotPasswordLoading extends AuthState {
  const ForgotPasswordLoading({
    super.isLoading,
    super.user,
    super.totalLearning,
  });
}

class ForgotPasswordSuccess extends AuthState {
  final String? message;
  const ForgotPasswordSuccess({
    super.isLoading,
    super.user,
    this.message,
    super.totalLearning,
  });
}

class ForgotPasswordFailed extends AuthState {
  final String? message;
  const ForgotPasswordFailed({
    super.isLoading,
    super.user,
    this.message,
    super.totalLearning,
  });
}

class UpdateUserProfileLoading extends AuthState {
  final String? message;
  const UpdateUserProfileLoading({
    super.isLoading,
    super.user,
    this.message,
    super.totalLearning,
  });
}

class UpdateUserProfileSuccess extends AuthState {
  final String? message;
  const UpdateUserProfileSuccess({
    super.isLoading,
    super.user,
    this.message,
    super.totalLearning,
  });
}

class UpdateUserProfileFailed extends AuthState {
  final String? message;
  const UpdateUserProfileFailed({
    super.isLoading,
    super.user,
    this.message,
    super.totalLearning,
  });
}
