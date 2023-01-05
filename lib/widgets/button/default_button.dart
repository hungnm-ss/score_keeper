import 'package:flutter/material.dart';

import '../../utils/color_util.dart';
import '../../utils/styles.dart';
import '../../utils/theme_util.dart';

class GradientButton extends StatelessWidget {
  final String? text;
  final double width;
  final double height;
  final List<Color>? colors;
  final Color? color;
  final double borderRadius;
  final void Function()? onPressed;
  final TextStyle? titleStyle;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;
  final bool isShadow;

  const GradientButton({
    Key? key,
    this.text,
    this.width = 267,
    this.height = 48,
    this.colors,
    this.color,
    this.borderRadius = 24,
    this.onPressed,
    this.titleStyle,
    this.padding = const EdgeInsets.symmetric(horizontal: 8),
    this.margin = EdgeInsets.zero,
    this.isShadow = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: margin,
      decoration: BoxDecoration(
        // boxShadow: [
        //   BoxShadow(
        //     color: colors?.first?.withOpacity(0.5) ?? Colors.white,
        //     offset: const Offset(0, 8),
        //     blurRadius: 16.0,
        //   )
        // ],colors
        //[const Color(0xFFBF26E5), const Color(0xFF3C14DA)]
        gradient: color != null
            ? null
            : (colors != null && colors!.length > 1
                ? LinearGradient(colors: colors!)
                : null),
        color: colors != null && colors!.isNotEmpty ? colors!.first : null,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ),
          backgroundColor:
              MaterialStateProperty.all(color ?? Colors.transparent),
          shadowColor:
              isShadow ? MaterialStateProperty.all(Colors.transparent) : null,
        ),
        onPressed: onPressed,
        child: Padding(
          padding: padding,
          child: Text(
            text ?? '',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: titleStyle ?? s(fontSize: 16),
          ),
        ),
      ),
    );
  }
}

class DefaultGradientButton extends GradientButton {
  const DefaultGradientButton({
    Key? key,
    String? text,
    Function()? onPressed,
    double? width,
    TextStyle titleStyle =
        const TextStyle(fontSize: 15, fontWeight: MyFontWeight.bold),
    double? height,
    List<Color>? colors = const [Color(0xffe22dff)],
    EdgeInsetsGeometry margin = EdgeInsets.zero,
    double borderRadius = 13,
    bool isShadow = false,
  }) : super(
          key: key,
          text: text,
          colors: colors,
          titleStyle: titleStyle,
          onPressed: onPressed,
          width: width ?? 250,
          height: height ?? 48,
          margin: margin,
          borderRadius: borderRadius,
          isShadow: isShadow,
        );
}

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key? key,
    required this.onPressed,
    this.text,
    this.child,
    this.color = ColorUtil.primary,
    this.style,
    this.padding = const EdgeInsets.symmetric(horizontal: 13),
    this.borderRadius,
    this.width,
    this.height = 48,
    this.showShadow = true,
    this.enabled = true,
  })  : assert(!(child != null && text != null)),
        super(key: key);

  final void Function()? onPressed;
  final String? text;
  final Widget? child;
  final EdgeInsetsGeometry padding;
  final Color color;
  final TextStyle? style;
  final BorderRadius? borderRadius;
  final double? width;
  final double? height;
  final bool showShadow;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: TextButton(
        onPressed: enabled ? onPressed : null,
        style: OutlinedButton.styleFrom(
          shadowColor: Colors.black,
          elevation: showShadow ? 5 : 0,
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(13),
          ),
          backgroundColor: enabled ? color : const Color(0xff3e1e47),
          padding: padding,
        ),
        child: child ??
            Text(
              '$text',
              style: style ??
                  s(
                    color: enabled ? Colors.white : const Color(0xff4e4c54),
                    fontWeight: MyFontWeight.bold,
                  ),
            ),
      ),
    );
  }
}

class DefaultOutlinedButton extends StatelessWidget {
  final void Function()? onPressed;
  final String? text;
  final Widget? child;
  final EdgeInsetsGeometry padding;
  final Color? textColor;
  final double? width;
  final double? height;

  const DefaultOutlinedButton({
    Key? key,
    required this.onPressed,
    this.width,
    this.height,
    this.text,
    this.child,
    this.textColor = Colors.white,
    this.padding = const EdgeInsets.symmetric(horizontal: 12),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: Colors.grey),
          padding: padding,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(13),
          ),
        ),
        child: child ?? Text('$text', style: s(color: textColor)),
      ),
    );
  }
}
