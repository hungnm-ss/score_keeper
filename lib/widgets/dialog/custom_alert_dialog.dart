import 'package:score_keeper/utils/styles.dart';
import 'package:score_keeper/widgets/button/default_button.dart';
import 'package:flutter/material.dart';


import '../../utils/color_util.dart';
import '../../utils/image_util.dart';
import '../../utils/theme_util.dart';

class CustomAlertDialog {
  static void show(
    BuildContext context, {
    String title = '',
    String asset = '',
    String content = '',
    String leftText = '',
    String rightText = '',
    bool isLeftPositive = false,
    bool isRightPositive = false,
    bool isShowTitle = true,
    bool isShowButtonClose = true,
    Function? leftAction,
    Function? rightAction,
    Function? backListener,
    Color? colorBackground,
  }) {
    showDialog(
        barrierColor: Colors.black12.withOpacity(0.75),
        context: context,
        barrierDismissible: false,
        builder: (ctx) {
          return _CustomAlertDialogWidget(
            context: ctx,
            title: title,
            content: content,
            asset: asset,
            leftText: leftText,
            rightText: rightText,
            isLeftPositive: isLeftPositive,
            isRightPositive: isRightPositive,
            isShowTitle: isShowTitle,
            isShowButtonClose: isShowButtonClose,
            leftAction: leftAction,
            rightAction: rightAction,
            backListener: backListener,
            colorBackground: colorBackground,
          );
        }).then((value) => backListener);
  }
}

class _CustomAlertDialogWidget extends StatelessWidget {
  final BuildContext context;
  final String title;
  final String content;
  final String asset;
  final bool isLeftPositive;
  final bool isRightPositive;
  final bool isShowTitle;
  final bool isShowButtonClose;
  final String leftText;
  final String rightText;
  final Function? leftAction;
  final Function? rightAction;
  final Function? backListener;
  final Color? colorBackground;

  const _CustomAlertDialogWidget(
      {required this.context,
      required this.title,
      required this.content,
      required this.asset,
      required this.isLeftPositive,
      required this.isRightPositive,
      required this.isShowTitle,
      required this.isShowButtonClose,
      required this.leftText,
      required this.rightText,
      this.leftAction,
      this.rightAction,
      this.backListener,
      this.colorBackground});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Material(
          type: MaterialType.transparency,
          borderOnForeground: false,
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: colorBackground ?? Colors.white,
              ),
              padding: const EdgeInsets.only(bottom: 20),
              margin: const EdgeInsets.symmetric(horizontal: MyStyles.horizontalMargin),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (isShowTitle)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(width: 40),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child:
                              Text(title, style: const TextStyle(fontSize: 20)),
                        ),
                        Visibility(
                          visible: isShowButtonClose,
                          replacement: const SizedBox(width: 40),
                          child: DefaultButton(
                              padding: const EdgeInsets.all(16),
                              borderRadius: BorderRadius.circular(12),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: ImageUtil.loadAssets(
                                fileName: 'ic_close.svg',
                                color: Colors.white,
                              )),
                        )
                      ],
                    ),
                  title.isNotEmpty
                      ? const Divider(
                          color: Colors.white, height: 0)
                      : const SizedBox(),
                  const SizedBox(height: 16),
                  asset.isNotEmpty
                      ? ImageUtil.loadAssets(fileName: asset)
                      : const SizedBox(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(height: 16),
                        ConstrainedBox(
                          constraints: const BoxConstraints(maxHeight: 400),
                          child: SingleChildScrollView(
                            child: _buildTextContent(),
                          ),
                        ),
                        const SizedBox(height: 24),
                        Row(
                          mainAxisAlignment: rightText.isEmpty
                              ? MainAxisAlignment.center
                              : MainAxisAlignment.spaceBetween,
                          children: [
                            Visibility(
                                visible: leftText.isNotEmpty,
                                child: _buildButton(
                                    text: leftText,
                                    isPositive: isLeftPositive,
                                    action: leftAction)),
                            const SizedBox(width: 16),
                            Visibility(
                                visible: rightText.isNotEmpty,
                                child: _buildButton(
                                    text: rightText,
                                    isPositive: isRightPositive,
                                    action: rightAction)),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        onWillPop: () async {
          if (backListener != null) {
            backListener!();
            return false;
          }
          return false;
        });
  }

  Text _buildTextContent() {
    return Text(
      content,
      style: const TextStyle(
          fontSize: 16,
          color: ColorUtil.primary,
          fontWeight: MyFontWeight.medium),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildButton({text, isPositive, action}) {
    return rightText.isNotEmpty
        ? Expanded(child: _button(isPositive, action, text))
        : SizedBox(
            width: 150,
            child: _button(isPositive, action, text),
          );
  }

  StatelessWidget _button(isPositive, action, text) {
    return DefaultButton(
        color: isPositive ? ColorUtil.primary : Colors.grey,
        borderRadius: BorderRadius.circular(30),
        padding: const EdgeInsets.symmetric(vertical: 10),
        onPressed: () {
          if (action == null) {
            Navigator.pop(context);
          } else {
            action();
          }
        },
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 16, color: Colors.white),
        ));
  }
}
