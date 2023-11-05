// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MenuImpl _$$MenuImplFromJson(Map<String, dynamic> json) => _$MenuImpl(
      id: json['id'] as int,
      name: json['name'] as String? ?? '',
      foodTypeId: json['food_type_id'] as int? ?? null,
    );

Map<String, dynamic> _$$MenuImplToJson(_$MenuImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'food_type_id': instance.foodTypeId,
    };
