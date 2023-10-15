import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:let_tutor/domain/entities/tutor.dart';
import 'package:let_tutor/domain/usecase/tutor_usecase.dart';
import 'package:meta/meta.dart';

part 'tutor_event.dart';
part 'tutor_state.dart';

@injectable
class TutorBloc extends Bloc<TutorEvent, TutorState> {
  final TutorUseCase _tutorUseCase;

  TutorBloc(this._tutorUseCase) : super(const TutorInitial()) {
    on<FetchTutor>(fetchTutors);
    on<RefreshTutor>(refreshTutor);
  }

  FutureOr<void> fetchTutors(FetchTutor event, Emitter<TutorState> emit) async {
    if (state.hasReachedMax) return;
    emit(
      TutorSuccess(
        currentPage: state.currentPage,
        isLoading: true,
        tutors: state.tutors,
        hasReachedMax: false,
      ),
    );
    List<Tutor>? tutors = await _tutorUseCase.getTutors(
        page: state.currentPage, perPage: event.perPage);
    emit(
      TutorSuccess(
        currentPage: state.currentPage + 1,
        isLoading: false,
        tutors: List<Tutor>.from(state.tutors ?? [])..addAll(tutors ?? []),
        hasReachedMax: (tutors == null || tutors.isEmpty) ? true : false,
      ),
    );
  }

  FutureOr<void> refreshTutor(
      RefreshTutor event, Emitter<TutorState> emit) async {
    emit(const TutorInitial(
      isLoading: true,
      hasReachedMax: false,
      currentPage: 1,
      ));
    List<Tutor>? tutors = await _tutorUseCase.getTutors(
        page: state.currentPage, perPage: event.perPage);
    emit(
      TutorSuccess(
        currentPage: state.currentPage + 1,
        isLoading: false,
        tutors: List<Tutor>.from(state.tutors ?? [])..addAll(tutors ?? []),
        hasReachedMax: (tutors == null || tutors.isEmpty) ? true : false,
      ),
    );
  }
}
