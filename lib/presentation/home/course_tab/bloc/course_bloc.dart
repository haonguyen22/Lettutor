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
    final page = state.search != event.search ? 1 : state.currentPage;
    final newCourses =
        state.search != event.search ? <Course>[] : state.courses;

    emit(CourseSuccess(
      currentPage: page,
      isLoading: true,
      courses: newCourses,
      hasReachedMax: false,
      search: event.search,
    ));
    List<Course>? courses = await _courseUseCase.getCoursesByPage(
        page: page, perPage: event.perPage, search: event.search);

    emit(CourseSuccess(
      courses: List<Course>.from(state.courses ?? [])..addAll(courses ?? []),
      currentPage: page + 1,
      hasReachedMax: (courses?.isEmpty ?? false) ? true : false,
      isLoading: false,
      search: event.search,
    ));
  }

  FutureOr<void> _refreshCourseEvent(
      RefreshCourseEvent event, Emitter<CourseState> emit) async {
    emit(CourseInitial(
      isLoading: true,
      search: state.search,
      currentPage: 1,
      hasReachedMax: false,
    ));

    List<Course>? courses = await _courseUseCase.getCoursesByPage(
        page: state.currentPage, perPage: event.perPage, search: state.search);

    emit(CourseSuccess(
      courses: courses,
      currentPage: state.currentPage + 1,
      hasReachedMax: (courses?.isEmpty ?? false) ? true : false,
      isLoading: false,
      search: state.search,
    ));
  }
}
