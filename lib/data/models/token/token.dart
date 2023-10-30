import 'package:freezed_annotation/freezed_annotation.dart';
part 'token.freezed.dart';
part 'token.g.dart';

@freezed
class Token with _$Token {
  const factory Token({
    required TokenInfo access,
    required TokenInfo refresh,
  }) = _Token;

  factory Token.fromJson(Map<String, Object?> json) => _$TokenFromJson(json);
}

@freezed
class TokenInfo with _$TokenInfo {
  const factory TokenInfo({
    required String token,
    required DateTime expires,
  }) = _TokenInfo;

  factory TokenInfo.fromJson(Map<String, Object?> json) =>
      _$TokenInfoFromJson(json);
}
