part of 'tutor_detail_bloc.dart';

@immutable
abstract class TutorDetailState {
  final bool isLoading;
  final Tutor? tutor;
  final String name;
  final List<ScheduleModel>? schedules;
  final bool isLoadingSchedule;

  const TutorDetailState({
    this.isLoading = false,
    this.tutor,
    this.name = "",
    this.schedules,
  this.isLoadingSchedule = false,
  });
}

final class TutorDetailInitial extends TutorDetailState {
  const TutorDetailInitial({
    super.isLoading,
    super.tutor,
    super.name,
    super.schedules,
    super.isLoadingSchedule,
  });
}

final class TutorDetailSuccess extends TutorDetailState {
  final bool processing;
  const TutorDetailSuccess({
    super.isLoading,
    super.tutor,
    super.name,
    this.processing = false,
    super.schedules,
    super.isLoadingSchedule,
  });
}

final class TutorDetailFailed extends TutorDetailState {
  const TutorDetailFailed({
    super.isLoading,
    super.tutor,
    super.name,
    super.schedules,
    super.isLoadingSchedule,
  });
}
