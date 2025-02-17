import 'package:dafluta/dafluta.dart';
import 'package:flutter/material.dart';
import 'package:testflow/presentation/common/layout/scrollable_column.dart';
import 'package:testflow/utils/navigation.dart';
import 'package:testflow/utils/palette.dart';

class Pane extends StatelessWidget {
  final Widget child;
  final Color backgroundColor;

  const Pane({
    required this.child,
    this.backgroundColor = Palette.backgroundPane,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: SizedBox.expand(child: child),
    );
  }

  factory Pane.normal({required Widget header, required Widget content}) =>
      Pane(child: ScrollableColumn(children: [header, content]));

  factory Pane.withBack({required Widget header, required Widget content}) =>
      Pane(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderWithBack(header),
            Padding(
              padding: const EdgeInsets.only(left: 6, right: 6),
              child: content,
            ),
          ],
        ),
      );
}

class HeaderWithBack extends StatelessWidget {
  final Widget child;

  const HeaderWithBack(this.child);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const IconButton(
          onPressed: Navigation.unstack,
          icon: Icon(Icons.keyboard_arrow_left_rounded),
        ),
        const HBox(4),
        child,
      ],
    );
  }
}
