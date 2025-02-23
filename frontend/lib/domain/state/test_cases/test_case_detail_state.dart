import 'package:dafluta/dafluta.dart';
import 'package:flutter/material.dart';
import 'package:testflow/debug/data.dart';
import 'package:testflow/domain/model/requirement.dart';
import 'package:testflow/domain/model/test_case.dart';
import 'package:testflow/domain/model/test_run.dart';
import 'package:testflow/domain/types/test_case_execution.dart';
import 'package:testflow/domain/types/test_run_reproducibility.dart';
import 'package:testflow/domain/types/test_run_status.dart';
import 'package:testflow/presentation/common/form/form_key.dart';
import 'package:testflow/presentation/common/input/custom_dropdown_multiple.dart';
import 'package:testflow/presentation/common/input/custom_dropdown_single.dart';
import 'package:testflow/presentation/common/input/custom_text_input.dart';

class TestCaseDetailState extends BaseState {
  final String projectId;
  final String requirementId;
  final String testCaseId;
  Requirement? _requirement;
  TestCase? _testCase;
  final List<TestRun> _allTestRuns = [];
  final FormKey formKey = FormKey();
  final CustomTextInputController nameController = CustomTextInputController();
  final CustomDropdownSingleController<TestCaseExecution> executionController =
      CustomDropdownSingleController();
  final CustomTextInputController preconditionsController =
      CustomTextInputController();
  final CustomTextInputController stepsController = CustomTextInputController();
  final CustomTextInputController expectedController =
      CustomTextInputController();

  final CustomTextInputController queryFilterController =
      CustomTextInputController();
  final CustomDropdownMultipleController<TestRunStatus> statusFilterController =
      CustomDropdownMultipleController();
  final CustomDropdownMultipleController<TestRunReproducibility>
  reproducibilityFilterController = CustomDropdownMultipleController();

  TestCaseDetailState({
    required this.projectId,
    required this.requirementId,
    required this.testCaseId,
  });

  List<TestRun> get testRuns =>
      _allTestRuns
          .where(
            (testRun) => testRun.matches(
              queryFilter: queryFilterController.text,
              statusFilter: statusFilterController.selected,
              reproducibilityFilter: reproducibilityFilterController.selected,
            ),
          )
          .toList();

  Requirement get requirement => _requirement!;

  TestCase get testCase => _testCase!;

  bool get isLoading => (_requirement == null) || (_testCase == null);

  bool get hasFilters =>
      queryFilterController.isNotEmpty ||
      statusFilterController.isNotEmpty ||
      reproducibilityFilterController.isNotEmpty;

  @override
  void onLoad() {
    _requirement = Data.requirementById(requirementId);
    _testCase = Data.testCaseById(testCaseId);

    nameController.text = testCase.name;
    executionController.select(testCase.execution);
    preconditionsController.text = testCase.preconditions;
    stepsController.text = testCase.steps;
    expectedController.text = testCase.expected;

    _allTestRuns.addAll(Data.testRuns(testCase));
    notify();
  }

  void onResetFilters() {
    queryFilterController.clear();
    statusFilterController.clear();
    reproducibilityFilterController.clear();
    notify();
  }

  void onDeleteTestCase() {}

  void onTestRunSelected({
    required BuildContext context,
    required TestRun testRun,
  }) {}
}
