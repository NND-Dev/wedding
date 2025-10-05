import 'package:flutter/material.dart';

/// Navigation service for handling app navigation
class NavigationService {
  final GlobalKey<NavigatorState> _navigationKey = GlobalKey<NavigatorState>();

  GlobalKey<NavigatorState> get navigationKey => _navigationKey;

  NavigatorState? get navigator => _navigationKey.currentState;

  /// Navigate to a new route
  Future<dynamic> navigateTo(String routeName, {Object? arguments}) {
    return navigator!.pushNamed(routeName, arguments: arguments);
  }

  /// Navigate and replace the current route
  Future<dynamic> navigateToAndReplace(String routeName, {Object? arguments}) {
    return navigator!.pushReplacementNamed(routeName, arguments: arguments);
  }

  /// Navigate and clear all previous routes
  Future<dynamic> navigateToAndClearStack(
    String routeName, {
    Object? arguments,
  }) {
    return navigator!.pushNamedAndRemoveUntil(
      routeName,
      (route) => false,
      arguments: arguments,
    );
  }

  /// Go back to previous route
  void goBack([dynamic result]) {
    return navigator!.pop(result);
  }

  /// Check if can go back
  bool canGoBack() {
    return navigator!.canPop();
  }
}
