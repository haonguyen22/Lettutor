part of 'tutor_detail_bloc.dart';

@immutable
abstract class TutorDetailEvent {}

class FetchTutorByIdEvent extends TutorDetailEvent {}

class FavoriteTutorEvent extends TutorDetailEvent {}
