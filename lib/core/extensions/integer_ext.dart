import 'package:intl/intl.dart';

extension FormatToDateTime on int {
  String toDateTime([String? newPattern, String? locale]) {
    return DateFormat(newPattern, locale)
        .format(DateTime.fromMillisecondsSinceEpoch(this));
  }

  String toyMMMEdFormat([String? locale]) {
    return DateFormat.yMMMEd(locale)
        .format(DateTime.fromMillisecondsSinceEpoch(this));
  }
}
