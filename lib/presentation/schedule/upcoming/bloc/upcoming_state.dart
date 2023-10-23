part of 'upcoming_bloc.dart';

@immutable
abstract class UpcomingState {
  final List<BookingInfoModel>? upcomingClasses;
  final bool isLoading;
  final bool isLoadingCancel;
  final String? message;

  const UpcomingState({
    this.upcomingClasses,
    this.isLoading = false,
    this.isLoadingCancel = false,
    this.message,
  });
}

class UpcomingInitial extends UpcomingState {
  const UpcomingInitial({
    super.upcomingClasses,
    super.isLoading,
    super.isLoadingCancel,
    super.message,
  });
}

class UpcomingSuccess extends UpcomingState {
  const UpcomingSuccess({
    super.upcomingClasses,
    super.isLoading,
    super.isLoadingCancel,
    super.message,
  });
}
