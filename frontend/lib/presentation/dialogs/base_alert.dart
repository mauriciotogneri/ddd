import 'package:flutter/material.dart';
import 'package:testflow/presentation/common/text/body_large.dart';
import 'package:testflow/utils/palette.dart';

class BaseAlert extends StatelessWidget {
  final String message;
  final List<Widget> actions;

  const BaseAlert({required this.message, required this.actions});

  static void show({required BuildContext context, required Widget dialog}) =>
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => dialog,
      );

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      backgroundColor: Palette.backgroundPane,
      title: Padding(
        padding: const EdgeInsets.only(bottom: 32),
        child: BodyLarge(text: message),
      ),
      actions: actions,
    );
  }
}
