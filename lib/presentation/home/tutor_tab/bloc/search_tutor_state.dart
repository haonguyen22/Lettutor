part of 'search_tutor_bloc.dart';

@immutable
abstract class SearchTutorState {
  final List<Tutor>? tutors;
  final bool isLoading;
  final int count;
  final int page;
  final int perPage;
  final bool hasReachedMax;

  const SearchTutorState({
    this.isLoading = false,
    this.tutors,
    this.count = 0,
    this.page = 1,
    this.perPage = 10,
    this.hasReachedMax = false,
  });
}

class SearchTutorInitial extends SearchTutorState {
  const SearchTutorInitial({
    super.isLoading,
    super.tutors,
    super.count,
    super.page,
    super.perPage,
  });
}

class SearchTutorSuccess extends SearchTutorState {
  const SearchTutorSuccess({
    super.isLoading,
    super.tutors,
    super.count,
    super.page,
    super.perPage,
    super.hasReachedMax,
  });
}
