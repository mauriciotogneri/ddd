import 'package:flutter/material.dart';
import 'package:testflow/presentation/common/text/label_large.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;

  const PrimaryButton({
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 40,
      child: FilledButton(
        onPressed: onPressed,
        child: LabelLarge(text: text),
      ),
    );
  }
}
