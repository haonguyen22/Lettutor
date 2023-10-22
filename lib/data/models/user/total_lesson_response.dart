class TotalLessonResponse {
  int? total;

  TotalLessonResponse({this.total});

  TotalLessonResponse.fromJson(Map<String, dynamic> json) {
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['total'] = total;
    return data;
  }
}
