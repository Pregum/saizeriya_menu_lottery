// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'food_type.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FoodType _$FoodTypeFromJson(Map<String, dynamic> json) {
  return _FoodType.fromJson(json);
}

/// @nodoc
mixin _$FoodType {
  int get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FoodTypeCopyWith<FoodType> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FoodTypeCopyWith<$Res> {
  factory $FoodTypeCopyWith(FoodType value, $Res Function(FoodType) then) =
      _$FoodTypeCopyWithImpl<$Res, FoodType>;
  @useResult
  $Res call(
      {int id, String? name, @JsonKey(name: 'created_at') DateTime? createdAt});
}

/// @nodoc
class _$FoodTypeCopyWithImpl<$Res, $Val extends FoodType>
    implements $FoodTypeCopyWith<$Res> {
  _$FoodTypeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FoodTypeImplCopyWith<$Res>
    implements $FoodTypeCopyWith<$Res> {
  factory _$$FoodTypeImplCopyWith(
          _$FoodTypeImpl value, $Res Function(_$FoodTypeImpl) then) =
      __$$FoodTypeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id, String? name, @JsonKey(name: 'created_at') DateTime? createdAt});
}

/// @nodoc
class __$$FoodTypeImplCopyWithImpl<$Res>
    extends _$FoodTypeCopyWithImpl<$Res, _$FoodTypeImpl>
    implements _$$FoodTypeImplCopyWith<$Res> {
  __$$FoodTypeImplCopyWithImpl(
      _$FoodTypeImpl _value, $Res Function(_$FoodTypeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_$FoodTypeImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FoodTypeImpl extends _FoodType {
  _$FoodTypeImpl(
      {required this.id,
      required this.name,
      @JsonKey(name: 'created_at') this.createdAt})
      : super._();

  factory _$FoodTypeImpl.fromJson(Map<String, dynamic> json) =>
      _$$FoodTypeImplFromJson(json);

  @override
  final int id;
  @override
  final String? name;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;

  @override
  String toString() {
    return 'FoodType(id: $id, name: $name, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FoodTypeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FoodTypeImplCopyWith<_$FoodTypeImpl> get copyWith =>
      __$$FoodTypeImplCopyWithImpl<_$FoodTypeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FoodTypeImplToJson(
      this,
    );
  }
}

abstract class _FoodType extends FoodType {
  factory _FoodType(
      {required final int id,
      required final String? name,
      @JsonKey(name: 'created_at') final DateTime? createdAt}) = _$FoodTypeImpl;
  _FoodType._() : super._();

  factory _FoodType.fromJson(Map<String, dynamic> json) =
      _$FoodTypeImpl.fromJson;

  @override
  int get id;
  @override
  String? get name;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$FoodTypeImplCopyWith<_$FoodTypeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
