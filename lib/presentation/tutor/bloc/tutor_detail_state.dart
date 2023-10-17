part of 'tutor_detail_bloc.dart';

@immutable
abstract class TutorDetailState {
  final bool isLoading;
  final Tutor? tutor;
  final String name;

  const TutorDetailState({
    this.isLoading = false,
    this.tutor,
    this.name = "",
  });
}

final class TutorDetailInitial extends TutorDetailState {
  const TutorDetailInitial({
    super.isLoading,
    super.tutor,
    super.name,
  });
}

final class TutorDetailSuccess extends TutorDetailState {
  final bool processing;
  const TutorDetailSuccess({
    super.isLoading,
    super.tutor,
    super.name,
    this.processing = false,
  });
}

final class TutorDetailFailed extends TutorDetailState {
  const TutorDetailFailed({
    super.isLoading,
    super.tutor,
    super.name,
  });
}
