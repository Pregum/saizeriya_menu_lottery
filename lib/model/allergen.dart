// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:saizeriya_menu_lottery/gen/assets.gen.dart';

part 'allergen.freezed.dart';
part 'allergen.g.dart';

@freezed
class Allergen with _$Allergen {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const Allergen._();

  factory Allergen({
    required int id,
    @Default('') String? name,
  }) = _Allergen;

  factory Allergen.fromJson(Map<String, dynamic> json) =>
      _$AllergenFromJson(json);
  
  AssetGenImage? get image {
    switch (id) {
      case 1:
        // 小麦
        return Assets.images.wheatBBlk;
      case 2:
        // 卵
        return Assets.images.eggBBlk;
      case 3:
        // 乳
        return Assets.images.milkBBlk;
      case 4:
        // えび
        return Assets.images.shrimpBBlk;
      case 5:
        // かに
        return Assets.images.crabBBlk;
      case 6:
        // そば
        return Assets.images.buckwheatBBlk;
      case 7:
        // 落花生
        return Assets.images.peanutBBlk;
      case 8:
        // くるみ
        return Assets.images.walnutBlk;
      
      default:
        return null;
    }
  }
}
