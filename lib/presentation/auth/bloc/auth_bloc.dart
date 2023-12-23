import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:let_tutor/domain/entities/user.dart';
import 'package:let_tutor/domain/usecase/auth_usecase.dart';
import 'package:let_tutor/domain/usecase/shared_preferences_usecase.dart';
import 'package:let_tutor/domain/usecase/user_usecase.dart';
import 'package:google_sign_in/google_sign_in.dart';

part 'auth_event.dart';
part 'auth_state.dart';

GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: <String>[
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ],
);

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthUseCase _authUseCase;
  final UserUseCase _userUseCase;
  final SharedPreferencesUseCase _sharedPreferencesUseCase;

  AuthBloc(
    this._authUseCase,
    this._userUseCase,
    this._sharedPreferencesUseCase,
  ) : super(const AuthInitial()) {
    on<Login>(login);
    on<LogOut>(logout);
    on<Register>(register);
    on<EditUserProfile>(editUserProfile);
    on<FetchUser>(fetchUser);
    on<ForgotPassword>(forgotPassword);
    on<GoogleLogin>(googleLogin);
    on<FacebookLogin>(facebookLogin);
  }

  FutureOr<void> login(Login event, Emitter emit) async {
    try {
      emit(const AuthInitial(isLoading: true));
      final res = await _authUseCase.login(
          email: event.username, password: event.password);

      final total = await _userUseCase.getTotalLearning();

      if (res?.token != null) {
        emit(AuthSuccess(
          isLoading: false,
          user: res?.user.toEntity(),
          totalLearning: total,
        ));
      } else {
        emit(AuthFailed(
          message: "Email or password is wrong",
          isLoading: false,
          totalLearning: state.totalLearning,
        ));
      }
    } catch (e) {
      emit(AuthFailed(
        message: e.toString(),
        isLoading: false,
        totalLearning: state.totalLearning,
      ));
    }
  }

  FutureOr<void> register(Register event, Emitter emit) async {
    try {
      emit(const AuthInitial(isLoading: true));
      final res = await _authUseCase.register(
          email: event.username, password: event.password);

      final total = await _userUseCase.getTotalLearning();
      if (res?.token != null) {
        emit(AuthSuccess(
          isLoading: false,
          user: res?.user.toEntity(),
          totalLearning: total,
        ));
      } else {
        emit(AuthFailed(
          message: "Email is already exists.",
          isLoading: false,
          totalLearning: state.totalLearning,
        ));
      }
    } catch (e) {
      emit(AuthFailed(
        message: e.toString(),
        isLoading: false,
        totalLearning: state.totalLearning,
      ));
    }
  }

  FutureOr<void> logout(LogOut event, Emitter emit) {
    _authUseCase.logout();
    emit(const AuthInitial());
  }

  FutureOr<void> editUserProfile(EditUserProfile event, Emitter emit) async {
    try {
      emit(AuthSuccess(isLoading: true, user: state.user));
      final res = await _userUseCase.editUserProfile(body: event.body);
      if (res != null) {
        emit(AuthSuccess(
          isLoading: false,
          user: res,
          totalLearning: state.totalLearning,
        ));
      } else {
        emit(AuthFailed(
          message: "Fail to update user information",
          isLoading: false,
          user: state.user,
          totalLearning: state.totalLearning,
        ));
      }
    } catch (e) {
      emit(AuthFailed(
        message: e.toString(),
        isLoading: false,
        user: state.user,
        totalLearning: state.totalLearning,
      ));
    }
  }

  FutureOr<void> fetchUser(FetchUser event, Emitter<AuthState> emit) async {
    try {
      if (_sharedPreferencesUseCase.getAccessToken().isEmpty) {
        return;
      }
      emit(AuthSuccess(isLoading: true, user: state.user));
      final res = await _userUseCase.getUserInfo();
      final total = await _userUseCase.getTotalLearning();
      emit(AuthSuccess(
        isLoading: false,
        user: res,
        totalLearning: total,
      ));
    } catch (e) {
      emit(AuthFailed(
        message: e.toString(),
        isLoading: false,
        user: state.user,
        totalLearning: state.totalLearning,
      ));
    }
  }

  FutureOr<void> forgotPassword(
      ForgotPassword event, Emitter<AuthState> emit) async {
    emit(ForgotPasswordLoading(
      isLoading: true,
      user: state.user,
      totalLearning: state.totalLearning,
    ));
    final res = await _authUseCase.resetPassword(email: event.email);
    if (res.statusCode == HttpStatus.ok) {
      emit(ForgotPasswordSuccess(
        isLoading: false,
        user: state.user,
        totalLearning: state.totalLearning,
        message: res.message,
      ));
    } else {
      emit(ForgotPasswordFailed(
        message: res.message,
        isLoading: false,
        user: state.user,
        totalLearning: state.totalLearning,
      ));
    }
  }

  Future<FutureOr<void>> googleLogin(
      GoogleLogin event, Emitter<AuthState> emit) async {
    emit(const AuthInitial(isLoading: true));

    try {
      final res = await _googleSignIn.signIn();
      final accessToken =
          await res?.authentication.then((googleKey) => googleKey.accessToken);
      final user = await _authUseCase.loginByGoogle(token: accessToken!);
      final total = await _userUseCase.getTotalLearning();
      if (user?.token != null) {
        emit(AuthSuccess(
          isLoading: false,
          user: user?.user.toEntity(),
          totalLearning: total,
        ));
      } else {
        emit(AuthFailed(
          message: "Fail to login with google",
          isLoading: false,
          user: state.user,
          totalLearning: state.totalLearning,
        ));
      }
    } catch (error) {
      emit(AuthFailed(
        message: error.toString(),
        isLoading: false,
        user: state.user,
        totalLearning: state.totalLearning,
      ));
    }
  }

  FutureOr<void> facebookLogin(FacebookLogin event, Emitter<AuthState> emit) {}
}
