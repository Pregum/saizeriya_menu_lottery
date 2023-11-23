// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'food_type.g.dart';
part 'food_type.freezed.dart';

@freezed
class FoodType with _$FoodType {
  const FoodType._();
  
  factory FoodType({
    required int id,
    required String? name,
    @JsonKey(name: 'created_at') DateTime? createdAt,
  }) = _FoodType;
  
  factory FoodType.fromJson(Map<String, dynamic> json) => _$FoodTypeFromJson(json);
}