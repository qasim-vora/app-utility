import 'package:flutter/material.dart';

import '../core/styles/domino_reveal.dart';

extension PaddingExtension on Widget? {
  Widget paddingSymmetric({
    double horizontal = 0.0,
    double vertical = 0.0,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: horizontal,
        vertical: vertical,
      ),
      child: this,
    );
  }

  Widget paddingAll([double? padding]) {
    return Padding(
      padding: EdgeInsets.all(padding ?? 8),
      child: this,
    );
  }

  Widget paddingOnly({
    double top = 0.0,
    double bottom = 0.0,
    double right = 0.0,
    double left = 0.0,
  }) {
    return Padding(
      padding: EdgeInsets.only(
        top: top,
        bottom: bottom,
        right: right,
        left: left,
      ),
      child: this,
    );
  }
}

extension DominoAnimation on Widget {
  Widget addDominoEffect({bool isLeftToRight = false, bool isEnabled = true}) {
    return DominoReveal(
      isLeftToRight: isLeftToRight,
      allowAnimation: isEnabled,
      child: this,
    );
  }
}
