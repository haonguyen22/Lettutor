part of 'tutor_bloc.dart';

@immutable
abstract class TutorState {
  final List<Tutor>? tutors;
  final bool isLoading;
  final bool hasReachedMax;
  final int currentPage;

  const TutorState({
    this.isLoading = false,
    this.tutors,
    this.hasReachedMax = false,
    this.currentPage = 1,
  });
}

class TutorInitial extends TutorState {
  const TutorInitial({
    super.isLoading,
    super.hasReachedMax,
    super.currentPage,
  });
}

class TutorSuccess extends TutorState {
  const TutorSuccess({
    super.isLoading,
    super.tutors,
    super.hasReachedMax,
    super.currentPage,
  });
}
