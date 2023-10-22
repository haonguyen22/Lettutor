part of 'upcoming_bloc.dart';

@immutable
abstract class UpcomingState {
  final List<BookingInfoModel>? upcomingClasses;
  final bool isLoading;
  final BookingInfoModel? upcomingNearestClass;

  const UpcomingState({
    this.upcomingClasses,
    this.isLoading = false,
    this.upcomingNearestClass,
  });
}

class UpcomingInitial extends UpcomingState {
  const UpcomingInitial({
    super.upcomingClasses,
    super.isLoading,
    super.upcomingNearestClass,
  });
}

class UpcomingSuccess extends UpcomingState {
  const UpcomingSuccess({
    super.upcomingClasses,
    super.isLoading,
    super.upcomingNearestClass,
  });
}
