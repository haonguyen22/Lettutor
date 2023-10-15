// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'course_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CourseResponse _$CourseResponseFromJson(Map<String, dynamic> json) {
  return _CourseResponse.fromJson(json);
}

/// @nodoc
mixin _$CourseResponse {
  String? get messages => throw _privateConstructorUsedError;
  DataResponse? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CourseResponseCopyWith<CourseResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CourseResponseCopyWith<$Res> {
  factory $CourseResponseCopyWith(
          CourseResponse value, $Res Function(CourseResponse) then) =
      _$CourseResponseCopyWithImpl<$Res, CourseResponse>;
  @useResult
  $Res call({String? messages, DataResponse? data});

  $DataResponseCopyWith<$Res>? get data;
}

/// @nodoc
class _$CourseResponseCopyWithImpl<$Res, $Val extends CourseResponse>
    implements $CourseResponseCopyWith<$Res> {
  _$CourseResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? messages = freezed,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      messages: freezed == messages
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as DataResponse?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DataResponseCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $DataResponseCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_CourseResponseCopyWith<$Res>
    implements $CourseResponseCopyWith<$Res> {
  factory _$$_CourseResponseCopyWith(
          _$_CourseResponse value, $Res Function(_$_CourseResponse) then) =
      __$$_CourseResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? messages, DataResponse? data});

  @override
  $DataResponseCopyWith<$Res>? get data;
}

/// @nodoc
class __$$_CourseResponseCopyWithImpl<$Res>
    extends _$CourseResponseCopyWithImpl<$Res, _$_CourseResponse>
    implements _$$_CourseResponseCopyWith<$Res> {
  __$$_CourseResponseCopyWithImpl(
      _$_CourseResponse _value, $Res Function(_$_CourseResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? messages = freezed,
    Object? data = freezed,
  }) {
    return _then(_$_CourseResponse(
      messages: freezed == messages
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as DataResponse?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CourseResponse extends _CourseResponse {
  const _$_CourseResponse({this.messages, this.data}) : super._();

  factory _$_CourseResponse.fromJson(Map<String, dynamic> json) =>
      _$$_CourseResponseFromJson(json);

  @override
  final String? messages;
  @override
  final DataResponse? data;

  @override
  String toString() {
    return 'CourseResponse(messages: $messages, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CourseResponse &&
            (identical(other.messages, messages) ||
                other.messages == messages) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, messages, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CourseResponseCopyWith<_$_CourseResponse> get copyWith =>
      __$$_CourseResponseCopyWithImpl<_$_CourseResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CourseResponseToJson(
      this,
    );
  }
}

abstract class _CourseResponse extends CourseResponse {
  const factory _CourseResponse(
      {final String? messages, final DataResponse? data}) = _$_CourseResponse;
  const _CourseResponse._() : super._();

  factory _CourseResponse.fromJson(Map<String, dynamic> json) =
      _$_CourseResponse.fromJson;

  @override
  String? get messages;
  @override
  DataResponse? get data;
  @override
  @JsonKey(ignore: true)
  _$$_CourseResponseCopyWith<_$_CourseResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

DataResponse _$DataResponseFromJson(Map<String, dynamic> json) {
  return _DataResponse.fromJson(json);
}

/// @nodoc
mixin _$DataResponse {
  int? get count => throw _privateConstructorUsedError;
  List<CourseModel>? get rows => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DataResponseCopyWith<DataResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataResponseCopyWith<$Res> {
  factory $DataResponseCopyWith(
          DataResponse value, $Res Function(DataResponse) then) =
      _$DataResponseCopyWithImpl<$Res, DataResponse>;
  @useResult
  $Res call({int? count, List<CourseModel>? rows});
}

/// @nodoc
class _$DataResponseCopyWithImpl<$Res, $Val extends DataResponse>
    implements $DataResponseCopyWith<$Res> {
  _$DataResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = freezed,
    Object? rows = freezed,
  }) {
    return _then(_value.copyWith(
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
      rows: freezed == rows
          ? _value.rows
          : rows // ignore: cast_nullable_to_non_nullable
              as List<CourseModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DataResponseCopyWith<$Res>
    implements $DataResponseCopyWith<$Res> {
  factory _$$_DataResponseCopyWith(
          _$_DataResponse value, $Res Function(_$_DataResponse) then) =
      __$$_DataResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? count, List<CourseModel>? rows});
}

/// @nodoc
class __$$_DataResponseCopyWithImpl<$Res>
    extends _$DataResponseCopyWithImpl<$Res, _$_DataResponse>
    implements _$$_DataResponseCopyWith<$Res> {
  __$$_DataResponseCopyWithImpl(
      _$_DataResponse _value, $Res Function(_$_DataResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = freezed,
    Object? rows = freezed,
  }) {
    return _then(_$_DataResponse(
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
      rows: freezed == rows
          ? _value._rows
          : rows // ignore: cast_nullable_to_non_nullable
              as List<CourseModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DataResponse implements _DataResponse {
  const _$_DataResponse({this.count, final List<CourseModel>? rows})
      : _rows = rows;

  factory _$_DataResponse.fromJson(Map<String, dynamic> json) =>
      _$$_DataResponseFromJson(json);

  @override
  final int? count;
  final List<CourseModel>? _rows;
  @override
  List<CourseModel>? get rows {
    final value = _rows;
    if (value == null) return null;
    if (_rows is EqualUnmodifiableListView) return _rows;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'DataResponse(count: $count, rows: $rows)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DataResponse &&
            (identical(other.count, count) || other.count == count) &&
            const DeepCollectionEquality().equals(other._rows, _rows));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, count, const DeepCollectionEquality().hash(_rows));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DataResponseCopyWith<_$_DataResponse> get copyWith =>
      __$$_DataResponseCopyWithImpl<_$_DataResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DataResponseToJson(
      this,
    );
  }
}

abstract class _DataResponse implements DataResponse {
  const factory _DataResponse(
      {final int? count, final List<CourseModel>? rows}) = _$_DataResponse;

  factory _DataResponse.fromJson(Map<String, dynamic> json) =
      _$_DataResponse.fromJson;

  @override
  int? get count;
  @override
  List<CourseModel>? get rows;
  @override
  @JsonKey(ignore: true)
  _$$_DataResponseCopyWith<_$_DataResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
