import 'package:flutter/material.dart';

import '../../widgets/dialog/custom_alert_dialog.dart';
import '../theme_util.dart';

extension MediaQueryValues on BuildContext {
  double get statusBarHeight => MediaQuery.of(this).viewPadding.top;

  double get navigationBarHeight => MediaQuery.of(this).viewPadding.bottom;

  MediaQueryData get mediaQuery => MediaQuery.of(this);

  double get width => MediaQuery.of(this).size.width;

  double get height => MediaQuery.of(this).size.height;

  void showToast(
    String message, {
    Duration? duration,
    double? marginBottom,
  }) {
    ScaffoldMessenger.of(this).showSnackBar(SnackBar(
      content: Text(
        message,
        style: const TextStyle(fontWeight: MyFontWeight.medium),
        textAlign: TextAlign.center,
      ),
      duration: duration ?? const Duration(milliseconds: 1000),
      margin:
          EdgeInsets.symmetric(horizontal: 64, vertical: marginBottom ?? 24),
      backgroundColor: Colors.white.withOpacity(0.9),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
    ));
  }

  //
  // showSnackBar(String message,
  //     {Color? color, Duration? duration, TextStyle? style}) {
  //   ScaffoldMessenger.of(this).showSnackBar(
  //     SnackBar(
  //       content: Text(message, style: style),
  //       backgroundColor: color,
  //       duration: duration ?? const Duration(seconds: 4),
  //     ),
  //   );
  // }
  //
  // showSnackBarError(
  //   String message, {
  //   Duration? duration,
  // }) {
  //   showSnackBar(
  //     message,
  //     color: ColorUtil.orangePink,
  //     duration: duration,
  //     style: s(this, color: Colors.white),
  //   );
  // }
  //
  // showSnackBarSuccess(
  //   String message, {
  //   Duration? duration,
  // }) {
  //   showSnackBar(
  //     message,
  //     color: ColorUtil.emerald,
  //     duration: duration,
  //     style: s(this, color: Colors.black),
  //   );
  // }

  void showAlert(
    String message, {
    String buttonText = "Ok",
    bool isButtonPositive = true,
    void Function()? onOk,
  }) {
    CustomAlertDialog.show(
      this,
      content: message,
      isShowTitle: false,
      leftText: (buttonText),
      isLeftPositive: isButtonPositive,
      leftAction: onOk,
    );
  }

  void showYesNoDialog(
    String message, {
    String rightText = "Yes",
    String leftText = "No",
    void Function()? rightAction,
    void Function()? leftAction,
  }) {
    CustomAlertDialog.show(
      this,
      content: message,
      isShowTitle: false,
      rightText: (rightText),
      leftText: (leftText),
      isRightPositive: true,
      leftAction: leftAction,
      rightAction: rightAction,
    );
  }
}
