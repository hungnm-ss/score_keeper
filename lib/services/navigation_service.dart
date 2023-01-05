import 'package:flutter/material.dart';

class NavigationService {
  static final NavigationService instance = NavigationService._internal();

  NavigationService._internal();

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<dynamic>? navigateTo(String routeName, {Object? args}) {
    return navigatorKey.currentState?.pushNamed(routeName, arguments: args);
  }

  Future<dynamic>? pushSingleTopNamed(String routeName, {dynamic args}) {
    if (_isCurrentScreen(routeName)) {
      navigatorKey.currentState?.pop();
    }
    return navigatorKey.currentState?.pushNamed(routeName, arguments: args);
  }

  bool _isCurrentScreen(String routeName) {
    bool isCurrent = false;
    navigatorKey.currentState?.popUntil((route) {
      if (route.settings.name == routeName) {
        isCurrent = true;
      }
      return true;
    });
    return isCurrent;
  }

  void popToFirst() {
    navigatorKey.currentState?.popUntil((route) => route.isFirst);
  }

  Future<dynamic>? popAllAndNavigateTo(String routeName, {dynamic args}) {
    popToFirst();
    return navigatorKey.currentState?.pushNamed(routeName, arguments: args);
  }
}
