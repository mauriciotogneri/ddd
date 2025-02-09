class Validator {
  static String? isNotEmpty({
    required String value,
    required String error,
  }) =>
      value.isEmpty ? error : null;

  static String? isNotNull<T>({
    required T value,
    required String error,
  }) =>
      (value == null) ? error : null;
}
