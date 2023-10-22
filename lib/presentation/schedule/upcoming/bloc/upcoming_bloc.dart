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
  }

  FutureOr<void> _fetchUpcoming(
      FetchUpcoming event, Emitter<UpcomingState> emit) async {
    emit(UpcomingSuccess(
      upcomingClasses: state.upcomingClasses,
      isLoading: true,
    ));

    List<BookingInfoModel>? upcomingClasses =
        await _scheduleUseCase.getUpcomingClasses();

    emit(
      UpcomingSuccess(
        isLoading: false,
        upcomingClasses: upcomingClasses?.reversed.toList(),
      ),
    );
  }
}
