import 'package:dafluta/dafluta.dart';
import 'package:flutter/material.dart';
import 'package:testflow/debug/data.dart';
import 'package:testflow/domain/model/test_run.dart';
import 'package:testflow/domain/model/test_session.dart';
import 'package:testflow/domain/types/test_run_reproducibility.dart';
import 'package:testflow/domain/types/test_run_result.dart';
import 'package:testflow/presentation/common/form/form_key.dart';
import 'package:testflow/presentation/common/input/custom_dropdown_single.dart';
import 'package:testflow/presentation/common/input/custom_text_input.dart';
import 'package:testflow/presentation/dialogs/base_dialog.dart';
import 'package:testflow/presentation/dialogs/confirmation_dialog.dart';
import 'package:testflow/utils/palette.dart';

class TestRunDetailState extends BaseState {
  final String projectId;
  final String sessionId;
  final String testRunId;
  TestSession? _testSession;
  TestRun? _testRun;
  final FormKey formKey = FormKey();
  final CustomTextInputController nameController = CustomTextInputController();
  final CustomTextInputController preconditionsController =
      CustomTextInputController();
  final CustomTextInputController stepsController = CustomTextInputController();
  final CustomTextInputController expectedController =
      CustomTextInputController();
  final CustomTextInputController actualController =
      CustomTextInputController();
  final CustomDropdownSingleController<TestRunResult> resultController =
      CustomDropdownSingleController();
  final CustomDropdownSingleController<TestRunReproducibility>
  reproducibilityController = CustomDropdownSingleController();

  TestRunDetailState({
    required this.projectId,
    required this.sessionId,
    required this.testRunId,
  });

  TestSession get testSession => _testSession!;

  TestRun get testRun => _testRun!;

  @override
  void onLoad() {
    _testSession = Data.testSessionById(sessionId);
    _testRun = Data.testRunById(testRunId);

    nameController.text = testRun.name;
    preconditionsController.text = testRun.preconditions;
    stepsController.text = testRun.steps;
    expectedController.text = testRun.expected;
    actualController.text = testRun.actual;
    resultController.select(testRun.result);
    reproducibilityController.select(testRun.reproducibility);

    notify();
  }

  void onDeleteTestRun(BuildContext context) => BaseDialog.show(
    context: context,
    dialog: ConfirmationDialog(
      message: 'Do you want to delete the test run?',
      acceptButtonText: 'Delete',
      acceptButtonColor: Palette.borderButtonError,
      onAccept: () => _deleteTestRun(context: context, testRun: testRun),
    ),
  );

  void _deleteTestRun({
    required BuildContext context,
    required TestRun testRun,
  }) {
    Navigator.of(context).pop();
  }
}
