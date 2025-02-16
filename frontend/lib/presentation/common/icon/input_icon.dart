import 'package:flutter/material.dart';
import 'package:testflow/utils/palette.dart';

class InputIcon extends StatelessWidget {
  final IconData icon;
  final Color? color;
  final bool enabled;
  final double size;

  const InputIcon({
    required this.icon,
    this.color,
    this.size = 16,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return Icon(icon, size: size, color: iconColor);
  }

  Color get iconColor {
    if (enabled) {
      return color ?? Palette.iconEnabled;
    } else {
      return Palette.iconDisabled;
    }
  }

  static InputIcon? create(
    IconData? icon, {
    Color? color,
    bool enabled = true,
  }) {
    if (icon == null) {
      return null;
    } else {
      return InputIcon(icon: icon, color: color);
    }
  }
}
