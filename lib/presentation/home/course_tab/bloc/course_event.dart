part of 'course_bloc.dart';

@immutable
abstract class CourseEvent {}

class FetchCourseEvent extends CourseEvent{
  final int perPage;
  final String search;
  FetchCourseEvent({
    this.perPage = 10,
    this.search = "",
  });
}

class RefreshCourseEvent extends CourseEvent {
  final int perPage;
  RefreshCourseEvent({
    this.perPage = 10,
  });
}
