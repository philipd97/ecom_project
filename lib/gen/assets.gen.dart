/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/menu_icon.png
  AssetGenImage get menuIcon =>
      const AssetGenImage('assets/icons/menu_icon.png');

  /// List of all assets
  List<AssetGenImage> get values => [menuIcon];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/item_not_found.png
  AssetGenImage get itemNotFound =>
      const AssetGenImage('assets/images/item_not_found.png');

  /// File path: assets/images/mastercard.png
  AssetGenImage get mastercard =>
      const AssetGenImage('assets/images/mastercard.png');

  /// File path: assets/images/no_favourite.png
  AssetGenImage get noFavourite =>
      const AssetGenImage('assets/images/no_favourite.png');

  /// File path: assets/images/no_history.png
  AssetGenImage get noHistory =>
      const AssetGenImage('assets/images/no_history.png');

  /// File path: assets/images/starting_page.png
  AssetGenImage get startingPage =>
      const AssetGenImage('assets/images/starting_page.png');

  /// File path: assets/images/visa.png
  AssetGenImage get visa => const AssetGenImage('assets/images/visa.png');

  /// File path: assets/images/wifi.png
  AssetGenImage get wifi => const AssetGenImage('assets/images/wifi.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        itemNotFound,
        mastercard,
        noFavourite,
        noHistory,
        startingPage,
        visa,
        wifi
      ];
}

class Assets {
  Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
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

  ImageProvider provider() => AssetImage(_assetName);

  String get path => _assetName;

  String get keyName => _assetName;
}
