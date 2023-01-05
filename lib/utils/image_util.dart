import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ImageUtil {
  static Widget loadNetWork({
    required String url,
    BoxFit fit = BoxFit.cover,
    double? height,
    double? width,
    String? placeHolder,
  }) {
    placeHolder ??= 'img_placeholder.jpg';
    String assetPlaceHolder = assetImg(placeHolder);

    Widget placeholderWidget;
    if (placeHolder.endsWith('.svg')) {
      placeholderWidget = SvgPicture.asset(
        assetPlaceHolder,
        height: height,
        width: width,
        fit: fit,
      );
    } else {
      placeholderWidget = Image.asset(
        assetPlaceHolder,
        fit: fit,
        height: height,
        width: width,
      );
    }

    // Load network image
    if (url.contains('http') && url.isNotEmpty) {
      if (url.endsWith('.svg')) {
        return SvgPicture.network(
          url,
          fit: fit,
          height: height,
          width: width,
          placeholderBuilder: (context) {
            return placeholderWidget;
          },
        );
      } else {
        return CachedNetworkImage(
          imageUrl: url,
          fit: fit,
          height: height,
          width: width,
          placeholder: (context, url) {
            return placeholderWidget;
          },
          errorWidget: (ctx, url, error) {
            return placeholderWidget;
          },
        );
      }
    }
    return placeholderWidget;
  }

  static Widget loadAssets({
    Key? key,
    required String fileName,
    double? width,
    double? height,
    Color? color,
    BoxFit fit = BoxFit.cover,
    Alignment alignment = Alignment.center,
    bool fullPath = false,
  }) {
    String assetName = fullPath ? fileName : assetImg(fileName);
    if (fileName.endsWith('.svg')) {
      return SvgPicture.asset(
        assetName,
        key: key,
        width: width,
        height: height,
        fit: fit,
        color: color,
        alignment: alignment,
      );
    } else {
      return Image.asset(
        assetName,
        key: key,
        width: width,
        height: height,
        fit: fit,
        color: color,
        alignment: alignment,
      );
    }
  }
}

String assetImg(String fileName) {
  return 'assets/images/$fileName';
}
