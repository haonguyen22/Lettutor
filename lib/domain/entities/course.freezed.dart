// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'course.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Course _$CourseFromJson(Map<String, dynamic> json) {
  return _Course.fromJson(json);
}

/// @nodoc
mixin _$Course {
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;
  String? get http => throw _privateConstructorUsedError;
  String? get level => throw _privateConstructorUsedError;
  String? get reason => throw _privateConstructorUsedError;
  String? get purpose => throw _privateConstructorUsedError;
  String? get otherDetails => throw _privateConstructorUsedError;
  int? get defaultPrice => throw _privateConstructorUsedError;
  int? get coursePrice => throw _privateConstructorUsedError;
  String? get courseType => throw _privateConstructorUsedError;
  String? get sectionType => throw _privateConstructorUsedError;
  bool? get visible => throw _privateConstructorUsedError;
  String? get displayOrder => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;
  String? get updatedAt => throw _privateConstructorUsedError;
  List<TopicCourseModel>? get topics => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CourseCopyWith<Course> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CourseCopyWith<$Res> {
  factory $CourseCopyWith(Course value, $Res Function(Course) then) =
      _$CourseCopyWithImpl<$Res, Course>;
  @useResult
  $Res call(
      {String? id,
      String? name,
      String? description,
      String? imageUrl,
      String? http,
      String? level,
      String? reason,
      String? purpose,
      String? otherDetails,
      int? defaultPrice,
      int? coursePrice,
      String? courseType,
      String? sectionType,
      bool? visible,
      String? displayOrder,
      String? createdAt,
      String? updatedAt,
      List<TopicCourseModel>? topics});
}

/// @nodoc
class _$CourseCopyWithImpl<$Res, $Val extends Course>
    implements $CourseCopyWith<$Res> {
  _$CourseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? imageUrl = freezed,
    Object? http = freezed,
    Object? level = freezed,
    Object? reason = freezed,
    Object? purpose = freezed,
    Object? otherDetails = freezed,
    Object? defaultPrice = freezed,
    Object? coursePrice = freezed,
    Object? courseType = freezed,
    Object? sectionType = freezed,
    Object? visible = freezed,
    Object? displayOrder = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? topics = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      http: freezed == http
          ? _value.http
          : http // ignore: cast_nullable_to_non_nullable
              as String?,
      level: freezed == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as String?,
      reason: freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
      purpose: freezed == purpose
          ? _value.purpose
          : purpose // ignore: cast_nullable_to_non_nullable
              as String?,
      otherDetails: freezed == otherDetails
          ? _value.otherDetails
          : otherDetails // ignore: cast_nullable_to_non_nullable
              as String?,
      defaultPrice: freezed == defaultPrice
          ? _value.defaultPrice
          : defaultPrice // ignore: cast_nullable_to_non_nullable
              as int?,
      coursePrice: freezed == coursePrice
          ? _value.coursePrice
          : coursePrice // ignore: cast_nullable_to_non_nullable
              as int?,
      courseType: freezed == courseType
          ? _value.courseType
          : courseType // ignore: cast_nullable_to_non_nullable
              as String?,
      sectionType: freezed == sectionType
          ? _value.sectionType
          : sectionType // ignore: cast_nullable_to_non_nullable
              as String?,
      visible: freezed == visible
          ? _value.visible
          : visible // ignore: cast_nullable_to_non_nullable
              as bool?,
      displayOrder: freezed == displayOrder
          ? _value.displayOrder
          : displayOrder // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      topics: freezed == topics
          ? _value.topics
          : topics // ignore: cast_nullable_to_non_nullable
              as List<TopicCourseModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CourseCopyWith<$Res> implements $CourseCopyWith<$Res> {
  factory _$$_CourseCopyWith(_$_Course value, $Res Function(_$_Course) then) =
      __$$_CourseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? name,
      String? description,
      String? imageUrl,
      String? http,
      String? level,
      String? reason,
      String? purpose,
      String? otherDetails,
      int? defaultPrice,
      int? coursePrice,
      String? courseType,
      String? sectionType,
      bool? visible,
      String? displayOrder,
      String? createdAt,
      String? updatedAt,
      List<TopicCourseModel>? topics});
}

