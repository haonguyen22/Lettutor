part of 'upcoming_bloc.dart';

@immutable
abstract class UpcomingEvent {}

class FetchUpcoming extends UpcomingEvent {}

class CancelUpcomingClassEvent extends UpcomingEvent {
  final String scheduleDetailId;

  CancelUpcomingClassEvent({
    required this.scheduleDetailId,
  });
}
