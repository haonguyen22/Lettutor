import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:let_tutor/domain/usecase/auth/auth_usecase.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthUseCase _authUseCase;

  AuthBloc(this._authUseCase) : super(const _Initial()) {
    on<_Login>(login);
    on<_LogOut>(logout);
  }

  FutureOr<void> login(_Login event, Emitter emit) async {
    try {
      emit(const _Loading());
      final token = await _authUseCase.login(
          email: event.username, password: event.password);
      if (token != null) {
        emit(const _LoginSuccess());
      } else {
        emit(const _LoginFailed(
            "Username or password is not wrong. Please try again"));
      }
    } catch (e) {
      emit(_LoginFailed(e.toString()));
    }
  }

  FutureOr<void> logout(_LogOut event, Emitter emit) {
    _authUseCase.logout();
    emit(const _Initial());
  }
}
