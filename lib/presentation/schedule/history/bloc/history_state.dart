part of 'history_bloc.dart';

@immutable
abstract class HistoryState {
  final int currentPage;
  final List<BookingInfoModel>? bookedClasses;
  final bool isLoading;
  final bool hasReachMax;
  const HistoryState({
    this.bookedClasses,
    this.currentPage = 1,
    this.isLoading = false,
    this.hasReachMax = false,
  });
}

class HistoryInitial extends HistoryState {
  const HistoryInitial({
    super.bookedClasses,
    super.currentPage,
    super.isLoading,
    super.hasReachMax,
  });
}

class HistorySuccess extends HistoryState {
  const HistorySuccess({
    super.bookedClasses,
    super.currentPage,
    super.isLoading,
    super.hasReachMax,
  });
}
