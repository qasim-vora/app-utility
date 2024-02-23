import 'package:flutter/material.dart';

import '../../core/common/app_constants/image_constants.dart';

class LogoAnimatedLoading extends StatefulWidget {
  const LogoAnimatedLoading({
    super.key,
    this.size,
    this.color,
  });

  final double? size;
  final Color? color;

  @override
  State<LogoAnimatedLoading> createState() => _LogoAnimatedLoadingState();
}

class _LogoAnimatedLoadingState extends State<LogoAnimatedLoading>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final _tween = Tween<double>(begin: 0.9, end: 1);

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );
    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.size ?? 70,
      width: widget.size ?? 70,
      child: ScaleTransition(
        scale: _tween.animate(
          CurvedAnimation(parent: _controller, curve: Curves.easeInBack),
        ),
        child: Image.asset(
          ImageConstants.loading,
          // color: widget.color ?? Theme.of(context).primaryColorLight,
        ),
      ),
    );
  }
}
