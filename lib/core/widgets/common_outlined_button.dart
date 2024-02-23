import 'package:flutter/material.dart';

import '../../../core/styles/app_colors.dart';
import '../../../core/styles/font_constants.dart';
import '../../../core/styles/ui_constants.dart';
import 'common_text.dart';

class CommonButton extends StatelessWidget {
  final void Function()? onPressed;
  final String buttonText;
  final Color buttonColor;
  final Color buttonTextColor;
  final double? fontSize;
  final FontWeight fontWeight;
  final double? buttonWidth;
  final double? buttonHeight;
  final Color? border;

  CommonButton(
      {super.key,
      required this.onPressed,
      required this.buttonText,
      this.buttonTextColor = AppColors.whiteColor,
      this.buttonColor = AppColors.primaryColor,
      this.fontSize,
      this.fontWeight = FontWeightConstants.medium,
      this.buttonWidth,
      this.buttonHeight,
      this.border});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPressed?.call(),
      child: Container(
        width: buttonWidth ?? double.infinity,
        height: buttonHeight ?? UIConstants.kButtonHeight,
        decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: border ?? buttonColor,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(28)),
            color: buttonColor),
        child: Center(
          child: CommonText(
            text: buttonText,
            color: buttonTextColor,
            fontSize: fontSize ?? FontConstants.font_18,
            fontWeight: fontWeight,
          ),
        ),
      ),
    );
  }
}
