// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feedback_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FeedBackModel _$FeedBackModelFromJson(Map<String, dynamic> json) {
  return _FeedBackModel.fromJson(json);
}

/// @nodoc
mixin _$FeedBackModel {
  String? get id => throw _privateConstructorUsedError;
  String? get bookingId => throw _privateConstructorUsedError;
  String? get firstId => throw _privateConstructorUsedError;
  String? get secondId => throw _privateConstructorUsedError;
  int? get rating => throw _privateConstructorUsedError;
  String? get content => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: "firstInfo")
  UserModel? get info => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FeedBackModelCopyWith<FeedBackModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeedBackModelCopyWith<$Res> {
  factory $FeedBackModelCopyWith(
          FeedBackModel value, $Res Function(FeedBackModel) then) =
      _$FeedBackModelCopyWithImpl<$Res, FeedBackModel>;
  @useResult
  $Res call(
      {String? id,
      String? bookingId,
      String? firstId,
      String? secondId,
      int? rating,
      String? content,
      DateTime? createdAt,
      DateTime? updatedAt,
      @JsonKey(name: "firstInfo") UserModel? info});

  $UserModelCopyWith<$Res>? get info;
}

/// @nodoc
class _$FeedBackModelCopyWithImpl<$Res, $Val extends FeedBackModel>
    implements $FeedBackModelCopyWith<$Res> {
  _$FeedBackModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? bookingId = freezed,
    Object? firstId = freezed,
    Object? secondId = freezed,
    Object? rating = freezed,
    Object? content = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? info = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      bookingId: freezed == bookingId
          ? _value.bookingId
          : bookingId // ignore: cast_nullable_to_non_nullable
              as String?,
      firstId: freezed == firstId
          ? _value.firstId
          : firstId // ignore: cast_nullable_to_non_nullable
              as String?,
      secondId: freezed == secondId
          ? _value.secondId
          : secondId // ignore: cast_nullable_to_non_nullable
              as String?,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int?,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      info: freezed == info
          ? _value.info
          : info // ignore: cast_nullable_to_non_nullable
              as UserModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res>? get info {
    if (_value.info == null) {
      return null;
    }

    return $UserModelCopyWith<$Res>(_value.info!, (value) {
      return _then(_value.copyWith(info: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_FeedBackModelCopyWith<$Res>
    implements $FeedBackModelCopyWith<$Res> {
  factory _$$_FeedBackModelCopyWith(
          _$_FeedBackModel value, $Res Function(_$_FeedBackModel) then) =
      __$$_FeedBackModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? bookingId,
      String? firstId,
      String? secondId,
      int? rating,
      String? content,
      DateTime? createdAt,
      DateTime? updatedAt,
      @JsonKey(name: "firstInfo") UserModel? info});

  @override
  $UserModelCopyWith<$Res>? get info;
}

/// @nodoc
class __$$_FeedBackModelCopyWithImpl<$Res>
    extends _$FeedBackModelCopyWithImpl<$Res, _$_FeedBackModel>
    implements _$$_FeedBackModelCopyWith<$Res> {
  __$$_FeedBackModelCopyWithImpl(
      _$_FeedBackModel _value, $Res Function(_$_FeedBackModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? bookingId = freezed,
    Object? firstId = freezed,
    Object? secondId = freezed,
    Object? rating = freezed,
    Object? content = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? info = freezed,
  }) {
    return _then(_$_FeedBackModel(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      bookingId: freezed == bookingId
          ? _value.bookingId
          : bookingId // ignore: cast_nullable_to_non_nullable
              as String?,
      firstId: freezed == firstId
          ? _value.firstId
          : firstId // ignore: cast_nullable_to_non_nullable
              as String?,
      secondId: freezed == secondId
          ? _value.secondId
          : secondId // ignore: cast_nullable_to_non_nullable
              as String?,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int?,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      info: freezed == info
          ? _value.info
          : info // ignore: cast_nullable_to_non_nullable
              as UserModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FeedBackModel implements _FeedBackModel {
  const _$_FeedBackModel(
      {this.id,
      this.bookingId,
      this.firstId,
      this.secondId,
      this.rating,
      this.content,
      this.createdAt,
      this.updatedAt,
      @JsonKey(name: "firstInfo") this.info});

  factory _$_FeedBackModel.fromJson(Map<String, dynamic> json) =>
      _$$_FeedBackModelFromJson(json);

  @override
  final String? id;
  @override
  final String? bookingId;
  @override
  final String? firstId;
  @override
  final String? secondId;
  @override
  final int? rating;
  @override
  final String? content;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;
  @override
  @JsonKey(name: "firstInfo")
  final UserModel? info;

  @override
  String toString() {
    return 'FeedBackModel(id: $id, bookingId: $bookingId, firstId: $firstId, secondId: $secondId, rating: $rating, content: $content, createdAt: $createdAt, updatedAt: $updatedAt, info: $info)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FeedBackModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.bookingId, bookingId) ||
                other.bookingId == bookingId) &&
            (identical(other.firstId, firstId) || other.firstId == firstId) &&
            (identical(other.secondId, secondId) ||
                other.secondId == secondId) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.info, info) || other.info == info));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, bookingId, firstId, secondId,
      rating, content, createdAt, updatedAt, info);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FeedBackModelCopyWith<_$_FeedBackModel> get copyWith =>
      __$$_FeedBackModelCopyWithImpl<_$_FeedBackModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FeedBackModelToJson(
      this,
    );
  }
}

abstract class _FeedBackModel implements FeedBackModel {
  const factory _FeedBackModel(
      {final String? id,
      final String? bookingId,
      final String? firstId,
      final String? secondId,
      final int? rating,
      final String? content,
      final DateTime? createdAt,
      final DateTime? updatedAt,
      @JsonKey(name: "firstInfo") final UserModel? info}) = _$_FeedBackModel;

  factory _FeedBackModel.fromJson(Map<String, dynamic> json) =
      _$_FeedBackModel.fromJson;

  @override
  String? get id;
  @override
  String? get bookingId;
  @override
  String? get firstId;
  @override
  String? get secondId;
  @override
  int? get rating;
  @override
  String? get content;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;
  @override
  @JsonKey(name: "firstInfo")
  UserModel? get info;
  @override
  @JsonKey(ignore: true)
  _$$_FeedBackModelCopyWith<_$_FeedBackModel> get copyWith =>
      throw _privateConstructorUsedError;
}
