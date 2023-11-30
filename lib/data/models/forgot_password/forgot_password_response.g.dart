// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forgot_password_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ForgotPasswordResponse _$$_ForgotPasswordResponseFromJson(
        Map<String, dynamic> json) =>
    _$_ForgotPasswordResponse(
      statusCode: json['statusCode'] as int? ?? 200,
      message: json['message'] as String,
      internalCode: json['internalCode'] as int?,
    );

Map<String, dynamic> _$$_ForgotPasswordResponseToJson(
        _$_ForgotPasswordResponse instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'internalCode': instance.internalCode,
    };
