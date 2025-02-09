import 'package:flutter/material.dart';
import 'package:testflow/utils/palette.dart';

class BaseView extends StatelessWidget {
  final Widget child;

  const BaseView({
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Palette.background1,
      child: child,
    );
  }
}
