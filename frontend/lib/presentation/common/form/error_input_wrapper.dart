import 'package:flutter/widgets.dart';
import 'package:testflow/presentation/common/text/body_small.dart';
import 'package:testflow/utils/palette.dart';

class ErrorInputWrapper extends StatelessWidget {
  final Widget child;
  final String? errorMessage;

  const ErrorInputWrapper({required this.child, this.errorMessage});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        child,
        if (errorMessage != null)
          Padding(
            padding: const EdgeInsets.only(top: 4, left: 2),
            child: BodySmall(text: errorMessage!, color: Palette.textError),
          ),
      ],
    );
  }
}
