import 'package:dafluta/dafluta.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:testflow/presentation/common/text/custom_text.dart';
import 'package:testflow/utils/palette.dart';

class NavigationPath extends StatelessWidget {
  final List<PathItem> paths;

  const NavigationPath({required this.paths});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Palette.backgroundNavigationPath,
      borderRadius: BorderRadius.circular(8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          for (int i = 0; i < paths.length; i++)
            PathSection(
              text: paths[i].text,
              isLast: i == paths.length - 1,
              path: paths[i].path,
            ),
        ],
      ),
    );
  }
}

class PathSection extends StatelessWidget {
  final String text;
  final bool isLast;
  final String path;

  const PathSection({
    required this.text,
    required this.isLast,
    required this.path,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const HBox(4),
        Padding(
          padding: const EdgeInsets.only(top: 4, bottom: 4),
          child: InkWell(
            borderRadius: BorderRadius.circular(8),
            onTap: isLast ? null : () => context.go(path),
            child: Padding(
              padding: const EdgeInsets.only(
                top: 4,
                bottom: 4,
                left: 8,
                right: 8,
              ),
              child: CustomText(
                text: text,
                color: Palette.textTitle,
                size: 14,
                weight: isLast ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ),
        ),
        const HBox(4),
        if (!isLast)
          const Icon(
            Icons.arrow_forward_ios,
            size: 12,
            color: Palette.textTitle,
          ),
      ],
    );
  }
}

class PathItem {
  final String text;
  final String path;

  const PathItem({required this.text, this.path = ''});
}
