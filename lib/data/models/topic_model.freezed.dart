// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'topic_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TopicModel _$TopicModelFromJson(Map<String, dynamic> json) {
  return _TopicModel.fromJson(json);
}

/// @nodoc
mixin _$TopicModel {
  int get id => throw _privateConstructorUsedError;
  String get key => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TopicModelCopyWith<TopicModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TopicModelCopyWith<$Res> {
  factory $TopicModelCopyWith(
          TopicModel value, $Res Function(TopicModel) then) =
      _$TopicModelCopyWithImpl<$Res, TopicModel>;
  @useResult
  $Res call({int id, String key, String name});
}

/// @nodoc
class _$TopicModelCopyWithImpl<$Res, $Val extends TopicModel>
    implements $TopicModelCopyWith<$Res> {
  _$TopicModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? key = null,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TopicModelCopyWith<$Res>
    implements $TopicModelCopyWith<$Res> {
  factory _$$_TopicModelCopyWith(
          _$_TopicModel value, $Res Function(_$_TopicModel) then) =
      __$$_TopicModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String key, String name});
}

/// @nodoc
class __$$_TopicModelCopyWithImpl<$Res>
    extends _$TopicModelCopyWithImpl<$Res, _$_TopicModel>
    implements _$$_TopicModelCopyWith<$Res> {
  __$$_TopicModelCopyWithImpl(
      _$_TopicModel _value, $Res Function(_$_TopicModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? key = null,
    Object? name = null,
  }) {
    return _then(_$_TopicModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TopicModel extends _TopicModel {
  const _$_TopicModel({required this.id, required this.key, required this.name})
      : super._();

  factory _$_TopicModel.fromJson(Map<String, dynamic> json) =>
      _$$_TopicModelFromJson(json);

  @override
  final int id;
  @override
  final String key;
  @override
  final String name;

  @override
  String toString() {
    return 'TopicModel(id: $id, key: $key, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TopicModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, key, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TopicModelCopyWith<_$_TopicModel> get copyWith =>
      __$$_TopicModelCopyWithImpl<_$_TopicModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TopicModelToJson(
      this,
    );
  }
}

abstract class _TopicModel extends TopicModel {
  const factory _TopicModel(
      {required final int id,
      required final String key,
      required final String name}) = _$_TopicModel;
  const _TopicModel._() : super._();

  factory _TopicModel.fromJson(Map<String, dynamic> json) =
      _$_TopicModel.fromJson;

  @override
  int get id;
  @override
  String get key;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$_TopicModelCopyWith<_$_TopicModel> get copyWith =>
      throw _privateConstructorUsedError;
}
