import 'package:core_app/utils/navigation_extention.dart';
import 'package:flutter/material.dart';

import '../../core/common/app_constants/image_constants.dart';
import '../../core/common/common_widgets.dart';
import '../../core/styles/app_colors.dart';

class CommonMapScaffold extends StatelessWidget {
  final bool showAppBar;
  final bool showBackIcon;
  final bool centerTitle;
  final Widget? body;
  final Widget? title;
  final Widget? leadingWidget;
  final VoidCallback? onTap;
  final Widget? bottomNavigationBar;
  final EdgeInsetsGeometry bodyPadding;
  final Widget? floatingActionButton;

  const CommonMapScaffold({
    super.key,
    this.showAppBar = true,
    this.showBackIcon = true,
    this.centerTitle = false,
    this.onTap,
    this.body,
    this.title,
    this.leadingWidget,
    this.bottomNavigationBar,
    this.bodyPadding = EdgeInsets.zero,
    this.floatingActionButton,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: showAppBar
          ? AppBar(
              backgroundColor: AppColors.transparentColor,
              //leadingWidth: showBackIcon ? 72 : 0,
              leading: showBackIcon
                  ? leadingWidget ??
                      GestureDetector(
                        onTap: onTap ??
                            () {
                              context.pop();
                            },
                        child: CommonWidgets.showContainerImage(
                          icon: ImageConstants.backIcon,
                        ),
                      )
                  : const SizedBox(),
              title: title ?? const SizedBox(),
              centerTitle: centerTitle,
            )
          : null,
      body: Padding(
        padding: bodyPadding,
        child: body,
      ),
      floatingActionButton: floatingActionButton,
      bottomNavigationBar: bottomNavigationBar != null
          ? SafeArea(child: bottomNavigationBar!)
          : null,
    );
  }
}
