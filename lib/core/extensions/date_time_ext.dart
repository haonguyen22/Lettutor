extension DateTimeExtension on DateTime {
  bool isLessMoreThanNHours(DateTime time, double hour) {
    return time.difference(this).inHours * 1.0 > hour;
  }
}
