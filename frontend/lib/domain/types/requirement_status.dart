import 'package:flutter/material.dart';
import 'package:testflow/presentation/common/chip/custom_chip.dart';
import 'package:testflow/utils/palette.dart';

enum RequirementStatus {
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

  CustomChip get chip => CustomChip(
    text: localized,
    backgroundColor: backgroundColor,
    foregroundColor: foregroundColor,
  );

  @override
  String toString() => localized;
}
