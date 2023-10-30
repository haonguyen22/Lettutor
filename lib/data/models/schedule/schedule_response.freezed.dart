// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'schedule_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ScheduleResponse _$ScheduleResponseFromJson(Map<String, dynamic> json) {
  return _ScheduleReponse.fromJson(json);
}

/// @nodoc
mixin _$ScheduleResponse {
  String? get message => throw _privateConstructorUsedError;
  List<ScheduleModel>? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ScheduleResponseCopyWith<ScheduleResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScheduleResponseCopyWith<$Res> {
  factory $ScheduleResponseCopyWith(
          ScheduleResponse value, $Res Function(ScheduleResponse) then) =
      _$ScheduleResponseCopyWithImpl<$Res, ScheduleResponse>;
  @useResult
  $Res call({String? message, List<ScheduleModel>? data});
}

/// @nodoc
class _$ScheduleResponseCopyWithImpl<$Res, $Val extends ScheduleResponse>
    implements $ScheduleResponseCopyWith<$Res> {
  _$ScheduleResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<ScheduleModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ScheduleReponseCopyWith<$Res>
    implements $ScheduleResponseCopyWith<$Res> {
  factory _$$_ScheduleReponseCopyWith(
          _$_ScheduleReponse value, $Res Function(_$_ScheduleReponse) then) =
      __$$_ScheduleReponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? message, List<ScheduleModel>? data});
}

/// @nodoc
class __$$_ScheduleReponseCopyWithImpl<$Res>
    extends _$ScheduleResponseCopyWithImpl<$Res, _$_ScheduleReponse>
    implements _$$_ScheduleReponseCopyWith<$Res> {
  __$$_ScheduleReponseCopyWithImpl(
      _$_ScheduleReponse _value, $Res Function(_$_ScheduleReponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_$_ScheduleReponse(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<ScheduleModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ScheduleReponse implements _ScheduleReponse {
  const _$_ScheduleReponse({this.message, final List<ScheduleModel>? data})
      : _data = data;

  factory _$_ScheduleReponse.fromJson(Map<String, dynamic> json) =>
      _$$_ScheduleReponseFromJson(json);

  @override
  final String? message;
  final List<ScheduleModel>? _data;
  @override
  List<ScheduleModel>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ScheduleResponse(message: $message, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ScheduleReponse &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, message, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ScheduleReponseCopyWith<_$_ScheduleReponse> get copyWith =>
      __$$_ScheduleReponseCopyWithImpl<_$_ScheduleReponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ScheduleReponseToJson(
      this,
    );
  }
}

abstract class _ScheduleReponse implements ScheduleResponse {
  const factory _ScheduleReponse(
      {final String? message,
      final List<ScheduleModel>? data}) = _$_ScheduleReponse;

  factory _ScheduleReponse.fromJson(Map<String, dynamic> json) =
      _$_ScheduleReponse.fromJson;

  @override
  String? get message;
  @override
  List<ScheduleModel>? get data;
  @override
  @JsonKey(ignore: true)
  _$$_ScheduleReponseCopyWith<_$_ScheduleReponse> get copyWith =>
      throw _privateConstructorUsedError;
}
