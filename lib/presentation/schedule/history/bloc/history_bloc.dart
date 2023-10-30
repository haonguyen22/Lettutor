import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:let_tutor/data/models/schedule/booking_info_model.dart';
import 'package:let_tutor/domain/usecase/schedule_usecase.dart';
import 'package:meta/meta.dart';

part 'history_event.dart';
part 'history_state.dart';

@injectable
class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  final ScheduleUseCase _scheduleUseCase;
  HistoryBloc(this._scheduleUseCase) : super(const HistoryInitial()) {
    on<FetchHistoryPagination>(_fetchHistory);
    on<RefreshHistoryPagination>(_refreshHistory);
  }

  FutureOr<void> _fetchHistory(
      FetchHistoryPagination event, Emitter<HistoryState> emit) async {
    if (state.hasReachMax) return;
    if (state is HistoryInitial) {
      emit(const HistoryInitial(isLoading: true, currentPage: 1));
    } else {
      emit(HistorySuccess(
          bookedClasses: state.bookedClasses,
          currentPage: state.currentPage,
          hasReachMax: state.hasReachMax,
          isLoading: true));
    }
    List<BookingInfoModel>? bookedClasses =
        await _scheduleUseCase.getBookedClasses(page: state.currentPage);
    emit(
      HistorySuccess(
        isLoading: false,
        bookedClasses: List<BookingInfoModel>.from(state.bookedClasses ?? [])
          ..addAll(bookedClasses ?? []),
        currentPage: state.currentPage + 1,
        hasReachMax: (bookedClasses?.isEmpty ?? true),
      ),
    );
  }

  FutureOr<void> _refreshHistory(
      RefreshHistoryPagination event, Emitter<HistoryState> emit) async {
    emit(const HistoryInitial(isLoading: true, currentPage: 1));

    List<BookingInfoModel>? bookedClasses =
        await _scheduleUseCase.getBookedClasses(page: state.currentPage);
    emit(
      HistorySuccess(
        isLoading: false,
        bookedClasses: List<BookingInfoModel>.from(state.bookedClasses ?? [])
          ..addAll(bookedClasses ?? []),
        currentPage: state.currentPage + 1,
        hasReachMax: (bookedClasses?.isEmpty ?? true),
      ),
    );
  }
}
