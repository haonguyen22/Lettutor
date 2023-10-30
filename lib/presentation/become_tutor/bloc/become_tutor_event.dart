part of 'become_tutor_bloc.dart';

@immutable
sealed class BecomeTutorEvent {}

final class BecomeTutor extends BecomeTutorEvent {
  final BecomeTutorRequest becomeTutorRequest;

  BecomeTutor({required this.becomeTutorRequest});
}

class UpdateBecomeTutorRequest extends BecomeTutorEvent {
  final BecomeTutorRequest becomeTutorRequest;

  UpdateBecomeTutorRequest({required this.becomeTutorRequest});
}
