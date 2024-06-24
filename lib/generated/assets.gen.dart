/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vector_graphics/vector_graphics.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/alert.svg
  SvgGenImage get alert => const SvgGenImage('assets/icons/alert.svg');

  /// File path: assets/icons/arrow-up-right.svg
  SvgGenImage get arrowUpRight => const SvgGenImage('assets/icons/arrow-up-right.svg');

  /// File path: assets/icons/bell.svg
  SvgGenImage get bell => const SvgGenImage('assets/icons/bell.svg');

  /// File path: assets/icons/bitcoin-btc.svg
  SvgGenImage get bitcoinBtc => const SvgGenImage('assets/icons/bitcoin-btc.svg');

  /// File path: assets/icons/card-send.svg
  SvgGenImage get cardSend => const SvgGenImage('assets/icons/card-send.svg');

  /// File path: assets/icons/check.svg
  SvgGenImage get check => const SvgGenImage('assets/icons/check.svg');

  /// File path: assets/icons/ethereum-eth.svg
  SvgGenImage get ethereumEth => const SvgGenImage('assets/icons/ethereum-eth.svg');

  /// File path: assets/icons/eye.svg
  SvgGenImage get eye => const SvgGenImage('assets/icons/eye.svg');

  /// File path: assets/icons/group.svg
  SvgGenImage get group => const SvgGenImage('assets/icons/group.svg');

  /// File path: assets/icons/money-bag.svg
  SvgGenImage get moneyBag => const SvgGenImage('assets/icons/money-bag.svg');

  /// File path: assets/icons/money-recive.svg
  SvgGenImage get moneyRecive => const SvgGenImage('assets/icons/money-recive.svg');

  /// File path: assets/icons/moneys.svg
  SvgGenImage get moneys => const SvgGenImage('assets/icons/moneys.svg');

  /// File path: assets/icons/plus.svg
  SvgGenImage get plus => const SvgGenImage('assets/icons/plus.svg');

  /// File path: assets/icons/receipt-text.svg
  SvgGenImage get receiptText => const SvgGenImage('assets/icons/receipt-text.svg');

  /// File path: assets/icons/swap.svg
  SvgGenImage get swap => const SvgGenImage('assets/icons/swap.svg');

  /// File path: assets/icons/time.svg
  SvgGenImage get time => const SvgGenImage('assets/icons/time.svg');

  /// File path: assets/icons/user.svg
  SvgGenImage get user => const SvgGenImage('assets/icons/user.svg');

  /// File path: assets/icons/versions.svg
  SvgGenImage get versions => const SvgGenImage('assets/icons/versions.svg');

  /// File path: assets/icons/wallet.svg
  SvgGenImage get wallet => const SvgGenImage('assets/icons/wallet.svg');

  /// List of all assets
  List<SvgGenImage> get values => [
        alert,
        arrowUpRight,
        bell,
        bitcoinBtc,
        cardSend,
        check,
        ethereumEth,
        eye,
        group,
        moneyBag,
        moneyRecive,
        moneys,
        plus,
        receiptText,
        swap,
        time,
        user,
        versions,
        wallet
      ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/Bitcoin-pana.png
  AssetGenImage get bitcoinPana => const AssetGenImage('assets/images/Bitcoin-pana.png');

  /// File path: assets/images/logo.png
  AssetGenImage get logo => const AssetGenImage('assets/images/logo.png');

  /// File path: assets/images/no-files.png
  AssetGenImage get noFiles => const AssetGenImage('assets/images/no-files.png');

  /// File path: assets/images/onboard-3.png
  AssetGenImage get onboard3 => const AssetGenImage('assets/images/onboard-3.png');

  /// File path: assets/images/wallet-1.png
  AssetGenImage get wallet1 => const AssetGenImage('assets/images/wallet-1.png');

  /// List of all assets
  List<AssetGenImage> get values => [bitcoinPana, logo, noFiles, onboard3, wallet1];
}

class Assets {
  Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName, {this.size = null});

  final String _assetName;

  final Size? size;

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

class SvgGenImage {
  const SvgGenImage(
    this._assetName, {
    this.size = null,
  }) : _isVecFormat = false;

  const SvgGenImage.vec(
    this._assetName, {
    this.size = null,
  }) : _isVecFormat = true;

  final String _assetName;

  final Size? size;
  final bool _isVecFormat;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    SvgTheme? theme,
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    return SvgPicture(
      _isVecFormat
          ? AssetBytesLoader(_assetName, assetBundle: bundle, packageName: package)
          : SvgAssetLoader(_assetName, assetBundle: bundle, packageName: package),
      key: key,
      matchTextDirection: matchTextDirection,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      theme: theme,
      colorFilter: colorFilter ?? (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
