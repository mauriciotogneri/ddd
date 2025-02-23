import 'package:flutter/material.dart';
import 'package:testflow/presentation/common/button/primary_text_button.dart';
import 'package:testflow/presentation/common/button/secondary_text_button.dart';
import 'package:testflow/presentation/dialogs/base_alert.dart';

class ConfirmationDialog extends StatelessWidget {
  final String message;
  final String onAcceptButton;
  final VoidCallback onAccept;
  final VoidCallback? onCancel;

  const ConfirmationDialog({
    required this.message,
    required this.onAcceptButton,
    required this.onAccept,
    this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return BaseAlert(
      message: message,
      actions: [
        SecondaryTextButton(
          text: 'Cancel',
          onPressed: Navigator.of(context).pop,
        ),
        PrimaryTextButton(
          text: onAcceptButton,
          onPressed: () {
            Navigator.of(context).pop();
            onAccept();
          },
        ),
      ],
    );
  }
}
