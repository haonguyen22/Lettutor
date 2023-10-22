part of 'tutor_detail_bloc.dart';

@immutable
abstract class TutorDetailEvent {}

class FetchTutorByIdEvent extends TutorDetailEvent {}

class FavoriteTutorEvent extends TutorDetailEvent {}

class ReportTutorEvent extends TutorDetailEvent {
  final String tutorId;
  final String content;
  final VoidCallback onSuccess;
  ReportTutorEvent({
    required this.tutorId,
    required this.content,
    required this.onSuccess,
  });
}

class FetchScheduleByTutorIdEvent extends TutorDetailEvent {
  FetchScheduleByTutorIdEvent();
}
