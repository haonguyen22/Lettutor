import 'package:collection/collection.dart';
import 'package:let_tutor/dummy/data.dart';

extension ConvertDateTime on String {
  DateTime convertToDateTime() {
    List<int> dateParts = split("-").map(int.parse).toList();
    DateTime dateTime = DateTime(dateParts[0], dateParts[1], dateParts[2]);

    return dateTime;
  }

  List<String> toSpecialties() {
    return split(',')
            .map((s) => ((specialties.firstWhereOrNull(
                    (element) => element['key'] == s)?['name'] ??
                s) as String))
            .toList();
  }
}
