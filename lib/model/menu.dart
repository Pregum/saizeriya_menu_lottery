// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:saizeriya_menu_lottery/model/food_type.dart';

part 'menu.freezed.dart';
part 'menu.g.dart';

@freezed
class Menu with _$Menu {
  @JsonSerializable(explicitToJson: true)
  factory Menu({
    required int id,
    @Default('') String name,
    @JsonKey(name: 'food_type_id') required int foodTypeId,
    @Default(null) @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
    @JsonKey(name: 'image_url') required String imageUrl,
    @Default(null) String? description,
    @JsonKey(name: 'order_code') required String orderCode,
    required int price,
    @JsonKey(name: 'price_with_tax') required int priceWithTax,
    @JsonKey(name: 'food_types') required FoodType foodType,
  }) = _Menu;

  factory Menu.fromJson(Map<String, dynamic> json) => _$MenuFromJson(json);
}
