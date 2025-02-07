import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool enabled;
  final bool expanded;

  const PrimaryButton({
    required this.text,
    this.onPressed,
    this.enabled = true,
    this.expanded = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: expanded ? double.infinity : null,
      child: ShadButton(
        onPressed: onPressed,
        enabled: enabled,
        child: Text(text),
      ),
    );
  }
}
