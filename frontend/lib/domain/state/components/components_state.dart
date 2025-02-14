import 'package:dafluta/dafluta.dart';
import 'package:flutter/material.dart';
import 'package:testflow/presentation/common/input/text_input_field.dart';

class ComponentsState extends BaseState {
  final GlobalKey<FormState> form1Key = GlobalKey<FormState>();
  final GlobalKey<FormState> form2Key = GlobalKey<FormState>();
  final TextInputController queryFilterController = TextInputController();
}
