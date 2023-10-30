part of 'history_bloc.dart';

@immutable
abstract class HistoryEvent {}

class FetchHistoryPagination extends HistoryEvent {}

class RefreshHistoryPagination extends HistoryEvent {}
