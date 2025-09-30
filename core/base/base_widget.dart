import 'package:flutter/material.dart';

abstract class BaseWidget extends StatelessWidget {
  const BaseWidget({super.key});

  ThemeData getTheme(BuildContext context) => Theme.of(context);
  ColorScheme getColorScheme(BuildContext context) => Theme.of(context).colorScheme;
  TextTheme getTextTheme(BuildContext context) => Theme.of(context).textTheme;

  void showSnackBar(BuildContext context, String message, {bool isError = false}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isError ? Colors.red : Colors.green,
        duration: const Duration(seconds: 3),
      ),
    );
  }
}