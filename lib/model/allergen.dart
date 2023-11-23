// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'allergen.freezed.dart';
part 'allergen.g.dart';

@freezed
class Allergen with _$Allergen {
  @JsonSerializable(fieldRename: FieldRename.snake)
  factory Allergen({
    required int? id,
    int? menuId,
    int? allergenId,
  }) = _Allergen;

  factory Allergen.fromJson(Map<String, dynamic> json) =>
      _$AllergenFromJson(json);
}
