import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:let_tutor/data/models/tutor/become_tutor_data.dart';
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
    on<SendBecomeTutorEvent>(_becomeTutorEvent);
    on<UpdateInformationEvent>(_updateBecomeTutorRequestEvent);
  }

  FutureOr<void> _becomeTutorEvent(
    SendBecomeTutorEvent event,
    Emitter<BecomeTutorState> emit,
  ) async {
    emit(BecomeTutorLoading(becomeTutorData: state.becomeTutorData));

    if (state.becomeTutorData == null) {
      emit(
        BecomeTutorFailure(
          'Become tutor failed',
          becomeTutorData: state.becomeTutorData,
        ),
      );
      return;
    }

    final isBecomeTutor = await _tutorUseCase.becomeTutor(
        becomeTutorData: state.becomeTutorData!);
    if (isBecomeTutor) {
      emit(BecomeTutorSuccess(becomeTutorData: state.becomeTutorData));
    } else {
      emit(
        BecomeTutorFailure(
          'Become tutor failed',
          becomeTutorData: state.becomeTutorData,
        ),
      );
    }
  }

  FutureOr<void> _updateBecomeTutorRequestEvent(
      UpdateInformationEvent event, Emitter<BecomeTutorState> emit) {
    emit(
      BecomeTutorInitial(
        becomeTutorData: mergeBecomeTutorData(
          state.becomeTutorData,
          event.becomeTutorData,
        ),
      ),
    );
  }
}
