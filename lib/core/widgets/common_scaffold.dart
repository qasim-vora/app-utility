import 'package:core_app/utils/extensions.dart';
import 'package:core_app/utils/navigation_extention.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/common/app_constants/image_constants.dart';
import '../../../core/styles/app_colors.dart';
import '../../core/styles/font_constants.dart';
import '../../features/theme/theme_bloc.dart';
import 'common_text.dart';

class CommonScaffold extends StatelessWidget {
  final bool showAppBar;
  final bool showBackIcon;
  final Color? scaffoldColor;
  final Color? appBarColor;
  final Widget? body;
  final String? label;
  final Widget? bottomNavigationBar;
  final Widget? floatingActButton;
  final EdgeInsetsGeometry bodyPadding;
  final bool showDrawer;
  final bool? show;
  final AdvancedDrawerController? controller;
  final Widget? titleWidget;
  final bool showLabel;
  final double? titleSpacing;

  const CommonScaffold({
    super.key,
    this.showAppBar = false,
    this.showBackIcon = true,
    this.label = "",
    this.titleWidget,
    this.showLabel = true,
    this.scaffoldColor,
    this.body,
    this.titleSpacing,
    this.appBarColor,
    this.bottomNavigationBar,
    this.floatingActButton,
    this.showDrawer = false,
    this.controller,
    this.bodyPadding = const EdgeInsets.all(0),
    this.show,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: show,
      appBar: showAppBar
          ? AppBar(
              centerTitle: true,
              scrolledUnderElevation: 0,
              leadingWidth: showBackIcon ? 72 : 0,
              backgroundColor: appBarColor,
              titleSpacing: titleSpacing,
              title: showLabel
                  ? CommonText(
                      text: label!,
                      fontFamily: FontFamilyConstants.fontFamilyMedel,
                      fontSize: FontConstants.font_28,
                      fontWeight: FontWeight.w400,
                      textAlign: TextAlign.center,
                    )
                  : titleWidget,
              leading: showBackIcon
                  ? GestureDetector(
                      onTap: () {
                        context.pop();
                      },
                      child: Container(
                        margin: const EdgeInsets.all(8),
                        padding: const EdgeInsets.all(8),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColors.fieldBorderColor,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: BlocBuilder<ThemeBloc, ThemeState>(
                          builder: (context, state) {
                            return SvgPicture.asset(
                              ImageConstants.backIcon,
                              height: 16.h,
                              width: 8.w,
                              color: AppColors.blackColor,
                            );
                          },
                        ),
                      ),
                    ).paddingOnly(right: 16.w)
                  : const SizedBox(),
            )
          : null,
      body: SafeArea(
        child: Padding(
          padding: bodyPadding,
          child: body,
        ),
      ),
      bottomNavigationBar: bottomNavigationBar != null
          ? SafeArea(child: bottomNavigationBar!)
          : null,
      floatingActionButton: floatingActButton != null
          ? SafeArea(child: floatingActButton!)
          : null,
    );
  }
}
