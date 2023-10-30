class CancelBookedResponse {
  final String? message;
  final int? statusCode;

  CancelBookedResponse({
    this.message,
    this.statusCode,
  });

  factory CancelBookedResponse.fromJson(Map<String, dynamic> json) =>
      CancelBookedResponse(
        message: json['message'] as String?,
        statusCode: json['statusCode'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'message': message,
        'statusCode': statusCode,
      };
}
