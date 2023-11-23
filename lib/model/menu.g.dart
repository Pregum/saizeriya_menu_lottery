// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MenuImpl _$$MenuImplFromJson(Map<String, dynamic> json) => _$MenuImpl(
      id: json['id'] as int,
      name: json['name'] as String? ?? '',
      foodTypeId: json['food_type_id'] as int,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      imageUrl: json['image_url'] as String,
      description: json['description'] as String? ?? null,
      orderCode: json['order_code'] as String,
      price: json['price'] as int,
      priceWithTax: json['price_with_tax'] as int,
      foodType: FoodType.fromJson(json['food_types'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$MenuImplToJson(_$MenuImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'food_type_id': instance.foodTypeId,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'image_url': instance.imageUrl,
      'description': instance.description,
      'order_code': instance.orderCode,
      'price': instance.price,
      'price_with_tax': instance.priceWithTax,
      'food_types': instance.foodType.toJson(),
    };
