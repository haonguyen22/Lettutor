part of 'become_tutor_bloc.dart';

@immutable
abstract class BecomeTutorState {
  final BecomeTutorData? becomeTutorData;

  const BecomeTutorState({this.becomeTutorData});
}

class BecomeTutorInitial extends BecomeTutorState {
  const BecomeTutorInitial({super.becomeTutorData});
}

class BecomeTutorLoading extends BecomeTutorState {
  const BecomeTutorLoading({super.becomeTutorData});
}

class BecomeTutorSuccess extends BecomeTutorState {
  const BecomeTutorSuccess({super.becomeTutorData});
}

final class BecomeTutorFailure extends BecomeTutorState {
  final String message;

  const BecomeTutorFailure(this.message, {super.becomeTutorData});
}
