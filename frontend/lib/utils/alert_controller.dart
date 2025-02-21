import 'package:flutter/material.dart';

class AlertController<T> {
  final T state;

  const AlertController(this.state);

  void close(BuildContext context) => Navigator.of(context).pop();
}
