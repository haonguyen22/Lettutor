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
  }

  FutureOr<void> fetchTutors(FetchTutor event, Emitter<TutorState> emit) async {
    if (state.hasReachedMax) return;
    emit(
      TutorSuccess(
        isLoading: true,
        tutors: state.tutors,
      ),
    );
    List<Tutor>? tutors =
        await _tutorUseCase.getTutors(page: event.page, perPage: event.perPage);
    emit(
      TutorSuccess(
        isLoading: false,
        tutors: List<Tutor>.from(state.tutors ?? [])..addAll(tutors ?? []),
        hasReachedMax: (tutors == null || tutors.isEmpty) ? true : false,
      ),
    );
  }
}
