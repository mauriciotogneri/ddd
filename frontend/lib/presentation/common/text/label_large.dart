import 'package:flutter/material.dart';

class LabelLarge extends StatelessWidget {
  final String text;

  const LabelLarge({
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.labelLarge,
    );
  }
}
