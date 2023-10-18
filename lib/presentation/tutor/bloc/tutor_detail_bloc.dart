import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:let_tutor/domain/entities/tutor.dart';
import 'package:let_tutor/domain/usecase/tutor_usecase.dart';

part 'tutor_detail_event.dart';
part 'tutor_detail_state.dart';

@injectable
class TutorDetailBloc extends Bloc<TutorDetailEvent, TutorDetailState> {
  final Tutor tutorParam;
  final TutorUseCase _tutorUseCase;
  TutorDetailBloc(
    @factoryParam this.tutorParam,
    this._tutorUseCase,
  ) : super(const TutorDetailInitial()) {
    on<FetchTutorByIdEvent>(_fetchTutorByIdEvent);
    on<FavoriteTutorEvent>(_favoriteTutorEvent);
    on<ReportTutorEvent>(_reportTutorEvent);
  }

  FutureOr<void> _fetchTutorByIdEvent(
      FetchTutorByIdEvent event, Emitter<TutorDetailState> emit) async {
    emit(TutorDetailInitial(
        isLoading: true,
        name: tutorParam.user?.name ?? tutorParam.name ?? "",
        tutor: tutorParam));
    Tutor? tutor = await _tutorUseCase.getTutorById(id: tutorParam.userId!);
    emit(TutorDetailSuccess(
        isLoading: false,
        tutor: mergeTutors(state.tutor, tutor),
        name: state.name));
  }

  FutureOr<void> _favoriteTutorEvent(
      FavoriteTutorEvent event, Emitter<TutorDetailState> emit) async {
    emit(TutorDetailSuccess(
        isLoading: false,
        tutor: state.tutor,
        name: state.name,
        processing: true));
    await _tutorUseCase.addTutorToFavorite(id: tutorParam.userId!);
    Tutor? tutor = await _tutorUseCase.getTutorById(id: tutorParam.userId!);
    emit(TutorDetailSuccess(
        isLoading: false,
        tutor: mergeTutors(tutorParam, tutor),
        name: state.name,
        processing: false));
  }

  FutureOr<void> _reportTutorEvent(
      ReportTutorEvent event, Emitter<TutorDetailState> emit) async {
    emit(TutorDetailSuccess(
      isLoading: state.isLoading,
      tutor: state.tutor,
      name: state.name,
      processing: true,
    ));
    await _tutorUseCase.reportTutor(
        tutorId: event.tutorId, content: event.content);
    emit(TutorDetailSuccess(
      isLoading: state.isLoading,
      tutor: state.tutor,
      name: state.name,
      processing: false,
    ));
    event.onSuccess();
  }
}
