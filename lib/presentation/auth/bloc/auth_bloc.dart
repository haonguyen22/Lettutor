import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:let_tutor/data/models/token/token.dart';
import 'package:let_tutor/domain/entities/user.dart';
import 'package:let_tutor/domain/usecase/auth_usecase.dart';

part 'auth_event.dart';
part 'auth_state.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthUseCase _authUseCase;

  AuthBloc(
    this._authUseCase,
  ) : super(const AuthInitial()) {
    on<Login>(login);
    on<LogOut>(logout);
    on<Register>(register);
  }

  FutureOr<void> login(Login event, Emitter emit) async {
    try {
      emit(const AuthInitial(isLoading: true));
      final res = await _authUseCase.login(
          email: event.username, password: event.password);
      if (res?.token != null) {
        emit(AuthSuccess(
          isLoading: false,
          token: res?.token,
          user: res?.user.toEntity(),
        ));
      } else {
        emit(const AuthFailed(
          message: "Email is already exists.",
          isLoading: false,
        ));
      }
    } catch (e) {
      emit(AuthFailed(
        message: e.toString(),
        isLoading: false,
      ));
    }
  }

  FutureOr<void> register(Register event, Emitter emit) async {
    try {
      emit(const AuthInitial(isLoading: true));
      final res = await _authUseCase.register(
          email: event.username, password: event.password);
      if (res?.token != null) {
        emit(AuthSuccess(
          isLoading: false,
          token: res?.token,
          user: res?.user.toEntity(),
        ));
      } else {
        emit(const AuthFailed(
          message: "Email is already exists.",
          isLoading: false,
        ));
      }
    } catch (e) {
      emit(AuthFailed(
        message: e.toString(),
        isLoading: false,
      ));
    }
  }

  FutureOr<void> logout(LogOut event, Emitter emit) {
    _authUseCase.logout();
    emit(const AuthInitial());
  }
}
