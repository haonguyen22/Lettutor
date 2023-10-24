part of 'become_tutor_bloc.dart';

@immutable
abstract class BecomeTutorState {
  final BecomeTutorRequest? becomeTutorRequest;

  const BecomeTutorState({this.becomeTutorRequest});
}

class BecomeTutorInitial extends BecomeTutorState {
  const BecomeTutorInitial({super.becomeTutorRequest});
}

class BecomeTutorLoading extends BecomeTutorState {
  const BecomeTutorLoading({super.becomeTutorRequest});
}

class BecomeTutorSuccess extends BecomeTutorState {
  const BecomeTutorSuccess({super.becomeTutorRequest});
}

final class BecomeTutorFailure extends BecomeTutorState {
  final String message;

  const BecomeTutorFailure(this.message, {super.becomeTutorRequest});
}
