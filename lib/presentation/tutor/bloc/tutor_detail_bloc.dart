import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'tutor_detail_event.dart';
part 'tutor_detail_state.dart';

class TutorDetailBloc extends Bloc<TutorDetailEvent, TutorDetailState> {
  TutorDetailBloc() : super(TutorDetailInitial()) {
    on<TutorDetailEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
