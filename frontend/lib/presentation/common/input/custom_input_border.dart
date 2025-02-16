import 'package:flutter/material.dart';
import 'package:testflow/utils/palette.dart';

class CustomInputBorder {
  static InputBorder get enabledBorder => const OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(4)),
    borderSide: BorderSide(color: Palette.borderInputEnabled, width: 1),
  );

  static InputBorder get focusedBorder => const OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(4)),
    borderSide: BorderSide(color: Palette.borderInputFocused, width: 1),
  );

  static InputBorder get errorBorder => const OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(4)),
    borderSide: BorderSide(color: Palette.borderInputError, width: 1),
  );
}
