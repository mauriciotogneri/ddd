import 'package:flutter/material.dart';
import 'package:testflow/presentation/common/chip/custom_chip.dart';
import 'package:testflow/presentation/common/input/custom_dropdown_single.dart';
import 'package:testflow/utils/palette.dart';

enum RequirementStatus implements Chipable {
  draft,
  active,
  inactive;

  String get localized {
    switch (this) {
      case RequirementStatus.draft:
        return 'Draft';
      case RequirementStatus.active:
        return 'Active';
      case RequirementStatus.inactive:
        return 'Inactive';
    }
  }

  Color get foregroundColor {
    switch (this) {
      case RequirementStatus.draft:
        return Palette.chipGreyForeground;
      case RequirementStatus.active:
        return Palette.chipGreenForeground;
      case RequirementStatus.inactive:
        return Palette.chipRedForeground;
    }
  }

  Color get backgroundColor {
    switch (this) {
      case RequirementStatus.draft:
        return Palette.chipGreyBackground;
      case RequirementStatus.active:
        return Palette.chipGreenBackground;
      case RequirementStatus.inactive:
        return Palette.chipRedBackground;
    }
  }

  @override
  CustomChip get chip => CustomChip(
    text: localized,
    backgroundColor: backgroundColor,
    foregroundColor: foregroundColor,
  );

  static List<DropdownItem<RequirementStatus>> get items =>
      RequirementStatus.values
          .map((type) => DropdownItem(value: type, text: type.localized))
          .toList();

  @override
  String toString() => localized;
}
