import 'package:flutter/material.dart';

class CustomBoxShadow extends BoxShadow {
  @override
  final BlurStyle blurStyle;

  const CustomBoxShadow({
    Color color = Colors.transparent,
    Offset offset = Offset.zero,
    double blurRadius = 4,
    this.blurStyle = BlurStyle.outer,
  }) : super(color: color, offset: offset, blurRadius: blurRadius);

  @override
  Paint toPaint() {
    final Paint result = Paint()
      ..color = color
      ..maskFilter = MaskFilter.blur(blurStyle, blurSigma);
    assert(() {
      if (debugDisableShadows) {
        result.maskFilter = null;
      }
      return true;
    }());
    return result;
  }
}
