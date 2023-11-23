// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FoodTypeImpl _$$FoodTypeImplFromJson(Map<String, dynamic> json) =>
    _$FoodTypeImpl(
      id: json['id'] as int,
      name: json['name'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$$FoodTypeImplToJson(_$FoodTypeImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'created_at': instance.createdAt?.toIso8601String(),
    };
