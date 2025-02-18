import 'package:flutter/material.dart';
import 'package:testflow/presentation/common/text/title_medium.dart';

class NavigationPath extends StatelessWidget {
  final String title;

  const NavigationPath(this.title);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, left: 16, right: 16),
      child: TitleMedium(text: title),
    );
  }
}
