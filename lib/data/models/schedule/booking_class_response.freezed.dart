// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'booking_class_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BookingClassResponse _$BookingClassResponseFromJson(Map<String, dynamic> json) {
  return _BookingClassResponse.fromJson(json);
}

/// @nodoc
mixin _$BookingClassResponse {
  String? get message => throw _privateConstructorUsedError;
  DataBookingClassResponse? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BookingClassResponseCopyWith<BookingClassResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookingClassResponseCopyWith<$Res> {
  factory $BookingClassResponseCopyWith(BookingClassResponse value,
          $Res Function(BookingClassResponse) then) =
      _$BookingClassResponseCopyWithImpl<$Res, BookingClassResponse>;
  @useResult
  $Res call({String? message, DataBookingClassResponse? data});

  $DataBookingClassResponseCopyWith<$Res>? get data;
}

/// @nodoc
class _$BookingClassResponseCopyWithImpl<$Res,
        $Val extends BookingClassResponse>
    implements $BookingClassResponseCopyWith<$Res> {
  _$BookingClassResponseCopyWithImpl(this._value, this._then);

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
              as DataBookingClassResponse?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DataBookingClassResponseCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $DataBookingClassResponseCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_BookingClassResponseCopyWith<$Res>
    implements $BookingClassResponseCopyWith<$Res> {
  factory _$$_BookingClassResponseCopyWith(_$_BookingClassResponse value,
          $Res Function(_$_BookingClassResponse) then) =
      __$$_BookingClassResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? message, DataBookingClassResponse? data});

  @override
  $DataBookingClassResponseCopyWith<$Res>? get data;
}

/// @nodoc
class __$$_BookingClassResponseCopyWithImpl<$Res>
    extends _$BookingClassResponseCopyWithImpl<$Res, _$_BookingClassResponse>
    implements _$$_BookingClassResponseCopyWith<$Res> {
  __$$_BookingClassResponseCopyWithImpl(_$_BookingClassResponse _value,
      $Res Function(_$_BookingClassResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_$_BookingClassResponse(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as DataBookingClassResponse?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BookingClassResponse implements _BookingClassResponse {
  const _$_BookingClassResponse({this.message, this.data});

  factory _$_BookingClassResponse.fromJson(Map<String, dynamic> json) =>
      _$$_BookingClassResponseFromJson(json);

  @override
  final String? message;
  @override
  final DataBookingClassResponse? data;

  @override
  String toString() {
    return 'BookingClassResponse(message: $message, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BookingClassResponse &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, message, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BookingClassResponseCopyWith<_$_BookingClassResponse> get copyWith =>
      __$$_BookingClassResponseCopyWithImpl<_$_BookingClassResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BookingClassResponseToJson(
      this,
    );
  }
}

abstract class _BookingClassResponse implements BookingClassResponse {
  const factory _BookingClassResponse(
      {final String? message,
      final DataBookingClassResponse? data}) = _$_BookingClassResponse;

  factory _BookingClassResponse.fromJson(Map<String, dynamic> json) =
      _$_BookingClassResponse.fromJson;

  @override
  String? get message;
  @override
  DataBookingClassResponse? get data;
  @override
  @JsonKey(ignore: true)
  _$$_BookingClassResponseCopyWith<_$_BookingClassResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

DataBookingClassResponse _$DataBookingClassResponseFromJson(
    Map<String, dynamic> json) {
  return _DataBookingClassResponse.fromJson(json);
}

/// @nodoc
mixin _$DataBookingClassResponse {
  int? get count => throw _privateConstructorUsedError;
  List<BookingInfoModel>? get rows => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DataBookingClassResponseCopyWith<DataBookingClassResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataBookingClassResponseCopyWith<$Res> {
  factory $DataBookingClassResponseCopyWith(DataBookingClassResponse value,
          $Res Function(DataBookingClassResponse) then) =
      _$DataBookingClassResponseCopyWithImpl<$Res, DataBookingClassResponse>;
  @useResult
  $Res call({int? count, List<BookingInfoModel>? rows});
}

/// @nodoc
class _$DataBookingClassResponseCopyWithImpl<$Res,
        $Val extends DataBookingClassResponse>
    implements $DataBookingClassResponseCopyWith<$Res> {
  _$DataBookingClassResponseCopyWithImpl(this._value, this._then);

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
              as List<BookingInfoModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DataBookingClassResponseCopyWith<$Res>
    implements $DataBookingClassResponseCopyWith<$Res> {
  factory _$$_DataBookingClassResponseCopyWith(
          _$_DataBookingClassResponse value,
          $Res Function(_$_DataBookingClassResponse) then) =
      __$$_DataBookingClassResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? count, List<BookingInfoModel>? rows});
}

/// @nodoc
class __$$_DataBookingClassResponseCopyWithImpl<$Res>
    extends _$DataBookingClassResponseCopyWithImpl<$Res,
        _$_DataBookingClassResponse>
    implements _$$_DataBookingClassResponseCopyWith<$Res> {
  __$$_DataBookingClassResponseCopyWithImpl(_$_DataBookingClassResponse _value,
      $Res Function(_$_DataBookingClassResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = freezed,
    Object? rows = freezed,
  }) {
    return _then(_$_DataBookingClassResponse(
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
      rows: freezed == rows
          ? _value._rows
          : rows // ignore: cast_nullable_to_non_nullable
              as List<BookingInfoModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DataBookingClassResponse implements _DataBookingClassResponse {
  const _$_DataBookingClassResponse(
      {this.count, final List<BookingInfoModel>? rows})
      : _rows = rows;

  factory _$_DataBookingClassResponse.fromJson(Map<String, dynamic> json) =>
      _$$_DataBookingClassResponseFromJson(json);

  @override
  final int? count;
  final List<BookingInfoModel>? _rows;
  @override
  List<BookingInfoModel>? get rows {
    final value = _rows;
    if (value == null) return null;
    if (_rows is EqualUnmodifiableListView) return _rows;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'DataBookingClassResponse(count: $count, rows: $rows)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DataBookingClassResponse &&
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
  _$$_DataBookingClassResponseCopyWith<_$_DataBookingClassResponse>
      get copyWith => __$$_DataBookingClassResponseCopyWithImpl<
          _$_DataBookingClassResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DataBookingClassResponseToJson(
      this,
    );
  }
}

abstract class _DataBookingClassResponse implements DataBookingClassResponse {
  const factory _DataBookingClassResponse(
      {final int? count,
      final List<BookingInfoModel>? rows}) = _$_DataBookingClassResponse;

  factory _DataBookingClassResponse.fromJson(Map<String, dynamic> json) =
      _$_DataBookingClassResponse.fromJson;

  @override
  int? get count;
  @override
  List<BookingInfoModel>? get rows;
  @override
  @JsonKey(ignore: true)
  _$$_DataBookingClassResponseCopyWith<_$_DataBookingClassResponse>
      get copyWith => throw _privateConstructorUsedError;
}
