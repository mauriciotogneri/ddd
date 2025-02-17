import 'package:flutter/material.dart';
import 'package:testflow/presentation/common/input/custom_input.dart';
import 'package:testflow/utils/palette.dart';

class SecondaryIconButton extends StatelessWidget {
  final IconData icon;
  final double size;
  final VoidCallback? onPressed;
  final Color? color;
  final bool enabled;

  const SecondaryIconButton({
    required this.icon,
    required this.size,
    this.onPressed,
    this.color,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      width: size,
      child: OutlinedButton(
        onPressed: enabled ? onPressed : null,
        style: ButtonStyle(
          foregroundColor:
              (color != null)
                  ? WidgetStateProperty.all(color)
                  : WidgetStateProperty.all(Palette.textSecondary),
          side:
              (color != null)
                  ? WidgetStateProperty.all(BorderSide(color: color!))
                  : WidgetStateProperty.all(
                    const BorderSide(color: Palette.borderButtonSecondary),
                  ),
          padding: WidgetStateProperty.all(const EdgeInsets.all(0)),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(borderRadius: CustomInput.borderRadius),
          ),
        ),
        child: Center(child: Icon(icon, color: color, size: size / 2.5)),
      ),
    );
  }
}
