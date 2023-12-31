// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'menu.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Menu _$MenuFromJson(Map<String, dynamic> json) {
  return _Menu.fromJson(json);
}

/// @nodoc
mixin _$Menu {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'food_type_id')
  int get foodTypeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'image_url')
  String get imageUrl => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'order_code')
  String get orderCode => throw _privateConstructorUsedError;
  int get price => throw _privateConstructorUsedError;
  @JsonKey(name: 'price_with_tax')
  int get priceWithTax => throw _privateConstructorUsedError;
  @JsonKey(name: 'food_types')
  FoodType get foodType => throw _privateConstructorUsedError;
  List<Allergen> get allergens => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MenuCopyWith<Menu> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MenuCopyWith<$Res> {
  factory $MenuCopyWith(Menu value, $Res Function(Menu) then) =
      _$MenuCopyWithImpl<$Res, Menu>;
  @useResult
  $Res call(
      {int id,
      String name,
      @JsonKey(name: 'food_type_id') int foodTypeId,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt,
      @JsonKey(name: 'image_url') String imageUrl,
      String? description,
      @JsonKey(name: 'order_code') String orderCode,
      int price,
      @JsonKey(name: 'price_with_tax') int priceWithTax,
      @JsonKey(name: 'food_types') FoodType foodType,
      List<Allergen> allergens});

  $FoodTypeCopyWith<$Res> get foodType;
}

