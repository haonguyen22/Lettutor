part of 'search_tutor_bloc.dart';

@immutable
abstract class SearchTutorEvent {
  const SearchTutorEvent();
}

class ResetSearchTutor extends SearchTutorEvent {}

class FetchSearchTutor extends SearchTutorEvent {
  final Map<String, dynamic> body;
  const FetchSearchTutor({
    required this.body,
  });
}

class FetchSearchTutorLoadMore extends SearchTutorEvent {
  final Map<String, dynamic> body;
  const FetchSearchTutorLoadMore({
    required this.body,
  });
}
