import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:let_tutor/data/models/token/token.dart';
import 'package:let_tutor/domain/entities/user.dart';
import 'package:let_tutor/domain/usecase/auth_usecase.dart';
import 'package:let_tutor/domain/usecase/user_usecase.dart';

part 'auth_event.dart';
part 'auth_state.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthUseCase _authUseCase;
  final UserUseCase _userUseCase;

  AuthBloc(
    this._authUseCase,
    this._userUseCase,
  ) : super(const AuthInitial()) {
    on<Login>(login);
    on<LogOut>(logout);
    on<Register>(register);
    on<EditUserProfile>(editUserProfile);
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
          message: "Email or password is wrong",
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

  FutureOr<void> editUserProfile(EditUserProfile event, Emitter emit) async {
    try {
      emit(AuthSuccess(isLoading: true, token: state.token, user: state.user));
      final res = await _userUseCase.editUserProfile(body: event.body);
      if (res != null) {
        emit(AuthSuccess(
          isLoading: false,
          token: state.token,
          user: res,
        ));
      } else {
        emit(AuthFailed(
          message: "Fail to update user information",
          isLoading: false,
          token: state.token,
          user: state.user,
        ));
      }
    } catch (e) {
      emit(AuthFailed(
        message: e.toString(),
        isLoading: false,
        token: state.token,
        user: state.user,
      ));
    }
  }
}
