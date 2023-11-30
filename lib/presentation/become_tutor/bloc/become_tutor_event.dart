part of 'become_tutor_bloc.dart';

@immutable
abstract class BecomeTutorEvent {
  const BecomeTutorEvent();
}

class SendBecomeTutorEvent extends BecomeTutorEvent {
  const SendBecomeTutorEvent();
}

class UpdateInformationEvent extends BecomeTutorEvent {
  final BecomeTutorData becomeTutorData;
  const UpdateInformationEvent({required this.becomeTutorData});
}
