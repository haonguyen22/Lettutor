import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'become_tutor_event.dart';
part 'become_tutor_state.dart';

class BecomeTutorBloc extends Bloc<BecomeTutorEvent, BecomeTutorState> {
  BecomeTutorBloc() : super(BecomeTutorInitial()) {
    on<BecomeTutorEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
