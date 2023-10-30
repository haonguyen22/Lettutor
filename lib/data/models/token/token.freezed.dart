// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'token.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Token _$TokenFromJson(Map<String, dynamic> json) {
  return _Token.fromJson(json);
}

/// @nodoc
mixin _$Token {
  TokenInfo get access => throw _privateConstructorUsedError;
  TokenInfo get refresh => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TokenCopyWith<Token> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TokenCopyWith<$Res> {
  factory $TokenCopyWith(Token value, $Res Function(Token) then) =
      _$TokenCopyWithImpl<$Res, Token>;
  @useResult
  $Res call({TokenInfo access, TokenInfo refresh});

  $TokenInfoCopyWith<$Res> get access;
  $TokenInfoCopyWith<$Res> get refresh;
}

/// @nodoc
class _$TokenCopyWithImpl<$Res, $Val extends Token>
    implements $TokenCopyWith<$Res> {
  _$TokenCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? access = null,
    Object? refresh = null,
  }) {
    return _then(_value.copyWith(
      access: null == access
          ? _value.access
          : access // ignore: cast_nullable_to_non_nullable
              as TokenInfo,
      refresh: null == refresh
          ? _value.refresh
          : refresh // ignore: cast_nullable_to_non_nullable
              as TokenInfo,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TokenInfoCopyWith<$Res> get access {
    return $TokenInfoCopyWith<$Res>(_value.access, (value) {
      return _then(_value.copyWith(access: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $TokenInfoCopyWith<$Res> get refresh {
    return $TokenInfoCopyWith<$Res>(_value.refresh, (value) {
      return _then(_value.copyWith(refresh: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_TokenCopyWith<$Res> implements $TokenCopyWith<$Res> {
  factory _$$_TokenCopyWith(_$_Token value, $Res Function(_$_Token) then) =
      __$$_TokenCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({TokenInfo access, TokenInfo refresh});

  @override
  $TokenInfoCopyWith<$Res> get access;
  @override
  $TokenInfoCopyWith<$Res> get refresh;
}

/// @nodoc
class __$$_TokenCopyWithImpl<$Res> extends _$TokenCopyWithImpl<$Res, _$_Token>
    implements _$$_TokenCopyWith<$Res> {
  __$$_TokenCopyWithImpl(_$_Token _value, $Res Function(_$_Token) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? access = null,
    Object? refresh = null,
  }) {
    return _then(_$_Token(
      access: null == access
          ? _value.access
          : access // ignore: cast_nullable_to_non_nullable
              as TokenInfo,
      refresh: null == refresh
          ? _value.refresh
          : refresh // ignore: cast_nullable_to_non_nullable
              as TokenInfo,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Token implements _Token {
  const _$_Token({required this.access, required this.refresh});

  factory _$_Token.fromJson(Map<String, dynamic> json) =>
      _$$_TokenFromJson(json);

  @override
  final TokenInfo access;
  @override
  final TokenInfo refresh;

  @override
  String toString() {
    return 'Token(access: $access, refresh: $refresh)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Token &&
            (identical(other.access, access) || other.access == access) &&
            (identical(other.refresh, refresh) || other.refresh == refresh));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, access, refresh);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TokenCopyWith<_$_Token> get copyWith =>
      __$$_TokenCopyWithImpl<_$_Token>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TokenToJson(
      this,
    );
  }
}

abstract class _Token implements Token {
  const factory _Token(
      {required final TokenInfo access,
      required final TokenInfo refresh}) = _$_Token;

  factory _Token.fromJson(Map<String, dynamic> json) = _$_Token.fromJson;

  @override
  TokenInfo get access;
  @override
  TokenInfo get refresh;
  @override
  @JsonKey(ignore: true)
  _$$_TokenCopyWith<_$_Token> get copyWith =>
      throw _privateConstructorUsedError;
}

TokenInfo _$TokenInfoFromJson(Map<String, dynamic> json) {
  return _TokenInfo.fromJson(json);
}

/// @nodoc
mixin _$TokenInfo {
  String get token => throw _privateConstructorUsedError;
  DateTime get expires => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TokenInfoCopyWith<TokenInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TokenInfoCopyWith<$Res> {
  factory $TokenInfoCopyWith(TokenInfo value, $Res Function(TokenInfo) then) =
      _$TokenInfoCopyWithImpl<$Res, TokenInfo>;
  @useResult
  $Res call({String token, DateTime expires});
}

/// @nodoc
class _$TokenInfoCopyWithImpl<$Res, $Val extends TokenInfo>
    implements $TokenInfoCopyWith<$Res> {
  _$TokenInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
    Object? expires = null,
  }) {
    return _then(_value.copyWith(
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      expires: null == expires
          ? _value.expires
          : expires // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TokenInfoCopyWith<$Res> implements $TokenInfoCopyWith<$Res> {
  factory _$$_TokenInfoCopyWith(
          _$_TokenInfo value, $Res Function(_$_TokenInfo) then) =
      __$$_TokenInfoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String token, DateTime expires});
}

/// @nodoc
class __$$_TokenInfoCopyWithImpl<$Res>
    extends _$TokenInfoCopyWithImpl<$Res, _$_TokenInfo>
    implements _$$_TokenInfoCopyWith<$Res> {
  __$$_TokenInfoCopyWithImpl(
      _$_TokenInfo _value, $Res Function(_$_TokenInfo) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
    Object? expires = null,
  }) {
    return _then(_$_TokenInfo(
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      expires: null == expires
          ? _value.expires
          : expires // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TokenInfo implements _TokenInfo {
  const _$_TokenInfo({required this.token, required this.expires});

  factory _$_TokenInfo.fromJson(Map<String, dynamic> json) =>
      _$$_TokenInfoFromJson(json);

  @override
  final String token;
  @override
  final DateTime expires;

  @override
  String toString() {
    return 'TokenInfo(token: $token, expires: $expires)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TokenInfo &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.expires, expires) || other.expires == expires));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, token, expires);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TokenInfoCopyWith<_$_TokenInfo> get copyWith =>
      __$$_TokenInfoCopyWithImpl<_$_TokenInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TokenInfoToJson(
      this,
    );
  }
}

abstract class _TokenInfo implements TokenInfo {
  const factory _TokenInfo(
      {required final String token,
      required final DateTime expires}) = _$_TokenInfo;

  factory _TokenInfo.fromJson(Map<String, dynamic> json) =
      _$_TokenInfo.fromJson;

  @override
  String get token;
  @override
  DateTime get expires;
  @override
  @JsonKey(ignore: true)
  _$$_TokenInfoCopyWith<_$_TokenInfo> get copyWith =>
      throw _privateConstructorUsedError;
}
