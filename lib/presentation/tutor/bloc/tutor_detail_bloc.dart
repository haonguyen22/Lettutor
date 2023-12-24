import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:let_tutor/data/models/schedule/schedule_model.dart';
import 'package:let_tutor/domain/entities/tutor.dart';
import 'package:let_tutor/domain/usecase/schedule_usecase.dart';
import 'package:let_tutor/domain/usecase/tutor_usecase.dart';

part 'tutor_detail_event.dart';
part 'tutor_detail_state.dart';

@injectable
class TutorDetailBloc extends Bloc<TutorDetailEvent, TutorDetailState> {
  final Tutor tutorParam;
  final TutorUseCase _tutorUseCase;
  final ScheduleUseCase _scheduleUseCase;

  TutorDetailBloc(
    @factoryParam this.tutorParam,
    this._tutorUseCase,
    this._scheduleUseCase,
  ) : super(const TutorDetailInitial()) {
    on<FetchTutorByIdEvent>(_fetchTutorByIdEvent);
    on<FavoriteTutorEvent>(_favoriteTutorEvent);
    on<ReportTutorEvent>(_reportTutorEvent);
    on<FetchScheduleByTutorIdEvent>(_fetchScheduleByTutorIdEvent);
    on<BookClassEvent>(_bookClassEvent);
  }

  FutureOr<void> _fetchTutorByIdEvent(
      FetchTutorByIdEvent event, Emitter<TutorDetailState> emit) async {
    emit(TutorDetailInitial(
      isLoading: true,
      name: tutorParam.user?.name ?? tutorParam.name ?? "",
      tutor: tutorParam,
      isLoadingSchedule: state.isLoadingSchedule,
      schedules: state.schedules,
    ));
    Tutor? tutor = await _tutorUseCase.getTutorById(id: tutorParam.userId!);

    emit(TutorDetailSuccess(
      isLoading: false,
      tutor: mergeTutors(state.tutor, tutor),
      name: state.name,
      isLoadingSchedule: state.isLoadingSchedule,
      schedules: state.schedules,
    ));
  }

  FutureOr<void> _favoriteTutorEvent(
      FavoriteTutorEvent event, Emitter<TutorDetailState> emit) async {
    emit(TutorDetailSuccess(
      isLoading: false,
      tutor: state.tutor,
      name: state.name,
      processing: true,
      isLoadingSchedule: state.isLoadingSchedule,
      schedules: state.schedules,
    ));
    await _tutorUseCase.addTutorToFavorite(id: tutorParam.userId!);
    Tutor? tutor = await _tutorUseCase.getTutorById(id: tutorParam.userId!);
    emit(TutorDetailSuccess(
      isLoading: false,
      tutor: mergeTutors(tutorParam, tutor),
      name: state.name,
      processing: false,
      isLoadingSchedule: state.isLoadingSchedule,
      schedules: state.schedules,
    ));
  }

  FutureOr<void> _reportTutorEvent(
      ReportTutorEvent event, Emitter<TutorDetailState> emit) async {
    emit(TutorDetailSuccess(
      isLoading: state.isLoading,
      tutor: state.tutor,
      name: state.name,
      processing: true,
      isLoadingSchedule: state.isLoadingSchedule,
      schedules: state.schedules,
    ));
    await _tutorUseCase.reportTutor(
        tutorId: event.tutorId, content: event.content);
    emit(TutorDetailSuccess(
      isLoading: state.isLoading,
      tutor: state.tutor,
      name: state.name,
      processing: false,
      isLoadingSchedule: state.isLoadingSchedule,
      schedules: state.schedules,
    ));
    event.onSuccess();
  }

  FutureOr<void> _fetchScheduleByTutorIdEvent(
      FetchScheduleByTutorIdEvent event, Emitter<TutorDetailState> emit) async {
    emit(TutorDetailSuccess(
      isLoading: state.isLoading,
      tutor: state.tutor,
      name: state.name,
      schedules: state.schedules,
      isLoadingSchedule: true,
    ));
    List<ScheduleModel>? res = await _scheduleUseCase.getScheduleByTutorID(
        tutorId: tutorParam.userId!);
    emit(
      TutorDetailSuccess(
        isLoading: state.isLoading,
        tutor: state.tutor,
        name: state.name,
        schedules: res?.toList()
          ?..sort((a, b) => a.startTimestamp!.compareTo(b.startTimestamp!)),
        isLoadingSchedule: false,
      ),
    );
  }

  FutureOr<void> _bookClassEvent(
      BookClassEvent event, Emitter<TutorDetailState> emit) async {
    emit(BookClassInitial(
      isLoading: state.isLoading,
      tutor: state.tutor,
      name: state.name,
      schedules: state.schedules,
      isLoadingSchedule: state.isLoadingSchedule,
    ));

    try {
      await _scheduleUseCase.bookAClass(
        scheduleDetailId: event.scheduleDetailId,
        note: event.note,
      );
      emit(BookClassSuccess(
        isLoading: state.isLoading,
        tutor: state.tutor,
        name: state.name,
        schedules: state.schedules?.map((e) {
          if (e.id == event.scheduleDetailId) {
            return e.copyWith(isBooked: true);
          }
          return e;
        }).toList(),
        isLoadingSchedule: state.isLoadingSchedule,
        processing: false,
      ));
    } catch (e) {
      emit(BookClassFailed(
        isLoading: state.isLoading,
        tutor: state.tutor,
        name: state.name,
        schedules: state.schedules,
        isLoadingSchedule: state.isLoadingSchedule,
        message: e.toString(),
      ));
    }
  }
}
