/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/buckwheat_b_blk.gif
  AssetGenImage get buckwheatBBlk =>
      const AssetGenImage('assets/images/buckwheat_b_blk.gif');

  /// File path: assets/images/buckwheat_blk.gif
  AssetGenImage get buckwheatBlk =>
      const AssetGenImage('assets/images/buckwheat_blk.gif');

  /// File path: assets/images/crab_b_blk.gif
  AssetGenImage get crabBBlk =>
      const AssetGenImage('assets/images/crab_b_blk.gif');

  /// File path: assets/images/crab_blk.gif
  AssetGenImage get crabBlk =>
      const AssetGenImage('assets/images/crab_blk.gif');

  /// File path: assets/images/dummy_image.png
  AssetGenImage get dummyImage =>
      const AssetGenImage('assets/images/dummy_image.png');

  /// File path: assets/images/egg_b_blk.gif
  AssetGenImage get eggBBlk =>
      const AssetGenImage('assets/images/egg_b_blk.gif');

  /// File path: assets/images/egg_blk.gif
  AssetGenImage get eggBlk => const AssetGenImage('assets/images/egg_blk.gif');

  /// File path: assets/images/milk_b_blk.gif
  AssetGenImage get milkBBlk =>
      const AssetGenImage('assets/images/milk_b_blk.gif');

  /// File path: assets/images/milk_blk.gif
  AssetGenImage get milkBlk =>
      const AssetGenImage('assets/images/milk_blk.gif');

  /// File path: assets/images/peanut_b_blk.gif
  AssetGenImage get peanutBBlk =>
      const AssetGenImage('assets/images/peanut_b_blk.gif');

  /// File path: assets/images/peanut_blk.gif
  AssetGenImage get peanutBlk =>
      const AssetGenImage('assets/images/peanut_blk.gif');

  /// File path: assets/images/shrimp_b_blk.gif
  AssetGenImage get shrimpBBlk =>
      const AssetGenImage('assets/images/shrimp_b_blk.gif');

  /// File path: assets/images/shrimp_blk.gif
  AssetGenImage get shrimpBlk =>
      const AssetGenImage('assets/images/shrimp_blk.gif');

  /// File path: assets/images/wheat_b_blk.gif
  AssetGenImage get wheatBBlk =>
      const AssetGenImage('assets/images/wheat_b_blk.gif');

  /// File path: assets/images/wheat_blk.gif
  AssetGenImage get wheatBlk =>
      const AssetGenImage('assets/images/wheat_blk.gif');

  /// List of all assets
  List<AssetGenImage> get values => [
        buckwheatBBlk,
        buckwheatBlk,
        crabBBlk,
        crabBlk,
        dummyImage,
        eggBBlk,
        eggBlk,
        milkBBlk,
        milkBlk,
        peanutBBlk,
        peanutBlk,
        shrimpBBlk,
        shrimpBlk,
        wheatBBlk,
        wheatBlk
      ];
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
