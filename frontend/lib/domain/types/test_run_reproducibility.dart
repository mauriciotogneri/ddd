import 'package:flutter/material.dart';
import 'package:testflow/presentation/common/chip/custom_chip.dart';
import 'package:testflow/presentation/common/input/custom_dropdown_single.dart';
import 'package:testflow/utils/palette.dart';

enum TestRunReproducibility implements Chipable {
  always,
  sometimes,
  rarely;

  String get localized {
    switch (this) {
      case TestRunReproducibility.always:
        return 'Always';
      case TestRunReproducibility.sometimes:
        return 'Sometimes';
      case TestRunReproducibility.rarely:
        return 'Rarely';
    }
  }

  Color get foregroundColor {
    switch (this) {
      case TestRunReproducibility.always:
        return Palette.chipRedForeground;
      case TestRunReproducibility.sometimes:
        return Palette.chipYellowForeground;
      case TestRunReproducibility.rarely:
        return Palette.chipBlueForeground;
    }
  }

  Color get backgroundColor {
    switch (this) {
      case TestRunReproducibility.always:
        return Palette.chipRedBackground;
      case TestRunReproducibility.sometimes:
        return Palette.chipYellowBackground;
      case TestRunReproducibility.rarely:
        return Palette.chipBlueBackground;
    }
  }

  Color get borderColor {
    switch (this) {
      case TestRunReproducibility.always:
        return Palette.chipRedBorder;
      case TestRunReproducibility.sometimes:
        return Palette.chipYellowBorder;
      case TestRunReproducibility.rarely:
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

  static List<DropdownItem<TestRunReproducibility>> get items =>
      TestRunReproducibility.values
          .map((type) => DropdownItem(value: type, text: type.localized))
          .toList();

  @override
  String toString() => localized;
}
