import 'package:flutter/material.dart';
import 'package:testflow/presentation/common/chip/custom_chip.dart';
import 'package:testflow/presentation/common/input/custom_dropdown_single.dart';
import 'package:testflow/utils/palette.dart';

enum RequirementType implements Chipable {
  functional,
  non_functional;

  String get localized {
    switch (this) {
      case RequirementType.functional:
        return 'Functional';
      case RequirementType.non_functional:
        return 'Non Functional';
    }
  }

  Color get foregroundColor {
    switch (this) {
      case RequirementType.functional:
        return Palette.chipGreenForeground;
      case RequirementType.non_functional:
        return Palette.chipBlueForeground;
    }
  }

  Color get backgroundColor {
    switch (this) {
      case RequirementType.functional:
        return Palette.chipGreenBackground;
      case RequirementType.non_functional:
        return Palette.chipBlueBackground;
    }
  }

  Color get borderColor {
    switch (this) {
      case RequirementType.functional:
        return Palette.chipGreenBorder;
      case RequirementType.non_functional:
        return Palette.chipBlueBorder;
    }
  }

  @override
  CustomChip get chip => CustomChip(
    text: localized,
    backgroundColor: backgroundColor,
    foregroundColor: foregroundColor,
    borderColor: borderColor,
  );

  static List<DropdownItem<RequirementType>> get items =>
      RequirementType.values
          .map((type) => DropdownItem(value: type, text: type.localized))
          .toList();

  @override
  String toString() => localized;
}
