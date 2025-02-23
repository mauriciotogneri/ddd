import 'package:flutter/material.dart';
import 'package:testflow/presentation/common/chip/custom_chip.dart';
import 'package:testflow/presentation/common/input/custom_dropdown_single.dart';
import 'package:testflow/utils/palette.dart';

enum TestCaseExecution implements Chipable {
  manual,
  automated;

  String get localized {
    switch (this) {
      case TestCaseExecution.manual:
        return 'Manual';
      case TestCaseExecution.automated:
        return 'Automated';
    }
  }

  Color get foregroundColor {
    switch (this) {
      case TestCaseExecution.manual:
        return Palette.chipRedForeground;
      case TestCaseExecution.automated:
        return Palette.chipGreenForeground;
    }
  }

  Color get backgroundColor {
    switch (this) {
      case TestCaseExecution.manual:
        return Palette.chipRedBackground;
      case TestCaseExecution.automated:
        return Palette.chipGreenBackground;
    }
  }

  Color get borderColor {
    switch (this) {
      case TestCaseExecution.manual:
        return Palette.chipRedBorder;
      case TestCaseExecution.automated:
        return Palette.chipGreenBorder;
    }
  }

  @override
  CustomChip get chip => CustomChip(
    text: localized,
    backgroundColor: backgroundColor,
    foregroundColor: foregroundColor,
    borderColor: borderColor,
  );

  static List<DropdownItem<TestCaseExecution>> get items =>
      TestCaseExecution.values
          .map((type) => DropdownItem(value: type, text: type.localized))
          .toList();

  @override
  String toString() => localized;
}
