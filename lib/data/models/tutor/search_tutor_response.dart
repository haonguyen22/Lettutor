import 'package:let_tutor/data/models/tutor/tutor_model.dart';

class SearchTutorsResponse {
  final int count;
  final List<TutorModel>? tutors;

  SearchTutorsResponse(this.count, this.tutors);

  factory SearchTutorsResponse.fromJson(Map<String, dynamic> json) {
    final data = json["rows"];
    if (data == null) return SearchTutorsResponse(0, null);
    return SearchTutorsResponse(
      data["count"],
      data["rows"] != null
          ? (data["rows"] as List<dynamic>)
              .map((e) => TutorModel.fromJson(e))
              .toList()
          : null,
    );
  }
}
