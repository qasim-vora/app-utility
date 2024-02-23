import 'package:flutter/material.dart';

extension CustomNavigation on BuildContext {
  Future push(Route route) => Navigator.of(this).push(route);

  Future pushNamed(String routeName, {Object? arguments}) =>
      Navigator.of(this).pushNamed(routeName, arguments: arguments);

  Future pushReplacementNamed(String routeName, {Object? arguments}) =>
      Navigator.of(this).pushReplacementNamed(
        routeName,
        arguments: arguments,
      );

  Future popAndPushNamed(String routeName, {Object? arguments}) =>
      Navigator.of(this).popAndPushNamed(
        routeName,
        arguments: arguments,
      );

  void pop([dynamic result]) => Navigator.of(this).pop(result);

  void popUntil(String routeName) =>
      Navigator.of(this).popUntil((route) => route.settings.name == routeName);

  Future popAllAndPush(String newRouteName) => Navigator.of(this)
      .pushNamedAndRemoveUntil(newRouteName, (route) => false);
}
