import 'package:dafluta/dafluta.dart';
import 'package:flutter/material.dart';
import 'package:testflow/domain/model/requirement.dart';
import 'package:testflow/domain/types/test_case_execution.dart';
import 'package:testflow/presentation/common/table/custom_table.dart';
import 'package:testflow/presentation/common/text/body_medium.dart';
import 'package:testflow/utils/formatter.dart';

class TestCase implements TableElement {
  final Requirement requirement;
  final String name;
  final TestCaseExecution execution;
  final String preconditions;
  final String steps;
  final String expected;
  final DateTime lastRun;

  const TestCase({
    required this.requirement,
    required this.name,
    required this.execution,
    required this.preconditions,
    required this.steps,
    required this.expected,
    required this.lastRun,
  });

  static List<TableColumn> get columns => const [
    TableColumn(id: TestCaseColumn.name, name: 'Name'),
    TableColumn(
      id: TestCaseColumn.executionType,
      name: 'Execution',
      width: 200,
      alignment: Alignment.center,
    ),
    TableColumn(
      id: TestCaseColumn.lastRunDate,
      name: 'Last run',
      width: 200,
      alignment: Alignment.centerRight,
    ),
    TableColumn(
      id: TestCaseColumn.lastRunAgo,
      name: 'Last run',
      width: 200,
      alignment: Alignment.centerRight,
    ),
  ];

  @override
  Widget cell(TableColumn column) {
    switch (column.id) {
      case TestCaseColumn.name:
        return BodyMedium(text: name);
      case TestCaseColumn.executionType:
        return execution.chip;
      case TestCaseColumn.lastRunDate:
        return BodyMedium(text: Formatter.fullDateTime(lastRun));
      case TestCaseColumn.lastRunAgo:
        return const BodyMedium(text: 'XXX');
      default:
        return const Empty();
    }
  }
}

enum TestCaseColumn { name, executionType, lastRunDate, lastRunAgo }
