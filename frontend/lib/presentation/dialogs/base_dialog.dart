import 'package:flutter/material.dart';
import 'package:testflow/presentation/common/text/title_medium.dart';
import 'package:testflow/utils/palette.dart';

class BaseDialog extends StatelessWidget {
  final String title;
  final double width;
  final Widget content;
  final List<Widget> actions;

  const BaseDialog({
    required this.title,
    required this.width,
    required this.content,
    required this.actions,
  });

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
        padding: const EdgeInsets.only(left: 2),
        child: TitleMedium(text: title),
      ),
      content: SizedBox(width: width, child: content),
      actions: actions,
    );
  }
}
