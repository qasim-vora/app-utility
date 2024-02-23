import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:core_app/l10n/localization.dart';
import 'package:core_app/utils/extensions.dart';
import 'package:core_app/utils/navigation_extention.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../core/styles/app_colors.dart';
import '../../core/styles/font_constants.dart';
import '../../core/styles/ui_constants.dart';
import '../../utils/custom_widgets/read_more_text_widget.dart';
import '../widgets/common_text.dart';
import 'app_constants/app_value_constants.dart';
import 'app_constants/icon_constants.dart';
import 'app_constants/image_constants.dart';
import 'common_methods.dart';

class CommonWidgets {
  static showSnackBar(String message, {bool success = true}) {
    // todo: snackbar
  }

  /// expandable text
  static ReadMoreText readMoreText({
    Color? color = Colors.black,
    double? fontSize,
    double? height,
    String? text,
    FontWeight? fontWeight,
    TextAlign? textAlign,
    int maxLine = 3,
    String fontFamily = FontFamilyConstants.fontName,
    TextDecoration textDecoration = TextDecoration.none,
    Color? decorationColor,
    Color? colorClickableText,
    TextOverflow textOverflow = TextOverflow.ellipsis,
    bool? softWrap,
  }) {
    return ReadMoreText(
      text ?? "",
      textAlign: textAlign,
      trimLines: maxLine,
      trimMode: TrimMode.Line,
      trimCollapsedText: "View more",
      trimExpandedText: "\nView less",
      lessStyle: TextStyle(
        color: color,
        decoration: TextDecoration.underline,
        decorationColor: decorationColor ?? color,
        fontSize: fontSize,
        height: height,
        fontWeight: fontWeight,
        overflow: textOverflow,
        fontFamily: fontFamily,
      ),
      moreStyle: TextStyle(
        color: color,
        decoration: TextDecoration.underline,
        decorationColor: decorationColor ?? color,
        fontSize: fontSize,
        height: height,
        fontWeight: fontWeight,
        overflow: textOverflow,
        fontFamily: fontFamily,
      ),
      colorClickableText: const Color(0xff041727).withOpacity(0.7),
      style: TextStyle(
        color: color,
        decoration: textDecoration,
        decorationColor: decorationColor ?? color,
        fontSize: fontSize,
        height: height,
        fontWeight: fontWeight,
        overflow: textOverflow,
        fontFamily: fontFamily,
      ),
    );
  }

  /// circular border
  static BorderRadius circularBorder({
    double radius = 15,
  }) {
    return BorderRadius.circular(radius);
  }

  /// common text
  static Widget commonText({
    Color? color = Colors.black,
    double? fontSize,
    double? height,
    String? text,
    FontWeight? fontWeight,
    TextAlign? textAlign,
    int? maxLine = 3,
    String fontFamily = FontFamilyConstants.fontName,
    TextDecoration textDecoration = TextDecoration.none,
    Color? decorationColor,
    TextOverflow textOverflow = TextOverflow.ellipsis,
    bool? softWrap,
  }) {
    return Text(
      text ?? "",
      maxLines: maxLine,
      softWrap: softWrap,
      textAlign: textAlign,
      style: TextStyle(
        color: color,
        decoration: textDecoration,
        decorationColor: decorationColor ?? color,
        fontSize: fontSize,
        height: height,
        fontWeight: fontWeight,
        overflow: textOverflow,
        fontFamily: fontFamily,
      ),
    );
  }

  static noInternetDialog({
    required BuildContext context,
  }) {
    Widget title = CommonText(
      text: context.translate.noInternet,
      fontSize: FontConstants.font_16,
      fontWeight: FontWeightConstants.semiBold,
      color: AppColors.blackColor.withOpacity(0.7),
    );
    Widget content = CommonText(
      text: context.translate.message,
      fontSize: FontConstants.font_14,
      fontWeight: FontWeightConstants.medium,
      color: AppColors.blackColor.withOpacity(0.6),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (dialogContext) {
        return Theme.of(context).platform == TargetPlatform.iOS
            ? PopScope(
                canPop: false,
                child: CupertinoAlertDialog(
                  title: title,
                  content: content,
                ),
              )
            : PopScope(
                canPop: false,
                child: Theme(
                  data: ThemeData(useMaterial3: false),
                  child: AlertDialog(
                    title: title,
                    content: content,
                  ),
                ),
              );
      },
    );
  }

