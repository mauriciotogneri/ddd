import 'package:flutter/material.dart';
import 'package:testflow/presentation/common/chip/custom_chip.dart';
import 'package:testflow/presentation/common/input/custom_dropdown_single.dart';
import 'package:testflow/utils/palette.dart';

enum RequirementImportance implements Chipable {
  low,
  medium,
  high,
  critical;

  String get localized {
    switch (this) {
      case RequirementImportance.low:
        return 'Low';
      case RequirementImportance.medium:
        return 'Medium';
      case RequirementImportance.high:
        return 'High';
      case RequirementImportance.critical:
        return 'Critical';
    }
  }

  Color get foregroundColor {
    switch (this) {
      case RequirementImportance.low:
        return Palette.chipBlueForeground;
      case RequirementImportance.medium:
        return Palette.chipGreenForeground;
      case RequirementImportance.high:
        return Palette.chipYellowForeground;
      case RequirementImportance.critical:
        return Palette.chipRedForeground;
    }
  }

  Color get backgroundColor {
    switch (this) {
      case RequirementImportance.low:
        return Palette.chipBlueBackground;
      case RequirementImportance.medium:
        return Palette.chipGreenBackground;
      case RequirementImportance.high:
        return Palette.chipYellowBackground;
      case RequirementImportance.critical:
        return Palette.chipRedBackground;
    }
  }

  Color get borderColor {
    switch (this) {
      case RequirementImportance.low:
        return Palette.chipBlueBorder;
      case RequirementImportance.medium:
        return Palette.chipGreenBorder;
      case RequirementImportance.high:
        return Palette.chipYellowBorder;
      case RequirementImportance.critical:
        return Palette.chipRedBorder;
    }
  }

  @override
  CustomChip get chip => CustomChip(
    text: localized,
    backgroundColor: backgroundColor,
    foregroundColor: foregroundColor,
    borderColor: borderColor,
  );

  static List<DropdownItem<RequirementImportance>> get items =>
      RequirementImportance.values
          .map((type) => DropdownItem(value: type, text: type.localized))
          .toList();

  @override
  String toString() => localized;
}
