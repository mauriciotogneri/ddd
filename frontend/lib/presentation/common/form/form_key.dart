import 'package:flutter/material.dart';

class FormKey extends GlobalKey<FormState> {
  const FormKey() : super.constructor();

  bool validate() => currentState?.validate() ?? false;

  void reset() => currentState?.reset();
}
