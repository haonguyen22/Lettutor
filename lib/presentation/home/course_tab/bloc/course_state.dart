part of 'course_bloc.dart';

@immutable
abstract class CourseState {
  final List<Course>? courses;
  final bool isLoading;
  final bool hasReachedMax;
  final int currentPage;
  final String search;

  const CourseState({
    this.isLoading = false,
    this.courses,
    this.hasReachedMax = false,
    this.currentPage = 1,
    this.search = "",
  });
}

class CourseInitial extends CourseState {
  const CourseInitial({
    super.isLoading,
    super.hasReachedMax,
    super.currentPage,
    super.search,
  });
}

class CourseSuccess extends CourseState {
  const CourseSuccess({
    super.isLoading,
    super.courses,
    super.hasReachedMax,
    super.currentPage,
    super.search,
  });
}
