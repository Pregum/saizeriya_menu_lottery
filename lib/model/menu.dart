// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'menu.freezed.dart';
part 'menu.g.dart';

@freezed
class Menu with _$Menu {
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
  }) = _Menu;

  factory Menu.fromJson(Map<String, dynamic> json) => _$MenuFromJson(json);
}
