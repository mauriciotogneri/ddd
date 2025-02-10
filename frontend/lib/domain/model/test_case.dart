import 'package:testflow/domain/model/requirement.dart';

class TestCase {
  final Requirement requirement;
  final String name;
  final bool isAutomated;
  final String preconditions;
  final String steps;
  final String expected;
  final DateTime lastRun;

  const TestCase({
    required this.requirement,
    required this.name,
    required this.isAutomated,
    required this.preconditions,
    required this.steps,
    required this.expected,
    required this.lastRun,
  });
}
