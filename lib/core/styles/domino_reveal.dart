import 'dart:async';

import 'package:flutter/material.dart';

import 'delayed_reveal.dart';

// This function increments and returns a Duration
// The delay is reset when no new animations have been added for a short moment
//  (you can change the conditions of this to match your requirements)
Timer? _dominoReset;
Duration _dominoDelay = const Duration();

_getDelay() {
  if (_dominoReset == null || !_dominoReset!.isActive) {
    _dominoReset = Timer(const Duration(milliseconds: 100), () {
      _dominoDelay = const Duration();
    });
  }
  _dominoDelay += const Duration(milliseconds: 100);
  return _dominoDelay;
}

class DominoReveal extends StatelessWidget {
  final Widget child;
  final bool isLeftToRight;
  final bool allowAnimation;

  const DominoReveal({
    super.key,
    required this.child,
    this.allowAnimation = true,
    this.isLeftToRight = false,
  });

  @override
  Widget build(BuildContext context) {
    return DelayedReveal(
      delay: _getDelay(),
      isLeftToRight: isLeftToRight,
      child: child,
    );
  }
}
