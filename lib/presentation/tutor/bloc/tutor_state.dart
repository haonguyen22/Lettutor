part of 'tutor_bloc.dart';

@immutable
abstract class TutorState {
  final List<Tutor>? tutors;
  final bool isLoading;
  final bool hasReachedMax;

  const TutorState({
    this.isLoading = false,
    this.tutors,
    this.hasReachedMax = false,
  });
}

class TutorInitial extends TutorState {
  const TutorInitial({
    super.isLoading,
    super.hasReachedMax,
  });
}

class TutorSuccess extends TutorState {
  const TutorSuccess({
    super.isLoading,
    super.tutors,
    super.hasReachedMax,
  });
}
