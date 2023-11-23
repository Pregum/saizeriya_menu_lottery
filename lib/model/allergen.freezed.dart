// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'allergen.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Allergen _$AllergenFromJson(Map<String, dynamic> json) {
  return _Allergen.fromJson(json);
}

/// @nodoc
mixin _$Allergen {
  int? get id => throw _privateConstructorUsedError;
  int? get menuId => throw _privateConstructorUsedError;
  int? get allergenId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AllergenCopyWith<Allergen> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AllergenCopyWith<$Res> {
  factory $AllergenCopyWith(Allergen value, $Res Function(Allergen) then) =
      _$AllergenCopyWithImpl<$Res, Allergen>;
  @useResult
  $Res call({int? id, int? menuId, int? allergenId});
}

/// @nodoc
class _$AllergenCopyWithImpl<$Res, $Val extends Allergen>
    implements $AllergenCopyWith<$Res> {
  _$AllergenCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? menuId = freezed,
    Object? allergenId = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      menuId: freezed == menuId
          ? _value.menuId
          : menuId // ignore: cast_nullable_to_non_nullable
              as int?,
      allergenId: freezed == allergenId
          ? _value.allergenId
          : allergenId // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AllergenImplCopyWith<$Res>
    implements $AllergenCopyWith<$Res> {
  factory _$$AllergenImplCopyWith(
          _$AllergenImpl value, $Res Function(_$AllergenImpl) then) =
      __$$AllergenImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, int? menuId, int? allergenId});
}

/// @nodoc
class __$$AllergenImplCopyWithImpl<$Res>
    extends _$AllergenCopyWithImpl<$Res, _$AllergenImpl>
    implements _$$AllergenImplCopyWith<$Res> {
  __$$AllergenImplCopyWithImpl(
      _$AllergenImpl _value, $Res Function(_$AllergenImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? menuId = freezed,
    Object? allergenId = freezed,
  }) {
    return _then(_$AllergenImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      menuId: freezed == menuId
          ? _value.menuId
          : menuId // ignore: cast_nullable_to_non_nullable
              as int?,
      allergenId: freezed == allergenId
          ? _value.allergenId
          : allergenId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$AllergenImpl implements _Allergen {
  _$AllergenImpl({required this.id, this.menuId, this.allergenId});

  factory _$AllergenImpl.fromJson(Map<String, dynamic> json) =>
      _$$AllergenImplFromJson(json);

  @override
  final int? id;
  @override
  final int? menuId;
  @override
  final int? allergenId;

  @override
  String toString() {
    return 'Allergen(id: $id, menuId: $menuId, allergenId: $allergenId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AllergenImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.menuId, menuId) || other.menuId == menuId) &&
            (identical(other.allergenId, allergenId) ||
                other.allergenId == allergenId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, menuId, allergenId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AllergenImplCopyWith<_$AllergenImpl> get copyWith =>
      __$$AllergenImplCopyWithImpl<_$AllergenImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AllergenImplToJson(
      this,
    );
  }
}

abstract class _Allergen implements Allergen {
  factory _Allergen(
      {required final int? id,
      final int? menuId,
      final int? allergenId}) = _$AllergenImpl;

  factory _Allergen.fromJson(Map<String, dynamic> json) =
      _$AllergenImpl.fromJson;

  @override
  int? get id;
  @override
  int? get menuId;
  @override
  int? get allergenId;
  @override
  @JsonKey(ignore: true)
  _$$AllergenImplCopyWith<_$AllergenImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
