import 'package:flutter/material.dart';

enum RequirementType {
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
        return const Color(0xff4E4D7D);
      case RequirementType.non_functional:
        return const Color(0xff38683A);
    }
  }

  Color get backgroundColor {
    switch (this) {
      case RequirementType.functional:
        return const Color(0xffEFF0F9);
      case RequirementType.non_functional:
        return const Color(0xffEDF8EC);
    }
  }

  @override
  String toString() => localized;
}
