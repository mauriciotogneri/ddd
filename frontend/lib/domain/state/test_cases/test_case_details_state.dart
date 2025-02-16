import 'package:dafluta/dafluta.dart';
import 'package:flutter/material.dart';
import 'package:testflow/domain/model/requirement.dart';
import 'package:testflow/domain/model/test_case.dart';
import 'package:testflow/presentation/common/input/custom_text_input.dart';

class TestCaseDetailsState extends BaseState {
  final Requirement requirement;
  final TestCase testCase;
  final GlobalKey<FormState> formKey = GlobalKey();
  final CustomTextInputController nameController = CustomTextInputController();
  final CustomTextInputController preconditionsController =
      CustomTextInputController();
  final CustomTextInputController stepsController = CustomTextInputController();
  final CustomTextInputController expectedController =
      CustomTextInputController();

  bool get formValid => formKey.currentState!.validate();

  TestCaseDetailsState({required this.requirement, required this.testCase}) {
    nameController.text = testCase.name;
    preconditionsController.text = testCase.preconditions;
    stepsController.text = testCase.steps;
    expectedController.text = testCase.expected;
  }
}
