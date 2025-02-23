import 'package:flutter/material.dart';
import 'package:testflow/presentation/common/chip/custom_chip.dart';
import 'package:testflow/presentation/common/input/custom_dropdown_single.dart';
import 'package:testflow/utils/palette.dart';

enum TestRunStatus implements Chipable {
  pending,
  passed,
  skipped,
  blocked,
  failed;

  String get localized {
    switch (this) {
      case TestRunStatus.pending:
        return 'Pending';
      case TestRunStatus.passed:
        return 'Passed';
      case TestRunStatus.skipped:
        return 'Skipped';
      case TestRunStatus.blocked:
        return 'Blocked';
      case TestRunStatus.failed:
        return 'Failed';
    }
  }

  Color get foregroundColor {
    switch (this) {
      case TestRunStatus.pending:
        return Palette.chipWhiteForeground;
      case TestRunStatus.passed:
        return Palette.chipGreenForeground;
      case TestRunStatus.skipped:
        return Palette.chipBlueForeground;
      case TestRunStatus.blocked:
        return Palette.chipYellowForeground;
      case TestRunStatus.failed:
        return Palette.chipRedForeground;
    }
  }

  Color get backgroundColor {
    switch (this) {
      case TestRunStatus.pending:
        return Palette.chipWhiteBackground;
      case TestRunStatus.passed:
        return Palette.chipGreenBackground;
      case TestRunStatus.skipped:
        return Palette.chipBlueBackground;
      case TestRunStatus.blocked:
        return Palette.chipYellowBackground;
      case TestRunStatus.failed:
        return Palette.chipRedBackground;
    }
  }

  Color get borderColor {
    switch (this) {
      case TestRunStatus.pending:
        return Palette.chipWhiteBorder;
      case TestRunStatus.passed:
        return Palette.chipGreenBorder;
      case TestRunStatus.skipped:
        return Palette.chipBlueBorder;
      case TestRunStatus.blocked:
        return Palette.chipYellowBorder;
      case TestRunStatus.failed:
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

  static List<DropdownItem<TestRunStatus>> get items =>
      TestRunStatus.values
          .map((type) => DropdownItem(value: type, text: type.localized))
          .toList();

  @override
  String toString() => localized;
}
