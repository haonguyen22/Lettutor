import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:let_tutor/data/models/schedule/booking_info_model.dart';
import 'package:let_tutor/domain/usecase/schedule_usecase.dart';
import 'package:meta/meta.dart';

part 'upcoming_event.dart';
part 'upcoming_state.dart';

@injectable
class UpcomingBloc extends Bloc<UpcomingEvent, UpcomingState> {
  final ScheduleUseCase _scheduleUseCase;

  UpcomingBloc(
    this._scheduleUseCase,
  ) : super(const UpcomingInitial()) {
    on<FetchUpcoming>(_fetchUpcoming);
    on<CancelUpcomingClassEvent>(_cancelUpcomingClassEvent);
  }

  FutureOr<void> _fetchUpcoming(
      FetchUpcoming event, Emitter<UpcomingState> emit) async {
    emit(const UpcomingInitial(isLoading: true));

    List<BookingInfoModel>? upcomingClasses =
        await _scheduleUseCase.getUpcomingClasses();

    emit(
      UpcomingSuccess(
        isLoading: false,
        upcomingClasses: upcomingClasses?.reversed.toList(),
      ),
    );
  }

  FutureOr<void> _cancelUpcomingClassEvent(
      CancelUpcomingClassEvent event, Emitter<UpcomingState> emit) async {
    emit(UpcomingSuccess(
      upcomingClasses: state.upcomingClasses,
      isLoading: false,
      isLoadingCancel: true,
    ));

    String? message = await _scheduleUseCase.cancelBookedClass(
      scheduleDetailIds: [event.scheduleDetailId],
    );

    List<BookingInfoModel>? upcomingClasses =
        await _scheduleUseCase.getUpcomingClasses();

    emit(
      UpcomingSuccess(
        isLoading: false,
        upcomingClasses: upcomingClasses?.reversed.toList(),
        isLoadingCancel: false,
        message: message,
      ),
    );
  }
}
