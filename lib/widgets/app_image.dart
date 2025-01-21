import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

/// * AppImageWidget内で画像ファイルの存在場所を明確にするための引数として利用
/// - [asset] => アセットから画像を配置する場合
/// - [file] => アプリ内に保存された画像を配置する場合
/// - [url] => インターネット上の画像を配置する場合
enum ImageType { asset, file, url }

/// * アプリ内でImageWidgetを使用する際は[AppImage]を推奨
/// - 画像取得時にエラーが出た際のエラー用UIが表示(NetworkImage)
/// - 読み込み時にシマーを表示
/// - 画像の角丸が容易に実装可能
/// imageプロパティには[NetworkImage]もしくは、[AssetImage]を使用
/// [AppImage.cornerSm],[AppImage.cornerMd],[AppImage.cornerLg]の角丸サイズは[$styles.corners]に依存
class AppImage extends StatelessWidget {
  final String path;
  final ImageType type;
  final double? height;
  final double? width;
  final BoxFit? fit;
  final double? rTopLeft;
  final double? rTopRight;
  final double? rBottomLeft;
  final double? rBottomRight;
  const AppImage({
    super.key,
    required this.path,
    required this.type,
    this.height,
    this.width,
    this.fit,
    this.rTopLeft,
    this.rTopRight,
    this.rBottomLeft,
    this.rBottomRight,
  });

  static const _cSmall = 8.0;
  static const _cMedium = 16.0;
  static const _cLarge = 32.0;

  factory AppImage.cornerSm({
    required String path,
    required ImageType type,
    double? height,
    double? width,
    BoxFit? fit,
  }) {
    return AppImage(
      path: path,
      type: type,
      height: height,
      width: width,
      fit: fit,
      rTopLeft: _cSmall,
      rTopRight: _cSmall,
      rBottomLeft: _cSmall,
      rBottomRight: _cSmall,
    );
  }

  factory AppImage.cornerMd({
    required String path,
    required ImageType type,
    double? height,
    double? width,
    BoxFit? fit,
  }) {
    return AppImage(
      path: path,
      type: type,
      height: height,
      width: width,
      fit: fit,
      rTopLeft: _cMedium,
      rTopRight: _cMedium,
      rBottomLeft: _cMedium,
      rBottomRight: _cMedium,
    );
  }

  factory AppImage.cornerLg({
    required String path,
    required ImageType type,
    double? height,
    double? width,
    BoxFit? fit,
  }) {
    return AppImage(
      path: path,
      type: type,
      height: height,
      width: width,
      fit: fit,
      rTopLeft: _cLarge,
      rTopRight: _cLarge,
      rBottomLeft: _cLarge,
      rBottomRight: _cLarge,
    );
  }

  factory AppImage.circular({
    required String path,
    required ImageType type,
    required double size,
  }) {
    return AppImage(
      path: path,
      type: type,
      height: size,
      width: size,
      fit: BoxFit.cover,
      rTopLeft: size / 2,
      rTopRight: size / 2,
      rBottomLeft: size / 2,
      rBottomRight: size / 2,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: rTopLeft != null ? Radius.circular(rTopLeft!) : Radius.zero,
        topRight: rTopRight != null ? Radius.circular(rTopRight!) : Radius.zero,
        bottomLeft:
            rBottomLeft != null ? Radius.circular(rBottomLeft!) : Radius.zero,
        bottomRight:
            rBottomRight != null ? Radius.circular(rBottomRight!) : Radius.zero,
      ),
      child: _imageWidget(),
    );
  }

  Widget _imageWidget() {
    switch (type) {
      case ImageType.asset:
        return Image.asset(
          path,
          height: height,
          width: width,
          fit: fit,
          errorBuilder: (context, object, stackTrace) {
            debugPrint('Load failed: ${context.toString()}');
            return _error();
          },
        );
      case ImageType.file:
        return Image.file(
          File(path),
          height: height,
          width: width,
          fit: fit,
          errorBuilder: (context, object, stackTrace) {
            debugPrint('Load failed: ${context.toString()}');
            return _error();
          },
        );
      case ImageType.url:
        return CachedNetworkImage(
          imageUrl: path,
          height: height,
          width: width,
          fit: fit,
          errorWidget: (context, url, error) {
            debugPrint('Load failed: ${context.toString()}');
            return _error();
          },
          placeholder: (context, url) {
            return _loading();
          },
        );
    }
  }

  Widget _error() {
    return Container(
      height: height,
      width: width,
      color: Colors.grey[300]!,
      child: Icon(
        Icons.broken_image,
        color: Colors.grey,
        size: (height == null && width == null)
            ? null
            : (height! >= width!)
                ? width! / 2
                : height! / 2,
      ),
    );
  }

  Widget _loading() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        height: height,
        width: width,
        color: Colors.grey[300]!,
      ),
    );
  }
}