/// @nodoc
class __$$_CourseCopyWithImpl<$Res>
    extends _$CourseCopyWithImpl<$Res, _$_Course>
    implements _$$_CourseCopyWith<$Res> {
  __$$_CourseCopyWithImpl(_$_Course _value, $Res Function(_$_Course) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? imageUrl = freezed,
    Object? http = freezed,
    Object? level = freezed,
    Object? reason = freezed,
    Object? purpose = freezed,
    Object? otherDetails = freezed,
    Object? defaultPrice = freezed,
    Object? coursePrice = freezed,
    Object? courseType = freezed,
    Object? sectionType = freezed,
    Object? visible = freezed,
    Object? displayOrder = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? topics = freezed,
  }) {
    return _then(_$_Course(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      http: freezed == http
          ? _value.http
          : http // ignore: cast_nullable_to_non_nullable
              as String?,
      level: freezed == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as String?,
      reason: freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
      purpose: freezed == purpose
          ? _value.purpose
          : purpose // ignore: cast_nullable_to_non_nullable
              as String?,
      otherDetails: freezed == otherDetails
          ? _value.otherDetails
          : otherDetails // ignore: cast_nullable_to_non_nullable
              as String?,
      defaultPrice: freezed == defaultPrice
          ? _value.defaultPrice
          : defaultPrice // ignore: cast_nullable_to_non_nullable
              as int?,
      coursePrice: freezed == coursePrice
          ? _value.coursePrice
          : coursePrice // ignore: cast_nullable_to_non_nullable
              as int?,
      courseType: freezed == courseType
          ? _value.courseType
          : courseType // ignore: cast_nullable_to_non_nullable
              as String?,
      sectionType: freezed == sectionType
          ? _value.sectionType
          : sectionType // ignore: cast_nullable_to_non_nullable
              as String?,
      visible: freezed == visible
          ? _value.visible
          : visible // ignore: cast_nullable_to_non_nullable
              as bool?,
      displayOrder: freezed == displayOrder
          ? _value.displayOrder
          : displayOrder // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      topics: freezed == topics
          ? _value._topics
          : topics // ignore: cast_nullable_to_non_nullable
              as List<TopicCourseModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Course implements _Course {
  const _$_Course(
      {this.id,
      this.name,
      this.description,
      this.imageUrl,
      this.http,
      this.level,
      this.reason,
      this.purpose,
      this.otherDetails,
      this.defaultPrice,
      this.coursePrice,
      this.courseType,
      this.sectionType,
      this.visible,
      this.displayOrder,
      this.createdAt,
      this.updatedAt,
      final List<TopicCourseModel>? topics})
      : _topics = topics;

  factory _$_Course.fromJson(Map<String, dynamic> json) =>
      _$$_CourseFromJson(json);

  @override
  final String? id;
  @override
  final String? name;
  @override
  final String? description;
  @override
  final String? imageUrl;
  @override
  final String? http;
  @override
  final String? level;
  @override
  final String? reason;
  @override
  final String? purpose;
  @override
  final String? otherDetails;
  @override
  final int? defaultPrice;
  @override
  final int? coursePrice;
  @override
  final String? courseType;
  @override
  final String? sectionType;
  @override
  final bool? visible;
  @override
  final String? displayOrder;
  @override
  final String? createdAt;
  @override
  final String? updatedAt;
  final List<TopicCourseModel>? _topics;
  @override
  List<TopicCourseModel>? get topics {
    final value = _topics;
    if (value == null) return null;
    if (_topics is EqualUnmodifiableListView) return _topics;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Course(id: $id, name: $name, description: $description, imageUrl: $imageUrl, http: $http, level: $level, reason: $reason, purpose: $purpose, otherDetails: $otherDetails, defaultPrice: $defaultPrice, coursePrice: $coursePrice, courseType: $courseType, sectionType: $sectionType, visible: $visible, displayOrder: $displayOrder, createdAt: $createdAt, updatedAt: $updatedAt, topics: $topics)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Course &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.http, http) || other.http == http) &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.purpose, purpose) || other.purpose == purpose) &&
            (identical(other.otherDetails, otherDetails) ||
                other.otherDetails == otherDetails) &&
            (identical(other.defaultPrice, defaultPrice) ||
                other.defaultPrice == defaultPrice) &&
            (identical(other.coursePrice, coursePrice) ||
                other.coursePrice == coursePrice) &&
            (identical(other.courseType, courseType) ||
                other.courseType == courseType) &&
            (identical(other.sectionType, sectionType) ||
                other.sectionType == sectionType) &&
            (identical(other.visible, visible) || other.visible == visible) &&
            (identical(other.displayOrder, displayOrder) ||
                other.displayOrder == displayOrder) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            const DeepCollectionEquality().equals(other._topics, _topics));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      description,
      imageUrl,
      http,
      level,
      reason,
      purpose,
      otherDetails,
      defaultPrice,
      coursePrice,
      courseType,
      sectionType,
      visible,
      displayOrder,
      createdAt,
      updatedAt,
      const DeepCollectionEquality().hash(_topics));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CourseCopyWith<_$_Course> get copyWith =>
      __$$_CourseCopyWithImpl<_$_Course>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CourseToJson(
      this,
    );
  }
}

abstract class _Course implements Course {
  const factory _Course(
      {final String? id,
      final String? name,
      final String? description,
      final String? imageUrl,
      final String? http,
      final String? level,
      final String? reason,
      final String? purpose,
      final String? otherDetails,
      final int? defaultPrice,
      final int? coursePrice,
      final String? courseType,
      final String? sectionType,
      final bool? visible,
      final String? displayOrder,
      final String? createdAt,
      final String? updatedAt,
      final List<TopicCourseModel>? topics}) = _$_Course;

  factory _Course.fromJson(Map<String, dynamic> json) = _$_Course.fromJson;

  @override
  String? get id;
  @override
  String? get name;
  @override
  String? get description;
  @override
  String? get imageUrl;
  @override
  String? get http;
  @override
  String? get level;
  @override
  String? get reason;
  @override
  String? get purpose;
  @override
  String? get otherDetails;
  @override
  int? get defaultPrice;
  @override
  int? get coursePrice;
  @override
  String? get courseType;
  @override
  String? get sectionType;
  @override
  bool? get visible;
  @override
  String? get displayOrder;
  @override
  String? get createdAt;
  @override
  String? get updatedAt;
  @override
  List<TopicCourseModel>? get topics;
  @override
  @JsonKey(ignore: true)
  _$$_CourseCopyWith<_$_Course> get copyWith =>
      throw _privateConstructorUsedError;
}
