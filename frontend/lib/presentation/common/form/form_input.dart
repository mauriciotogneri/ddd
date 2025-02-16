import 'package:flutter/material.dart';
import 'package:testflow/presentation/common/form/error_input_wrapper.dart';
import 'package:testflow/presentation/common/form/label_input_wrapper.dart';
import 'package:testflow/presentation/common/input/custom_input.dart';

class FormInput<T> extends StatelessWidget {
  final Widget Function(bool) builder;
  final CustomInputController<T> controller;
  final String? name;
  final String? errorMessage;

  const FormInput({
    required this.builder,
    required this.controller,
    this.name,
    this.errorMessage,
  });

  @override
  Widget build(BuildContext context) {
    return LabelInputWrapper(
      name: name,
      child: FormField<T>(
        validator: (_) => controller.isEmpty ? errorMessage : null,
        builder:
            (fieldState) => ErrorInputWrapper(
              errorMessage: fieldState.errorText,
              child: builder(fieldState.hasError),
            ),
      ),
    );
  }
}
