import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final IconData? icon;
  final Color? color;
  final double? width;
  final bool enabled;

  const PrimaryButton({
    required this.text,
    this.onPressed,
    this.icon,
    this.color,
    this.width,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: width,
      child: FilledButton.icon(
        onPressed: enabled ? onPressed : null,
        style: ButtonStyle(
          elevation: WidgetStateProperty.all(0),
          backgroundColor:
              (color != null) ? WidgetStateProperty.all(color) : null,
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          ),
        ),
        icon: (icon != null) ? Icon(icon!) : null,
        label: Text(text),
      ),
    );
  }
}
