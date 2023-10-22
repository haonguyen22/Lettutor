part of 'auth_bloc.dart';

@immutable
abstract class AuthState {
  final bool isLoading;
  final User? user;

  const AuthState({
    this.isLoading = false,
    this.user,
  });
}

class AuthInitial extends AuthState {
  const AuthInitial({
    super.isLoading,
    super.user,
  });

  AuthInitial copyWith({
    bool? isLoading,
    User? user,
  }) {
    return AuthInitial(
      isLoading: isLoading ?? this.isLoading,
      user: user ?? this.user,
    );
  }
}

class AuthSuccess extends AuthState {
  const AuthSuccess({
    super.isLoading,
    super.user,
  });

  AuthSuccess copyWith({
    bool? isLoading,
    User? user,
  }) {
    return AuthSuccess(
      isLoading: isLoading ?? this.isLoading,
      user: user ?? this.user,
    );
  }
}

class AuthFailed extends AuthState {
  final String? message;
  const AuthFailed({
    super.isLoading,
    super.user,
    this.message,
  });

  AuthFailed copyWith({
    bool? isLoading,
    String? message,
    User? user,
  }) {
    return AuthFailed(
      isLoading: isLoading ?? this.isLoading,
      message: message ?? this.message,
      user: user ?? this.user,
    );
  }
}