  static Widget showContainerImage({
    required String icon,
    Color? containerColor,
  }) {
    return Container(
      width: 48.w,
      height: 48.h,
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(8),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.fieldBorderColor,
        ),
        color: containerColor ?? AppColors.whiteColor.withOpacity(0.8),
        borderRadius: BorderRadius.circular(8),
      ),
      child: SvgPicture.asset(
        icon,
        width: 20.w,
        height: 20.h,
        colorFilter: const ColorFilter.mode(
          AppColors.blackColor,
          BlendMode.srcIn,
        ),
      ),
    );
  }

  static Widget commonFilledButton({
    required BuildContext? context,
    bool isDisabled = false,
    String? text,
    Widget? buttonIcon,
    Color? color = AppColors.blackColor,
    Color? textColor = AppColors.whiteColor,
    Color borderColor = Colors.transparent,
    double? fontSize,
    double? topPadding,
    double? buttonHeight,
    double? buttonWidth,
    double buttonRadius = 28,
    FontWeight? fontWeight = FontWeightConstants.bold,
    void Function()? onclick,
    String fontFamily = FontFamilyConstants.fontName,
  }) {
    return Padding(
      padding: EdgeInsets.only(top: topPadding ?? 0),
      child: isDisabled
          ? Container(
              height: buttonHeight ?? UIConstants.kButtonHeight,
              width: buttonWidth ?? double.infinity,
              decoration: BoxDecoration(
                color: color?.withOpacity(0.3),
                border: Border.all(
                  color: borderColor,
                  width: borderColor == Colors.transparent ? 0 : 1,
                ),
                borderRadius: BorderRadius.circular(buttonRadius),
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buttonIcon ?? Container(),
                    Padding(
                      padding:
                          EdgeInsets.only(left: buttonIcon == null ? 0 : 4),
                      child: Text(
                        text ?? "",
                        style: TextStyle(
                          color: textColor,
                          fontSize: fontSize ?? FontConstants.font_16,
                          height: 1.0,
                          fontWeight: fontWeight,
                          overflow: TextOverflow.ellipsis,
                          fontFamily: fontFamily,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          : GestureDetector(
              onTap: () {
                onclick?.call();
                CommonMethods().hideKeyboard(context!);
              },
              child: Container(
                height: buttonHeight ?? UIConstants.kButtonHeight,
                width: buttonWidth ?? double.infinity,
                decoration: BoxDecoration(
                  color: color,
                  border: Border.all(
                    color: borderColor,
                    width: borderColor == Colors.transparent ? 0 : 1,
                  ),
                  borderRadius: BorderRadius.circular(buttonRadius),
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      buttonIcon ?? Container(),
                      Padding(
                        padding:
                            EdgeInsets.only(left: buttonIcon == null ? 0 : 4),
                        child: Text(
                          text ?? "",
                          style: TextStyle(
                            color: textColor,
                            fontSize: fontSize,
                            height: 1.0,
                            fontWeight: fontWeight,
                            overflow: TextOverflow.ellipsis,
                            fontFamily: fontFamily,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  /// common text field
  static Widget commonTextFormField({
    BuildContext? context,
    bool isWithHeader = false,
    bool isOptional = false,
    AutovalidateMode? autoValidateMode,
    bool autofocus = false,
    bool expands = false,
    bool readOnly = false,
    bool enabled = true,
    bool filled = true,
    Color? filledColor,
    TextEditingController? textEditingController,
    Color textColor = AppColors.blackColor,
    TextAlign textAlign = TextAlign.start,
    Widget? suffixIcon,
    Widget? prefixIcon,
    bool obscureText = false,
    EdgeInsets contentPadding =
        const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
    double? letterSpacing,
    double? wordSpacing,
    double inputFontSize = 18,
    FontWeight inputFontWeight = FontWeightConstants.medium,
    double headerFontSize = 16,
    FontWeight? headerFontWeight,
    String fontFamily = FontFamilyConstants.fontName,
    String? headerText,
    String? counterText,
    String? hintText,
    Color hintColor = AppColors.greyColor,
    double? hintFontSize,
    FontWeight? hintFontWeight,
    Color? borderColor,
    double borderRadius = 16,
    Function? onEditingComplete,
    Function? onFieldSubmitted,
    Function(String)? onChanged,
    Function? onTap,

    ///validation
    bool allowValidation = true,
    String? errorMessage,
    String? validationMessage,
    String? validationRegex,
    int? value,
    int? length,
    String? prefixText,
    String? lengthMessage,
    FocusNode? focusNode,
    int? minLines,
    int? maxLines,
    int? maxLength,
    List<TextInputFormatter> inputFormat = const [],
    TextInputType textInputType = TextInputType.text,
    TextInputAction textInputAction = TextInputAction.done,
    FocusNode? nextFocusNode,
    TextCapitalization textCapitalization = TextCapitalization.none,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        isWithHeader
            ? Row(
                children: [
                  CommonWidgets.commonText(
                    text: headerText ?? "",
                    fontWeight: headerFontWeight ?? FontWeightConstants.medium,
                    fontSize: headerFontSize,
                    color: AppColors.blackColor,
                  ),
                  isOptional
                      ? Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: CommonWidgets.commonText(
                            text: "Optional",
                            color: AppColors.blackColor,
                            fontSize: FontConstants.font_18,
                          ),
                        )
                      : Container(),
                ],
              )
            : Container(),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          autovalidateMode: autoValidateMode,
          validator: (text) {
            if (textEditingController!.text.trim().isEmpty && allowValidation) {
              return errorMessage ?? "Invalid errorMessage";
            } else if (value != null &&
                (int.parse(textEditingController.text.trim().trim()) > value)) {
              return validationMessage ?? "Invalid value";
            } else if (length != null && lengthMessage != null) {
              if (textEditingController.text.trim().length < length ||
                  textEditingController.text.trim().length > length) {
                return lengthMessage;
              }
            } else if (validationRegex != null) {
              if (!RegExp(validationRegex).hasMatch(text!.trim())) {
                return validationMessage ?? "Invalid Validation Message";
              }
            }
            return null;
          },
          textAlign: textAlign,
          controller: textEditingController,
          enabled: enabled,
          readOnly: readOnly,
          expands: expands,
          obscureText: obscureText,
          obscuringCharacter: "*",
          autofocus: autofocus,
          focusNode: focusNode,
          maxLength: maxLength,
          minLines: minLines,
          maxLines: maxLines,
          keyboardType: textInputType,
          textInputAction: textInputAction,
          textCapitalization: textCapitalization,
          inputFormatters: inputFormat.isEmpty ? null : inputFormat,
          //inputFormatter != null ? <TextInputFormatter>[inputFormatter] : null,

          decoration: InputDecoration(
            contentPadding: contentPadding,
            counterStyle: const TextStyle(color: AppColors.greyColor),
            counterText: counterText,
            fillColor: filledColor,
            filled: filled,
            hintText: hintText,
            hintStyle: TextStyle(
              color: hintColor,
              fontSize: hintFontSize ?? FontConstants.font_16,
              fontWeight: hintFontWeight ?? inputFontWeight,
              letterSpacing: letterSpacing,
              wordSpacing: wordSpacing,
            ),
            errorStyle: const TextStyle(
              color: AppColors.redColor,
            ),
            errorMaxLines: 3,
            prefixIcon: prefixIcon == null
                ? null
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: prefixIcon,
                  ),
            suffixIcon: suffixIcon == null
                ? null
                : SizedBox(
                    height: 20,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: suffixIcon,
                    ),
                  ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide:
                  BorderSide(color: borderColor ?? AppColors.whiteColor),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: BorderSide(
                color: borderColor ?? AppColors.transparentColor,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: BorderSide(
                color: borderColor ?? AppColors.transparentColor,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: BorderSide(
                color: borderColor ?? AppColors.transparentColor,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: BorderSide(
                color: borderColor ?? AppColors.transparentColor,
              ),
            ),
          ),
          cursorColor: AppColors.greyColor,
          //cursorHeight: 16,
          style: TextStyle(
            fontSize: inputFontSize,
            color: enabled == false ? textColor.withOpacity(0.3) : textColor,
            fontWeight: inputFontWeight,
            fontFamily: fontFamily,
            letterSpacing: letterSpacing,
            wordSpacing: wordSpacing,
          ),

          onChanged: (value) {
            onChanged?.call(value);
          },
          onTap: () {
            onTap?.call();
          },
          onEditingComplete: () {
            onEditingComplete?.call();
          },
          onFieldSubmitted: (value) {
            onFieldSubmitted?.call();
            if (textInputAction == TextInputAction.done) {
              CommonMethods().hideKeyboard(context!);
            } else if (textInputAction == TextInputAction.next) {
              FocusScope.of(context!).requestFocus(
                nextFocusNode,
              );
            }
          },
          onTapOutside: (event) => CommonMethods().hideKeyboard(context!),
        ),
      ],
    );
  }

  /// common elevated button
  static Widget commonElevatedButton({
    required BuildContext? context,
    required String buttonText,
    required void Function()? onPressed,
    TextStyle? textStyle,
    Color backgroundColor = AppColors.blackColor,
    Color foregroundColor = AppColors.whiteColor,
    double? width,
    double? height,
    BorderSide? side,
    double? fontSize,
    FontWeight fontWeight = FontWeightConstants.semiBold,
  }) {
    return ElevatedButton(
      onPressed: () {
        onPressed?.call();
        CommonMethods().hideKeyboard(context!);
      },
      style: ElevatedButton.styleFrom(
        textStyle: TextStyle(
          fontSize: fontSize ?? FontConstants.font_16,
          fontWeight: fontWeight,
          fontFamily: FontFamilyConstants.fontName,
        ),
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        side: side,
        minimumSize: Size(
          width ?? double.infinity,
          height ?? UIConstants.kButtonHeight,
        ),
      ),
      child: Text(
        buttonText,
        textAlign: TextAlign.center,
      ),
    );
  }

  static showCustomDialog(context, String titleName, String titleContent,
      String leftButtonText, String rightButtonText, Function(int) callback) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(28.0)), //this right here
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  CommonWidgets.commonText(
                      textAlign: TextAlign.left,
                      text: titleName,
                      fontFamily: FontFamilyConstants.fontName,
                      fontWeight: FontWeightConstants.bold,
                      fontSize: FontConstants.font_18,
                      color: AppColors.blackColor),
                  const SizedBox(
                    height: 24,
                  ),
                  CommonWidgets.commonText(
                    textAlign: TextAlign.center,
                    text: titleContent,
                    fontFamily: FontFamilyConstants.fontName,
                    fontWeight: FontWeightConstants.semiBold,
                    fontSize: FontConstants.font_16,
                    color: AppColors.blackColor,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Row(
                      children: [
                        Expanded(
                          child: CommonWidgets.commonFilledButton(
                            context: context,
                            onclick: () {
                              Navigator.pop(context);
                              callback(0);
                            },
                            color: AppColors.whiteColor,
                            borderColor: AppColors.blackColor.withOpacity(0.3),
                            textColor: AppColors.blackColor.withOpacity(0.5),
                            fontSize: FontConstants.font_14,
                            fontWeight: FontWeightConstants.medium,
                            text: leftButtonText,
                          ),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Expanded(
                          child: CommonWidgets.commonFilledButton(
                            context: context,
                            onclick: () {
                              Navigator.pop(context);
                              callback(1);
                            },
                            color: AppColors.blackColor,
                            fontSize: FontConstants.font_14,
                            fontWeight: FontWeightConstants.medium,
                            text: rightButtonText,
                            textColor: AppColors.whiteColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  /// load network image

  /// load network image
  static Widget loadNetworkImage(
    String url, {
    Color? color = Colors.white,
    BoxShape shape = BoxShape.rectangle,
    double? borderRadius,
    double? width,
    double? height,
    BoxFit fit = BoxFit.fill,
    bool isProfile = false,
    String placeholderString = "",
    BlendMode? backgroundBlendMode,
  }) {
    bool isValidUrl = Uri.tryParse(url)?.isAbsolute == true;
    return Container(
      width: width ?? double.infinity,
      height: height ?? double.infinity,
      decoration: BoxDecoration(
        backgroundBlendMode: backgroundBlendMode,
        color: color,
        shape: shape,
        border: Border.all(color: AppColors.transparentColor, width: 0.1),
        borderRadius: shape == BoxShape.circle
            ? null
            : BorderRadius.circular(borderRadius ?? 0),
        boxShadow: isProfile
            ? [
                BoxShadow(
                  color: Colors.grey.shade200,
                  offset: const Offset(0.0, 0.0),
                  blurRadius: 8,
                ),
              ]
            : [],
      ),
      child: isValidUrl
          ? ClipRRect(
              borderRadius: BorderRadius.circular(borderRadius ?? 0),
              child: CachedNetworkImage(
                imageUrl: url,
                fit: fit,
                progressIndicatorBuilder: (context, url, downloadProgress) {
                  return Skeletonizer.bones(
                    child: Bone(
                      height: height,
                      width: width,
                      shape: shape,
                      borderRadius: shape == BoxShape.circle
                          ? null
                          : BorderRadius.circular(borderRadius ?? 0),
                    ),
                  );
                  /* return Shimmer.fromColors(
                    baseColor: Colors.black12,
                    highlightColor: Colors.white,
                    loop: 15,
                    child: Container(
                      height: height,
                      width: width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: AppColors.whiteColor,
                      ),
                    ),
                  );*/
                },
                errorWidget: (context, url, error) {
                  return Image.network(
                    url,
                    errorBuilder: (context, error, stackTrace) =>
                        _buildPlaceHolderImage(borderRadius),
                    fit: BoxFit.fill,
                  );
                },
              ),
            )
          : isProfile && placeholderString != ""
              ? _buildPlaceHolderProfile(borderRadius, placeholderString)
              : _buildPlaceHolderImage(borderRadius),
    );
  }

  /// placeholder image
  static Widget _buildPlaceHolderImage(double? borderRadius) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius ?? 0),
      child: Center(
        child: Image.asset(
          ImageConstants.logo,
          fit: BoxFit.contain,
          height: 100,
          width: 100,
          /*colorFilter: const ColorFilter.mode(
            AppColors.transparentColor,
            BlendMode.srcIn,
          ),*/
        ),
      ),
    );
  }

  static Widget _buildPlaceHolderProfile(
    double? borderRadius,
    String placeholderString,
  ) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius ?? 0),
      child: Center(
        child: CommonText(
          text: placeholderString.substring(0, 1),
          fontSize: FontConstants.font_26,
          fontWeight: FontWeightConstants.medium,
        ),
      ),
    );
  }

  static Widget noDataView({
    String title = "",
    double? logoHeight = 100,
    double? logoWidth = 100,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(
          "ImageConstants.notificationEmptyIcon",
          height: logoHeight,
          width: logoWidth,
        ),
        const SizedBox(
          height: 24,
        ),
        CommonWidgets.commonText(
          text: title,
          fontWeight: FontWeightConstants.bold,
          fontSize: 18,
          color: AppColors.blackColor,
        ),
      ],
    );
  }

  static Widget commonTextWithFunction(
      {Color? color = Colors.black,
      double? fontSize,
      double? height,
      String? text,
      FontWeight? fontWeight,
      TextAlign? textAlign,
      int? maxLine = 3,
      String fontFamily = FontFamilyConstants.fontName,
      TextDecoration textDecoration = TextDecoration.none,
      Function? onClick,
      Color decorationColor = Colors.transparent}) {
    return GestureDetector(
      onTap: () {
        onClick?.call();
      },
      child: Text(
        text ?? "",
        maxLines: maxLine,
        textAlign: textAlign,
        style: TextStyle(
          color: color,
          decoration: textDecoration,
          decorationColor: decorationColor,
          fontSize: fontSize,
          height: height,
          fontWeight: fontWeight,
          overflow: TextOverflow.ellipsis,
          fontFamily: fontFamily,
        ),
      ),
    );
  }

  /// common container
  static Widget commonContainer({
    double? width,
    double? height,
    AlignmentGeometry? alignment,
    double paddingHorizontal = 0,
    double paddingVertical = 0,
    BoxShape? shape,
    Color color = AppColors.whiteColor,
    Widget? child,
    double borderRadius = 15,
    Color borderColor = AppColors.transparentColor,
    double borderWidth = 1.0,
    DecorationImage? decorationImage,
    List<BoxShadow>? boxShadow,
    Gradient? gradient,
    BoxConstraints? constraints,
  }) {
    return Container(
      width: width,
      height: height,
      alignment: alignment,
      constraints: constraints,
      padding: EdgeInsets.symmetric(
        horizontal: paddingHorizontal,
        vertical: paddingVertical,
      ),
      decoration: BoxDecoration(
        shape: shape ?? BoxShape.rectangle,
        boxShadow: boxShadow,
        color: color,
        borderRadius:
            shape == null ? circularBorder(radius: borderRadius) : null,
        border: Border.all(
          color: borderColor,
          width: borderWidth,
        ),
        image: decorationImage,
        gradient: gradient,
      ),
      child: child,
    );
  }

  static showDrawerMenuImage() {
    return Container(
      width: 48.w,
      height: 48.h,
      padding: const EdgeInsets.all(8),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.fieldBorderColor,
        ),
        color: AppColors.whiteColor.withOpacity(0.8),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Icon(
        Icons.arrow_back_ios,
        size: 20.h,
      ),
    );
  }



  /// upload image dialog
  static Future pickImageDialog({
    String titleName = "",
    Function(int)? callback,
  }) async {
    showDialog(
      context: AppValueConstants.globalKey.currentContext!,
      builder: (BuildContext context) {
        return Dialog(
          surfaceTintColor: AppColors.whiteColor,
          insetPadding: const EdgeInsets.symmetric(
            horizontal: 18,
            vertical: 24,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: CommonWidgets.circularBorder(radius: 24),
          ),
          //this right here
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 16,
                ),
                CommonText(
                  text: titleName.isEmpty
                      ? context.translate.selectImage
                      : titleName,
                  fontWeight: FontWeightConstants.bold,
                  fontSize: FontConstants.font_18,
                ),
                const SizedBox(
                  height: 24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        context.pop();
                        callback!(0);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: AppColors.pickImageColor,
                        ),
                        height: 105,
                        width: 105,
                        child: const Padding(
                          padding: EdgeInsets.all(32.0),
                          child: Icon(
                            Icons.camera_alt,
                            size: 32,
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        context.pop();
                        callback!(1);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: AppColors.pickImageColor,
                        ),
                        height: 105,
                        width: 105,
                        child: const Padding(
                          padding: EdgeInsets.all(32.0),
                          child: Icon(
                            Icons.image,
                            size: 32,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  static Future pickImageBottomSheet({
    String titleName = "",
    Function(int)? callback,
  }) async {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: AppValueConstants.globalKey.currentContext!,
      builder: (context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width - 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white),
                child: Wrap(
                  alignment: WrapAlignment.center,
                  children: [
                    CommonText(
                      //"Select upload option"
                      text: titleName,
                      fontFamily: FontFamilyConstants.fontName,
                      color: AppColors.blackColor,
                      fontSize: FontConstants.font_20,
                      fontWeight: FontWeight.w500,
                    ).paddingOnly(top: 20, bottom: 40),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            context.pop();
                            callback!(0);
                          },
                          child: SvgPicture.asset(
                            IconConstants.camera,
                            height: 18,
                            width: 22,
                            color: AppColors.blackColor,
                          ).paddingOnly(right: 10),
                        ),
                        CommonText(
                          text: context.translate.photo,
                          fontFamily: FontFamilyConstants.fontName,
                          color: AppColors.blackColor.withOpacity(0.8),
                          fontSize: FontConstants.font_16,
                          fontWeight: FontWeight.w400,
                        ),
                      ],
                    ).paddingOnly(left: 15, bottom: 10),
                    Divider(
                      thickness: 0.5,
                      color: Colors.grey.withOpacity(0.8),
                    ).paddingOnly(right: 20, left: 20),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            context.pop();
                            callback!(1);
                          },
                          child: SvgPicture.asset(
                            IconConstants.gallery,
                            height: 18,
                            width: 22,
                            color: AppColors.blackColor,
                          ).paddingOnly(right: 10),
                        ),
                        CommonText(
                          text: context.translate.gallery,
                          fontFamily: FontFamilyConstants.fontName,
                          color: AppColors.blackColor.withOpacity(0.8),
                          fontSize: FontConstants.font_16,
                          fontWeight: FontWeight.w400,
                        ),
                      ],
                    ).paddingOnly(left: 20, bottom: 40),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: MediaQuery.of(context).size.width - 40,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    context.pop();
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                    ),
                  ),
                  child: CommonText(
                    text: context.translate.cancel,
                    fontFamily: FontFamilyConstants.fontName,
                    color: AppColors.redColor.withOpacity(0.8),
                    fontSize: FontConstants.font_18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }
}
