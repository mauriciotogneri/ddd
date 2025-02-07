import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;

  const PrimaryButton({
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    /*return SizedBox(
      width: double.infinity,
      height: 40,
      child: FilledButton(
        onPressed: onPressed,
        child: LabelLarge(text: text),
      ),
    );*/
    return SizedBox(
      width: double.infinity,
      child: ShadButton(
        onPressed: onPressed,
        child: Text(text),
      ),
    );
  }
}
