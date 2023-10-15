import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:let_tutor/data/models/tutor/search_tutor_response.dart';
import 'package:let_tutor/domain/entities/tutor.dart';
import 'package:let_tutor/domain/usecase/tutor_usecase.dart';
import 'package:meta/meta.dart';

part 'search_tutor_event.dart';
part 'search_tutor_state.dart';

@injectable
class SearchTutorBloc extends Bloc<SearchTutorEvent, SearchTutorState> {
  final TutorUseCase _tutorUseCase;

  SearchTutorBloc(this._tutorUseCase) : super(const SearchTutorInitial()) {
    on<FetchSearchTutor>(fetchSearchTutor);
    on<FetchSearchTutorLoadMore>(fetchSearchTutorLoadMore);
    on<ResetSearchTutor>(resetSearchTutor);
  }

  FutureOr<void> fetchSearchTutor(
      FetchSearchTutor event, Emitter<SearchTutorState> emit) async {
    emit(SearchTutorInitial(
      isLoading: true,
      tutors: null,
      count: 0,
      page: state.page,
      perPage: state.perPage,
    ));

    SearchTutorsResponse? res =
        await _tutorUseCase.searchTutor(body: event.body..addAll({"page": 1}));
    List<Tutor>? tutors = res?.tutors?.map((e) => e.toEntity()).toList();

    emit(SearchTutorSuccess(
      isLoading: false,
      tutors: tutors,
      count: res?.count ?? 0,
      page: 1,
      perPage: state.perPage,
    ));
  }

  FutureOr<void> fetchSearchTutorLoadMore(
      FetchSearchTutorLoadMore event, Emitter<SearchTutorState> emit) async {
    if (state.hasReachedMax == true) return;
    emit(SearchTutorSuccess(
      isLoading: true,
      tutors: state.tutors,
      count: state.count,
      page: state.page,
      perPage: state.perPage,
      hasReachedMax: state.hasReachedMax,
    ));
    SearchTutorsResponse? res = await _tutorUseCase.searchTutor(
        body: event.body..addAll({"page": state.page + 1}));
    List<Tutor>? tutors = res?.tutors?.map((e) => e.toEntity()).toList();

    emit(SearchTutorSuccess(
      isLoading: false,
      tutors: List<Tutor>.from(state.tutors ?? [])..addAll(tutors ?? []),
      count: res?.count ?? 0,
      page: state.page + 1,
      perPage: state.perPage,
      hasReachedMax: (tutors?.isEmpty ?? false) ? true : false,
    ));
  }

  FutureOr<void> resetSearchTutor(
      ResetSearchTutor event, Emitter<SearchTutorState> emit) {
    emit(const SearchTutorInitial());
  }
}
