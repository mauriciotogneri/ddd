import 'package:flutter/material.dart';
import 'package:testflow/domain/types/test_run_reproducibility.dart';
import 'package:testflow/domain/types/test_run_result.dart';
import 'package:testflow/extensions/string_extension.dart';
import 'package:testflow/presentation/common/table/custom_table.dart';
import 'package:testflow/presentation/common/text/body_medium.dart';
import 'package:testflow/utils/formatter.dart';

class TestRun implements TableElement<TestRun, TestRunColumn, void> {
  final String id;
  final String requirementId;
  final String testCaseId;
  final String name;
  final String preconditions;
  final String steps;
  final String expected;
  final String actual;
  final TestRunResult result;
  final TestRunReproducibility reproducibility;
  final DateTime timestamp;
  final DateTime createdOn;
  final String createdBy;
  final DateTime updatedOn;
  final String updatedBy;

  const TestRun({
    required this.id,
    required this.requirementId,
    required this.testCaseId,
    required this.name,
    required this.preconditions,
    required this.steps,
    required this.expected,
    required this.actual,
    required this.result,
    required this.reproducibility,
    required this.timestamp,
    required this.createdOn,
    required this.createdBy,
    required this.updatedOn,
    required this.updatedBy,
  });

  bool matches({
    required String queryFilter,
    required List<TestRunResult> resultFilter,
    required List<TestRunReproducibility> reproducibilityFilter,
  }) {
    if (queryFilter.isEmpty &&
        resultFilter.isEmpty &&
        reproducibilityFilter.isEmpty) {
      return true;
    } else {
      final bool matchesQuery =
          queryFilter.isEmpty ||
          name.matches(queryFilter) ||
          preconditions.matches(queryFilter) ||
          steps.matches(queryFilter) ||
          expected.matches(queryFilter);
      final bool matchesExecution =
          resultFilter.isEmpty || resultFilter.contains(result);
      final bool matchesReproducibility =
          reproducibilityFilter.isEmpty ||
          reproducibilityFilter.contains(reproducibility);

      return matchesQuery && matchesExecution && matchesReproducibility;
    }
  }

  static List<TableColumn<TestRunColumn>> get columns => const [
    TableColumn(id: TestRunColumn.name, name: 'Name'),
    TableColumn(
      id: TestRunColumn.result,
      name: 'Result',
      width: 200,
      alignment: Alignment.center,
    ),
    TableColumn(
      id: TestRunColumn.reproducibility,
      name: 'Reproducibility',
      width: 200,
      alignment: Alignment.center,
    ),
    TableColumn(
      id: TestRunColumn.timestamp,
      name: 'Timestamp',
      width: 200,
      alignment: Alignment.center,
    ),
  ];

  @override
  Widget cell({
    required TableColumn<TestRunColumn> column,
    required Function(TestRun, void)? onMenuSelected,
  }) {
    switch (column.id) {
      case TestRunColumn.name:
        return BodyMedium(text: name);
      case TestRunColumn.result:
        return result.chip;
      case TestRunColumn.reproducibility:
        return reproducibility.chip;
      case TestRunColumn.timestamp:
        return Tooltip(
          message: Formatter.fullDateTime(timestamp),
          child: BodyMedium(text: Formatter.daysAgo(timestamp)),
        );
    }
  }
}

enum TestRunColumn { name, result, reproducibility, timestamp }
