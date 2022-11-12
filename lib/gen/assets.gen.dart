/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/chef.png
  AssetGenImage get chef => const AssetGenImage('assets/images/chef.png');

  $AssetsImagesDessertsGen get desserts => const $AssetsImagesDessertsGen();

  /// File path: assets/images/norway-1.jpeg
  AssetGenImage get norway1 =>
      const AssetGenImage('assets/images/norway-1.jpeg');

  /// List of all assets
  List<AssetGenImage> get values => [chef, norway1];
}

class $AssetsImagesDessertsGen {
  const $AssetsImagesDessertsGen();

  /// File path: assets/images/desserts/applepie.png
  AssetGenImage get applepie =>
      const AssetGenImage('assets/images/desserts/applepie.png');

  /// File path: assets/images/desserts/chocolatecake1.png
  AssetGenImage get chocolatecake1 =>
      const AssetGenImage('assets/images/desserts/chocolatecake1.png');

  /// File path: assets/images/desserts/chocolatecake2.png
  AssetGenImage get chocolatecake2 =>
      const AssetGenImage('assets/images/desserts/chocolatecake2.png');

  /// File path: assets/images/desserts/chocolatedonuts.png
  AssetGenImage get chocolatedonuts =>
      const AssetGenImage('assets/images/desserts/chocolatedonuts.png');

  /// File path: assets/images/desserts/creamcupcakes.png
  AssetGenImage get creamcupcakes =>
      const AssetGenImage('assets/images/desserts/creamcupcakes.png');

  /// File path: assets/images/desserts/fluffycake.png
  AssetGenImage get fluffycake =>
      const AssetGenImage('assets/images/desserts/fluffycake.png');

  /// File path: assets/images/desserts/fruitpie.png
  AssetGenImage get fruitpie =>
      const AssetGenImage('assets/images/desserts/fruitpie.png');

  /// File path: assets/images/desserts/fruitplate.png
  AssetGenImage get fruitplate =>
      const AssetGenImage('assets/images/desserts/fruitplate.png');

  /// File path: assets/images/desserts/honeycake.png
  AssetGenImage get honeycake =>
      const AssetGenImage('assets/images/desserts/honeycake.png');

  /// File path: assets/images/desserts/lemoncake.png
  AssetGenImage get lemoncake =>
      const AssetGenImage('assets/images/desserts/lemoncake.png');

  /// File path: assets/images/desserts/lemoncheesecakebg.png
  AssetGenImage get lemoncheesecakebg =>
      const AssetGenImage('assets/images/desserts/lemoncheesecakebg.png');

  /// File path: assets/images/desserts/lemoncheesecakebgg.png
  AssetGenImage get lemoncheesecakebgg =>
      const AssetGenImage('assets/images/desserts/lemoncheesecakebgg.png');

  /// File path: assets/images/desserts/macaroons.png
  AssetGenImage get macaroons =>
      const AssetGenImage('assets/images/desserts/macaroons.png');

  /// File path: assets/images/desserts/powderedcake.png
  AssetGenImage get powderedcake =>
      const AssetGenImage('assets/images/desserts/powderedcake.png');

  /// File path: assets/images/desserts/strawberries.png
  AssetGenImage get strawberries =>
      const AssetGenImage('assets/images/desserts/strawberries.png');

  /// File path: assets/images/desserts/strawberrypowderedcake.png
  AssetGenImage get strawberrypowderedcake =>
      const AssetGenImage('assets/images/desserts/strawberrypowderedcake.png');

  /// File path: assets/images/desserts/whitecreamcake.png
  AssetGenImage get whitecreamcake =>
      const AssetGenImage('assets/images/desserts/whitecreamcake.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        applepie,
        chocolatecake1,
        chocolatecake2,
        chocolatedonuts,
        creamcupcakes,
        fluffycake,
        fruitpie,
        fruitplate,
        honeycake,
        lemoncake,
        lemoncheesecakebg,
        lemoncheesecakebgg,
        macaroons,
        powderedcake,
        strawberries,
        strawberrypowderedcake,
        whitecreamcake
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

  ImageProvider provider() => AssetImage(_assetName);

  String get path => _assetName;

  String get keyName => _assetName;
}
