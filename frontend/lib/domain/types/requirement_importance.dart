import 'package:flutter/material.dart';
import 'package:testflow/presentation/common/chip/custom_chip.dart';
import 'package:testflow/utils/palette.dart';

enum RequirementImportance {
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
        return const Color(0xff4E4D7D);
      case RequirementImportance.medium:
        return const Color(0xff38683A);
      case RequirementImportance.high:
        return const Color(0xFFBB7F16);
      case RequirementImportance.critical:
        return Palette.chipRedForeground;
    }
  }

  Color get backgroundColor {
    switch (this) {
      case RequirementImportance.low:
        return const Color(0xffEFF0F9);
      case RequirementImportance.medium:
        return const Color(0xffEDF8EC);
      case RequirementImportance.high:
        return const Color(0xffFFF1DF);
      case RequirementImportance.critical:
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
