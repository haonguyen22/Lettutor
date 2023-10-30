import 'package:let_tutor/data/models/tutor/tutor_model.dart';

class TutorsResponse {
  final int count;
  final List<TutorModel>? tutors;

  TutorsResponse(this.count, this.tutors);

  factory TutorsResponse.fromJson(Map<String, dynamic> json) {
    final data = json["tutors"];
    if (data == null) return TutorsResponse(0, null);
    return TutorsResponse(
      data["count"],
      data["rows"] != null
          ? (data["rows"] as List<dynamic>)
              .map((e) => TutorModel.fromJson(e))
              .toList()
          : null,
    );
  }
}
