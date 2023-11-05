// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'menu.freezed.dart';
part 'menu.g.dart';

@freezed
class Menu with _$Menu {
  factory Menu({
    required int id,
    @Default('') String? name,
    @Default(null) @JsonKey(name: 'food_type_id') int? foodTypeId,
    @Default(null) @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
    @Default('') @JsonKey(name: 'image_url') String imageUrl,
  }) = _Menu;

  factory Menu.fromJson(Map<String, dynamic> json) => _$MenuFromJson(json);
}
