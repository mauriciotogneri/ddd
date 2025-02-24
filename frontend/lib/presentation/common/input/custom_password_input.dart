import 'package:testflow/presentation/common/input/custom_text_input.dart';

class CustomPasswordInput extends CustomTextInput {
  const CustomPasswordInput({
    required super.controller,
    super.keyboardType,
    super.capitalization,
    super.textInputAction,
    super.enabled,
    super.autofocus,
    super.readOnly,
    super.filled,
    super.name,
    super.hint,
    super.autofillHints,
    super.prefixIcon,
    super.maxLength,
    super.width,
    super.errorMessage,
    super.onChanged,
    super.onSubmitted,
    super.validator,
  }) : super(obscureText: true, canClear: false, minLines: 1, maxLines: 1);
}
