// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'course_single_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CourseSingleResponse _$CourseSingleResponseFromJson(Map<String, dynamic> json) {
  return _CourseSingleResponse.fromJson(json);
}

/// @nodoc
mixin _$CourseSingleResponse {
  String? get messages => throw _privateConstructorUsedError;
  CourseModel? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CourseSingleResponseCopyWith<CourseSingleResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CourseSingleResponseCopyWith<$Res> {
  factory $CourseSingleResponseCopyWith(CourseSingleResponse value,
          $Res Function(CourseSingleResponse) then) =
      _$CourseSingleResponseCopyWithImpl<$Res, CourseSingleResponse>;
  @useResult
  $Res call({String? messages, CourseModel? data});

  $CourseModelCopyWith<$Res>? get data;
}

/// @nodoc
class _$CourseSingleResponseCopyWithImpl<$Res,
        $Val extends CourseSingleResponse>
    implements $CourseSingleResponseCopyWith<$Res> {
  _$CourseSingleResponseCopyWithImpl(this._value, this._then);

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
              as CourseModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CourseModelCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $CourseModelCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_CourseSingleResponseCopyWith<$Res>
    implements $CourseSingleResponseCopyWith<$Res> {
  factory _$$_CourseSingleResponseCopyWith(_$_CourseSingleResponse value,
          $Res Function(_$_CourseSingleResponse) then) =
      __$$_CourseSingleResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? messages, CourseModel? data});

  @override
  $CourseModelCopyWith<$Res>? get data;
}

/// @nodoc
class __$$_CourseSingleResponseCopyWithImpl<$Res>
    extends _$CourseSingleResponseCopyWithImpl<$Res, _$_CourseSingleResponse>
    implements _$$_CourseSingleResponseCopyWith<$Res> {
  __$$_CourseSingleResponseCopyWithImpl(_$_CourseSingleResponse _value,
      $Res Function(_$_CourseSingleResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? messages = freezed,
    Object? data = freezed,
  }) {
    return _then(_$_CourseSingleResponse(
      messages: freezed == messages
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as CourseModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CourseSingleResponse extends _CourseSingleResponse {
  const _$_CourseSingleResponse({this.messages, this.data}) : super._();

  factory _$_CourseSingleResponse.fromJson(Map<String, dynamic> json) =>
      _$$_CourseSingleResponseFromJson(json);

  @override
  final String? messages;
  @override
  final CourseModel? data;

  @override
  String toString() {
    return 'CourseSingleResponse(messages: $messages, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CourseSingleResponse &&
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
  _$$_CourseSingleResponseCopyWith<_$_CourseSingleResponse> get copyWith =>
      __$$_CourseSingleResponseCopyWithImpl<_$_CourseSingleResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CourseSingleResponseToJson(
      this,
    );
  }
}

abstract class _CourseSingleResponse extends CourseSingleResponse {
  const factory _CourseSingleResponse(
      {final String? messages,
      final CourseModel? data}) = _$_CourseSingleResponse;
  const _CourseSingleResponse._() : super._();

  factory _CourseSingleResponse.fromJson(Map<String, dynamic> json) =
      _$_CourseSingleResponse.fromJson;

  @override
  String? get messages;
  @override
  CourseModel? get data;
  @override
  @JsonKey(ignore: true)
  _$$_CourseSingleResponseCopyWith<_$_CourseSingleResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
