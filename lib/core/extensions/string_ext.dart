extension ConvertDateTime on String {
  DateTime convertToDateTime() {
    List<int> dateParts = split("-").map(int.parse).toList();
    DateTime dateTime = DateTime(dateParts[0], dateParts[1], dateParts[2]);

    return dateTime;
  }
}
