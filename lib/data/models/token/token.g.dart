// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Token _$$_TokenFromJson(Map<String, dynamic> json) => _$_Token(
      access: TokenInfo.fromJson(json['access'] as Map<String, dynamic>),
      refresh: TokenInfo.fromJson(json['refresh'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_TokenToJson(_$_Token instance) => <String, dynamic>{
      'access': instance.access,
      'refresh': instance.refresh,
    };

_$_TokenInfo _$$_TokenInfoFromJson(Map<String, dynamic> json) => _$_TokenInfo(
      token: json['token'] as String,
      expires: DateTime.parse(json['expires'] as String),
    );

Map<String, dynamic> _$$_TokenInfoToJson(_$_TokenInfo instance) =>
    <String, dynamic>{
      'token': instance.token,
      'expires': instance.expires.toIso8601String(),
    };
