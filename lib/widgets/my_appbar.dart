import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/color_util.dart';
import '../utils/styles.dart';
import '../utils/theme_util.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? titleWidget;
  final Widget? leadWidget;
  final List<Widget>? actionWidgets;
  final Color? backgroundColor;
  final Color? shadowColor;
  final bool isBackNavigation;
  final PreferredSizeWidget? bottom;
  final double? titleSpacing;
  final bool centerTitle;
  final bool showShadow;
  final VoidCallback? onBack;
  final VoidCallback? onTapTitleWidget;

  final Size barSize;
  final BorderRadius borderRadius;
  final SystemUiOverlayStyle systemOverlayStyle;
  final Color? colorICBack;

  MyAppBar({
    Key? key,
    this.title = '',
    this.titleWidget,
    this.backgroundColor = ColorUtil.transparent,
    this.shadowColor = Colors.white,
    this.isBackNavigation = true,
    this.leadWidget,
    this.actionWidgets,
    this.bottom,
    this.titleSpacing = NavigationToolbar.kMiddleSpacing,
    this.centerTitle = true,
    this.showShadow = false,
    this.onBack,
    this.onTapTitleWidget,
    this.borderRadius = BorderRadius.zero,
    this.systemOverlayStyle = MyStyles.systemUiOverlayStyle,
    this.colorICBack = Colors.white,
  })  : barSize = Size.fromHeight(
      kToolbarHeight + (bottom?.preferredSize.height ?? 0.0)),
        super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(barSize.height);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(100),
      child: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius,
        ),
        title: _buildAppTitle(context),
        leading: _buildLeadButton(context),
        systemOverlayStyle: systemOverlayStyle,
        actions: actionWidgets,
        centerTitle: centerTitle,
        backgroundColor: backgroundColor,
        elevation: showShadow ? 2 : 0,
        shadowColor: shadowColor,
        titleSpacing: titleSpacing,
        automaticallyImplyLeading: false,
        bottom: bottom,
      ),
    );
  }

  Widget _buildAppTitle(BuildContext context) {
    if (titleWidget != null) {
      return GestureDetector(
        onTap: onTapTitleWidget,
        child: titleWidget,
      );
    } else {
      return Text(
        title,
        style: s(fontSize: 15,fontWeight: MyFontWeight.semiBold),
      );
    }
  }

  Widget? _buildLeadButton(BuildContext context) {
    if (isBackNavigation) {
      return GestureDetector(
        child: Container(
          color: ColorUtil.transparent,
          child: Icon(
            Icons.arrow_back_ios_rounded,
            color: colorICBack,
          ),
        ),
        onTap: () {
          if (onBack != null) {
            onBack!();
          } else {
            Navigator.of(context).pop();
          }
        },
      );
    } else {
      return leadWidget;
    }
  }
}
