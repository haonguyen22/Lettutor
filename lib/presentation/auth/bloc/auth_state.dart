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

  AuthInitial copyWith({
    bool? isLoading,
    User? user,
    int? totalLearning,
  }) {
    return AuthInitial(
      isLoading: isLoading ?? this.isLoading,
      user: user ?? this.user,
      totalLearning: totalLearning ?? this.totalLearning,
    );
  }
}

class AuthSuccess extends AuthState {
  const AuthSuccess({
    super.isLoading,
    super.user,
    
    super.totalLearning,
  });

  AuthSuccess copyWith({
    bool? isLoading,
    User? user,
    int? totalLearning,
  }) {
    return AuthSuccess(
      isLoading: isLoading ?? this.isLoading,
      user: user ?? this.user,
      totalLearning: totalLearning ?? this.totalLearning,
    );
  }
}

class AuthFailed extends AuthState {
  final String? message;
  const AuthFailed({
    super.isLoading,
    super.user,
    this.message,
    
    super.totalLearning,
  });

  AuthFailed copyWith({
    bool? isLoading,
    String? message,
    User? user,
    int? totalLearning,
  }) {
    return AuthFailed(
      isLoading: isLoading ?? this.isLoading,
      message: message ?? this.message,
      user: user ?? this.user,
      totalLearning: totalLearning ?? this.totalLearning,
    );
  }
}
