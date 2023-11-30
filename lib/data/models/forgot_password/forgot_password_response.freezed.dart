// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forgot_password_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ForgotPasswordResponse _$ForgotPasswordResponseFromJson(
    Map<String, dynamic> json) {
  return _ForgotPasswordResponse.fromJson(json);
}

/// @nodoc
mixin _$ForgotPasswordResponse {
  int get statusCode => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  int? get internalCode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ForgotPasswordResponseCopyWith<ForgotPasswordResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForgotPasswordResponseCopyWith<$Res> {
  factory $ForgotPasswordResponseCopyWith(ForgotPasswordResponse value,
          $Res Function(ForgotPasswordResponse) then) =
      _$ForgotPasswordResponseCopyWithImpl<$Res, ForgotPasswordResponse>;
  @useResult
  $Res call({int statusCode, String message, int? internalCode});
}

/// @nodoc
class _$ForgotPasswordResponseCopyWithImpl<$Res,
        $Val extends ForgotPasswordResponse>
    implements $ForgotPasswordResponseCopyWith<$Res> {
  _$ForgotPasswordResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusCode = null,
    Object? message = null,
    Object? internalCode = freezed,
  }) {
    return _then(_value.copyWith(
      statusCode: null == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      internalCode: freezed == internalCode
          ? _value.internalCode
          : internalCode // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ForgotPasswordResponseCopyWith<$Res>
    implements $ForgotPasswordResponseCopyWith<$Res> {
  factory _$$_ForgotPasswordResponseCopyWith(_$_ForgotPasswordResponse value,
          $Res Function(_$_ForgotPasswordResponse) then) =
      __$$_ForgotPasswordResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int statusCode, String message, int? internalCode});
}

/// @nodoc
class __$$_ForgotPasswordResponseCopyWithImpl<$Res>
    extends _$ForgotPasswordResponseCopyWithImpl<$Res,
        _$_ForgotPasswordResponse>
    implements _$$_ForgotPasswordResponseCopyWith<$Res> {
  __$$_ForgotPasswordResponseCopyWithImpl(_$_ForgotPasswordResponse _value,
      $Res Function(_$_ForgotPasswordResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusCode = null,
    Object? message = null,
    Object? internalCode = freezed,
  }) {
    return _then(_$_ForgotPasswordResponse(
      statusCode: null == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      internalCode: freezed == internalCode
          ? _value.internalCode
          : internalCode // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ForgotPasswordResponse implements _ForgotPasswordResponse {
  const _$_ForgotPasswordResponse(
      {this.statusCode = 200, required this.message, this.internalCode});

  factory _$_ForgotPasswordResponse.fromJson(Map<String, dynamic> json) =>
      _$$_ForgotPasswordResponseFromJson(json);

  @override
  @JsonKey()
  final int statusCode;
  @override
  final String message;
  @override
  final int? internalCode;

  @override
  String toString() {
    return 'ForgotPasswordResponse(statusCode: $statusCode, message: $message, internalCode: $internalCode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ForgotPasswordResponse &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.internalCode, internalCode) ||
                other.internalCode == internalCode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, statusCode, message, internalCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ForgotPasswordResponseCopyWith<_$_ForgotPasswordResponse> get copyWith =>
      __$$_ForgotPasswordResponseCopyWithImpl<_$_ForgotPasswordResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ForgotPasswordResponseToJson(
      this,
    );
  }
}

abstract class _ForgotPasswordResponse implements ForgotPasswordResponse {
  const factory _ForgotPasswordResponse(
      {final int statusCode,
      required final String message,
      final int? internalCode}) = _$_ForgotPasswordResponse;

  factory _ForgotPasswordResponse.fromJson(Map<String, dynamic> json) =
      _$_ForgotPasswordResponse.fromJson;

  @override
  int get statusCode;
  @override
  String get message;
  @override
  int? get internalCode;
  @override
  @JsonKey(ignore: true)
  _$$_ForgotPasswordResponseCopyWith<_$_ForgotPasswordResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
