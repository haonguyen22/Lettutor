import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'search_tutor_event.dart';
part 'search_tutor_state.dart';

class SearchTutorBloc extends Bloc<SearchTutorEvent, SearchTutorState> {
  SearchTutorBloc() : super(SearchTutorInitial()) {
    on<SearchTutorEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
