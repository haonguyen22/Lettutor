part of 'tutor_bloc.dart';

@immutable
abstract class TutorEvent {}

class FetchTutor extends TutorEvent {
  final int perPage;
  FetchTutor({
    this.perPage = 10,
  });
}

class RefreshTutor extends TutorEvent {
  final int perPage;
  RefreshTutor({
    this.perPage = 10,
  });
}
