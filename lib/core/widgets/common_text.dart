import 'package:flutter/material.dart';

import '../../../core/styles/font_constants.dart';

class CommonText extends StatelessWidget {
  final String text;
  final int maxLine;
  final bool? softWrap;
  final TextAlign? textAlign;
  final Color? color;
  final TextDecoration textDecoration;
  final Color? decorationColor;
  final double? fontSize;
  final double? height;
  final FontWeight? fontWeight;
  final TextOverflow textOverflow;
  final String fontFamily;

  // final TextStyle? textStyle;

  const CommonText({
    super.key,
    this.text = "",
    this.maxLine = 3,
    this.softWrap,
    this.textAlign,
    this.color,
    this.textDecoration = TextDecoration.none,
    this.decorationColor,
    this.fontSize,
    this.height,
    this.fontWeight,
    this.textOverflow = TextOverflow.ellipsis,
    this.fontFamily = FontFamilyConstants.fontName,
    // this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLine,
      softWrap: softWrap,
      textAlign: textAlign,
      style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: color,
            decoration: textDecoration,
            decorationColor: decorationColor ?? color,
            fontSize: fontSize,
            height: height,
            fontWeight: fontWeight,
            overflow: textOverflow,
            fontFamily: fontFamily,
          ),
      /*style: TextStyle(
        color: color,
        decoration: textDecoration,
        decorationColor: decorationColor ?? color,
        fontSize: fontSize,
        height: height,
        fontWeight: fontWeight,
        overflow: textOverflow,
        fontFamily: fontFamily,
      ),*/
    );
  }
}
