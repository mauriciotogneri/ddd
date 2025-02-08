import 'package:flutter/material.dart';

enum Importance {
  low,
  medium,
  high,
  critical;

  String get localized {
    switch (this) {
      case Importance.low:
        return 'Low';
      case Importance.medium:
        return 'Medium';
      case Importance.high:
        return 'High';
      case Importance.critical:
        return 'Critical';
    }
  }

  Color get foregroundColor {
    switch (this) {
      case Importance.low:
        return const Color(0xff4E4D7D);
      case Importance.medium:
        return const Color(0xff38683A);
      case Importance.high:
        return const Color(0xffA87A38);
      case Importance.critical:
        return const Color(0xff9C4238);
    }
  }

  Color get backgroundColor {
    switch (this) {
      case Importance.low:
        return const Color(0xffEFF0F9);
      case Importance.medium:
        return const Color(0xffEDF8EC);
      case Importance.high:
        return const Color(0xffFFF1DF);
      case Importance.critical:
        return const Color(0xffFDE9E6);
    }
  }

  @override
  String toString() => localized;
}
