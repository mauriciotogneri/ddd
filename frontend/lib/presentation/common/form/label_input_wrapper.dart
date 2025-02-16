import 'package:flutter/widgets.dart';
import 'package:testflow/presentation/common/text/custom_text.dart';
import 'package:testflow/utils/palette.dart';

class LabelInputWrapper extends StatelessWidget {
  final Widget child;
  final String? name;

  const LabelInputWrapper({required this.child, this.name});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (name != null)
          Padding(
            padding: const EdgeInsets.only(left: 2, bottom: 8),
            child: CustomText(
              text: name!,
              color: Palette.textTitle,
              weight: FontWeight.w500,
            ),
          ),
        child,
      ],
    );
  }
}
