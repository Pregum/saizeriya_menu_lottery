// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MenuImpl _$$MenuImplFromJson(Map<String, dynamic> json) => _$MenuImpl(
      id: json['id'] as int,
      name: json['name'] as String? ?? '',
      foodTypeId: json['food_type_id'] as int? ?? null,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      imageUrl: json['image_url'] as String? ?? '',
    );

Map<String, dynamic> _$$MenuImplToJson(_$MenuImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'food_type_id': instance.foodTypeId,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'image_url': instance.imageUrl,
    };
