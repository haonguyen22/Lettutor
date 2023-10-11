part of 'auth_bloc.dart';

@immutable
abstract class AuthState  {
  final bool isLoading;
  final User? user;
  final Token? token;

  const AuthState({
    this.isLoading = false,
    this.token,
    this.user,
  });
}

class AuthInitial extends AuthState {
  const AuthInitial({
    super.isLoading,
    super.token,
    super.user,
  });

  AuthInitial copyWith({
    bool? isLoading,
    User? user,
    Token? token,
  }) {
    return AuthInitial(
      isLoading: isLoading ?? this.isLoading,
      token: token ?? this.token,
      user: user ?? this.user,
    );
  }

}

class AuthSuccess extends AuthState {
  const AuthSuccess({
    super.isLoading,
    super.token,
    super.user,
  });

  AuthSuccess copyWith({
    bool? isLoading,
    User? user,
    Token? token,
  }) {
    return AuthSuccess(
      isLoading: isLoading ?? this.isLoading,
      user: user ?? this.user,
      token: token ?? this.token,
    );
  }

}

class AuthFailed extends AuthState {
  final String? message;
  const AuthFailed({
    super.isLoading,
    super.token,
    super.user,
    this.message,
  });

  AuthFailed copyWith({
    bool? isLoading,
    String? message,
    User? user,
    Token? token,
  }) {
    return AuthFailed(
      isLoading: isLoading ?? this.isLoading,
      message: message ?? this.message,
      user: user ?? this.user,
      token: token ?? this.token,
    );
  }
}
