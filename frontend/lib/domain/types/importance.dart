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

  @override
  String toString() => localized;
}
