import 'package:flutter/material.dart';

class SecondaryButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final IconData? icon;
  final Color? color;
  final double? width;
  final bool enabled;

  const SecondaryButton({
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
      child: OutlinedButton.icon(
        onPressed: enabled ? onPressed : null,
        style: ButtonStyle(
          foregroundColor:
              (color != null) ? WidgetStateProperty.all(color) : null,
          side:
              (color != null)
                  ? WidgetStateProperty.all(BorderSide(color: color!))
                  : null,
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          ),
        ),
        icon: (icon != null) ? Icon(icon!, color: color) : null,
        label: Text(text),
      ),
    );
  }
}
