import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ColorUtil {
  static const Color primary = Color(0xffECB365);
  static const Color backgroundPrimary = Color(0xff041C32);
  static const Color backgroundSecondary = Color(0xFF064663);
  static const Color defaultTextColor = Color(0xFFffffff);
  static const Color grey = Color(0xFFfafafa);

  static const Color transparent = Color(0x00ffffff);


  // static Future<Color> getVibrantColor({String? url}) async {
  //   if (url?.isEmpty == true) return primary;
  //   PaletteGenerator? paletteGenerator =
  //   await PaletteGenerator.fromImageProvider(Image.network(url!).image);
  //   return (paletteGenerator.vibrantColor?.color ?? defaultBackground);
  // }
}
