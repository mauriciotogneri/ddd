import 'package:flutter/material.dart';

class CustomChip extends StatelessWidget {
  final String text;
  final double size;
  final Color foregroundColor;
  final Color backgroundColor;

  const CustomChip({
    required this.text,
    required this.size,
    required this.foregroundColor,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          top: size / 4,
          bottom: size / 4,
          left: size,
          right: size,
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: size,
            color: foregroundColor,
          ),
        ),
      ),
    );
  }
}