/// @nodoc
class _$MenuCopyWithImpl<$Res, $Val extends Menu>
    implements $MenuCopyWith<$Res> {
  _$MenuCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? foodTypeId = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? imageUrl = null,
    Object? description = freezed,
    Object? orderCode = null,
    Object? price = null,
    Object? priceWithTax = null,
    Object? foodType = null,
    Object? allergens = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      foodTypeId: null == foodTypeId
          ? _value.foodTypeId
          : foodTypeId // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      orderCode: null == orderCode
          ? _value.orderCode
          : orderCode // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      priceWithTax: null == priceWithTax
          ? _value.priceWithTax
          : priceWithTax // ignore: cast_nullable_to_non_nullable
              as int,
      foodType: null == foodType
          ? _value.foodType
          : foodType // ignore: cast_nullable_to_non_nullable
              as FoodType,
      allergens: null == allergens
          ? _value.allergens
          : allergens // ignore: cast_nullable_to_non_nullable
              as List<Allergen>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $FoodTypeCopyWith<$Res> get foodType {
    return $FoodTypeCopyWith<$Res>(_value.foodType, (value) {
      return _then(_value.copyWith(foodType: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MenuImplCopyWith<$Res> implements $MenuCopyWith<$Res> {
  factory _$$MenuImplCopyWith(
          _$MenuImpl value, $Res Function(_$MenuImpl) then) =
      __$$MenuImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      @JsonKey(name: 'food_type_id') int foodTypeId,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt,
      @JsonKey(name: 'image_url') String imageUrl,
      String? description,
      @JsonKey(name: 'order_code') String orderCode,
      int price,
      @JsonKey(name: 'price_with_tax') int priceWithTax,
      @JsonKey(name: 'food_types') FoodType foodType,
      List<Allergen> allergens});

  @override
  $FoodTypeCopyWith<$Res> get foodType;
}

/// @nodoc
class __$$MenuImplCopyWithImpl<$Res>
    extends _$MenuCopyWithImpl<$Res, _$MenuImpl>
    implements _$$MenuImplCopyWith<$Res> {
  __$$MenuImplCopyWithImpl(_$MenuImpl _value, $Res Function(_$MenuImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? foodTypeId = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? imageUrl = null,
    Object? description = freezed,
    Object? orderCode = null,
    Object? price = null,
    Object? priceWithTax = null,
    Object? foodType = null,
    Object? allergens = null,
  }) {
    return _then(_$MenuImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      foodTypeId: null == foodTypeId
          ? _value.foodTypeId
          : foodTypeId // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      orderCode: null == orderCode
          ? _value.orderCode
          : orderCode // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      priceWithTax: null == priceWithTax
          ? _value.priceWithTax
          : priceWithTax // ignore: cast_nullable_to_non_nullable
              as int,
      foodType: null == foodType
          ? _value.foodType
          : foodType // ignore: cast_nullable_to_non_nullable
              as FoodType,
      allergens: null == allergens
          ? _value._allergens
          : allergens // ignore: cast_nullable_to_non_nullable
              as List<Allergen>,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$MenuImpl implements _Menu {
  _$MenuImpl(
      {required this.id,
      this.name = '',
      @JsonKey(name: 'food_type_id') required this.foodTypeId,
      @JsonKey(name: 'created_at') this.createdAt = null,
      @JsonKey(name: 'updated_at') this.updatedAt,
      @JsonKey(name: 'image_url') required this.imageUrl,
      this.description = null,
      @JsonKey(name: 'order_code') required this.orderCode,
      required this.price,
      @JsonKey(name: 'price_with_tax') required this.priceWithTax,
      @JsonKey(name: 'food_types') required this.foodType,
      final List<Allergen> allergens = const []})
      : _allergens = allergens;

  factory _$MenuImpl.fromJson(Map<String, dynamic> json) =>
      _$$MenuImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey(name: 'food_type_id')
  final int foodTypeId;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;
  @override
  @JsonKey(name: 'image_url')
  final String imageUrl;
  @override
  @JsonKey()
  final String? description;
  @override
  @JsonKey(name: 'order_code')
  final String orderCode;
  @override
  final int price;
  @override
  @JsonKey(name: 'price_with_tax')
  final int priceWithTax;
  @override
  @JsonKey(name: 'food_types')
  final FoodType foodType;
  final List<Allergen> _allergens;
  @override
  @JsonKey()
  List<Allergen> get allergens {
    if (_allergens is EqualUnmodifiableListView) return _allergens;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allergens);
  }

  @override
  String toString() {
    return 'Menu(id: $id, name: $name, foodTypeId: $foodTypeId, createdAt: $createdAt, updatedAt: $updatedAt, imageUrl: $imageUrl, description: $description, orderCode: $orderCode, price: $price, priceWithTax: $priceWithTax, foodType: $foodType, allergens: $allergens)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MenuImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.foodTypeId, foodTypeId) ||
                other.foodTypeId == foodTypeId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.orderCode, orderCode) ||
                other.orderCode == orderCode) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.priceWithTax, priceWithTax) ||
                other.priceWithTax == priceWithTax) &&
            (identical(other.foodType, foodType) ||
                other.foodType == foodType) &&
            const DeepCollectionEquality()
                .equals(other._allergens, _allergens));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      foodTypeId,
      createdAt,
      updatedAt,
      imageUrl,
      description,
      orderCode,
      price,
      priceWithTax,
      foodType,
      const DeepCollectionEquality().hash(_allergens));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MenuImplCopyWith<_$MenuImpl> get copyWith =>
      __$$MenuImplCopyWithImpl<_$MenuImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MenuImplToJson(
      this,
    );
  }
}

abstract class _Menu implements Menu {
  factory _Menu(
      {required final int id,
      final String name,
      @JsonKey(name: 'food_type_id') required final int foodTypeId,
      @JsonKey(name: 'created_at') final DateTime? createdAt,
      @JsonKey(name: 'updated_at') final DateTime? updatedAt,
      @JsonKey(name: 'image_url') required final String imageUrl,
      final String? description,
      @JsonKey(name: 'order_code') required final String orderCode,
      required final int price,
      @JsonKey(name: 'price_with_tax') required final int priceWithTax,
      @JsonKey(name: 'food_types') required final FoodType foodType,
      final List<Allergen> allergens}) = _$MenuImpl;

  factory _Menu.fromJson(Map<String, dynamic> json) = _$MenuImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  @JsonKey(name: 'food_type_id')
  int get foodTypeId;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt;
  @override
  @JsonKey(name: 'image_url')
  String get imageUrl;
  @override
  String? get description;
  @override
  @JsonKey(name: 'order_code')
  String get orderCode;
  @override
  int get price;
  @override
  @JsonKey(name: 'price_with_tax')
  int get priceWithTax;
  @override
  @JsonKey(name: 'food_types')
  FoodType get foodType;
  @override
  List<Allergen> get allergens;
  @override
  @JsonKey(ignore: true)
  _$$MenuImplCopyWith<_$MenuImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
