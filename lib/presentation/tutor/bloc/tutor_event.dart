part of 'tutor_bloc.dart';

@immutable
abstract class TutorEvent {}

class FetchTutor extends TutorEvent {
  final int page;
  final int perPage;
  FetchTutor({
    this.perPage = 10,
    required this.page,
  });
}
