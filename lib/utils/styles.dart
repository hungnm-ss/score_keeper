import 'package:base_flutter/utils/screen_utils/size_extension.dart';
import 'package:base_flutter/utils/theme_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/shadow_decoration.dart';

class MyStyles {
  late ThemeData themeData;

  MyStyles(this.themeData);

  factory MyStyles.of(BuildContext context) {
    return MyStyles(Theme.of(context));
  }

  static const horizontalMargin = 12.0;
  static const verticalMargin = 18.0;

  static List<Shadow> textShadows = [
    Shadow(
      offset: const Offset(0, 5),
      blurRadius: 8.0,
      color: Colors.black.withOpacity(0.5),
    )
  ];
  static List<BoxShadow> boxShadows = [
    CustomBoxShadow(
      color: Colors.black.withOpacity(0.5),
      blurRadius: 5,
    ),
  ];

  static const systemUiOverlayStyle = SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    systemNavigationBarColor: Colors.black,
    statusBarIconBrightness: Brightness.light, // For Android
    statusBarBrightness: Brightness.dark, // For iOS
  );
}

TextStyle s({
  double? fontSize,
  Color? color,
  FontWeight? fontWeight,
  double? height,
}) {
  return GoogleFonts.montserrat(
      textStyle: TextStyle(
          color: color ?? Colors.white,
          fontSize: (fontSize ?? 14).sp,
          fontWeight: fontWeight ?? MyFontWeight.medium,
          height: height));
}
