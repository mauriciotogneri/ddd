import 'package:testflow/presentation/common/inputs/text_input_field.dart';

class PasswordInputField extends TextInputField {
  const PasswordInputField({
    required super.hint,
    required super.controller,
    super.keyboardType,
    super.textInputAction,
    super.capitalization,
    super.enabled,
    super.autofocus,
    super.readOnly,
    super.filled,
    super.autofillHints,
    super.prefixIcon,
    super.suffixIcon,
    super.maxLength,
    super.focusNode,
    super.onChanged,
  }) : super(
          obscureText: true,
          maxLines: 1,
        );
}
