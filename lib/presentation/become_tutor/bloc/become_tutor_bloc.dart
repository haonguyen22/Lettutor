import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:let_tutor/data/models/tutor/become_tutor_request.dart';
import 'package:let_tutor/domain/usecase/tutor_usecase.dart';
import 'package:meta/meta.dart';

part 'become_tutor_event.dart';
part 'become_tutor_state.dart';

@injectable
class BecomeTutorBloc extends Bloc<BecomeTutorEvent, BecomeTutorState> {
  final TutorUseCase _tutorUseCase;
  BecomeTutorBloc(
    this._tutorUseCase,
  ) : super(const BecomeTutorInitial()) {
    on<BecomeTutor>(_becomeTutorEvent);
    on<UpdateBecomeTutorRequest>(_updateBecomeTutorRequestEvent);
  }

  FutureOr<void> _becomeTutorEvent(
      BecomeTutor event, Emitter<BecomeTutorState> emit) async {
    emit(const BecomeTutorLoading());
    try {
      final bool isBecomeTutor = await _tutorUseCase.becomeTutor(
          becomeTutorRequest: event.becomeTutorRequest);
      if (isBecomeTutor) {
        emit(const BecomeTutorSuccess());
      } else {
        emit(const BecomeTutorFailure('Become tutor failed'));
      }
    } catch (e) {
      emit(BecomeTutorFailure(e.toString()));
    }
  }

  FutureOr<void> _updateBecomeTutorRequestEvent(
      UpdateBecomeTutorRequest event, Emitter<BecomeTutorState> emit) {
    emit(
      BecomeTutorInitial(
        becomeTutorRequest: mergeBecomeTutorRequest(
          state.becomeTutorRequest,
          event.becomeTutorRequest,
        ),
      ),
    );
  }
}
