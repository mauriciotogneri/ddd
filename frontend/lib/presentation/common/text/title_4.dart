import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class Title4 extends StatelessWidget {
  final String text;

  const Title4({
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final ShadThemeData theme = ShadTheme.of(context);

    return Padding(
      padding: const EdgeInsets.only(left: 4),
      child: Text(
        text,
        style: theme.textTheme.h4,
      ),
    );
  }
}
