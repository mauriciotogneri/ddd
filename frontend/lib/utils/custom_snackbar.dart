import 'package:flutter/material.dart';

class CustomSnackbar {
  static const Duration DURATION_SHORT = Duration(seconds: 2);
  static const Duration DURATION_MEDIUM = Duration(seconds: 3);
  static const Duration DURATION_LONG = Duration(seconds: 5);

  static void show({
    required BuildContext context,
    required String message,
    Duration duration = DURATION_SHORT,
  }) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message), duration: duration));
  }
}
