import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final IconData? icon;
  final bool enabled;
  final bool expanded;

  const PrimaryButton({
    required this.text,
    this.onPressed,
    this.icon,
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
        icon: (icon != null) ? Icon(icon) : null,
        child: Text(text),
      ),
    );
  }
}
