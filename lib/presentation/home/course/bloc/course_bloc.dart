import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:let_tutor/domain/entities/course.dart';
import 'package:let_tutor/domain/usecase/course_usecase.dart';
import 'package:meta/meta.dart';

part 'course_event.dart';
part 'course_state.dart';

@injectable
class CourseBloc extends Bloc<CourseEvent, CourseState> {
  final CourseUseCase _courseUseCase;

  CourseBloc(this._courseUseCase) : super(const CourseInitial()) {
    on<FetchCourseEvent>(_fetchCourseEvent);
    on<RefreshCourseEvent>(_refreshCourseEvent);
  }

  FutureOr<void> _fetchCourseEvent(
      FetchCourseEvent event, Emitter<CourseState> emit) async {
    if (state.hasReachedMax) return;

    emit(CourseSuccess(
      currentPage: state.currentPage,
      isLoading: true,
      courses: state.courses,
      hasReachedMax: false,
    ));
    List<Course>? courses = await _courseUseCase.getCoursesByPage(
        page: state.currentPage, perPage: event.perPage);

    emit(CourseSuccess(
      courses: List<Course>.from(state.courses ?? [])..addAll(courses ?? []),
      currentPage: state.currentPage + 1,
      hasReachedMax: (courses?.isEmpty ?? false) ? true : false,
      isLoading: false,
    ));
  }

  FutureOr<void> _refreshCourseEvent(
      RefreshCourseEvent event, Emitter<CourseState> emit) async {
    emit(const CourseInitial(isLoading: true));

    List<Course>? courses = await _courseUseCase.getCoursesByPage(
        page: state.currentPage, perPage: event.perPage);

    emit(CourseSuccess(
      courses: courses,
      currentPage: state.currentPage + 1,
      hasReachedMax: (courses?.isEmpty ?? false) ? true : false,
      isLoading: false,
    ));
  }
}
