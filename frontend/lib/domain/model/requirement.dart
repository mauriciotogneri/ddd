import 'package:testflow/domain/types/importance.dart';

class Requirement {
  final String name;
  final String description;
  final String component;
  final List<String> platforms;
  final Importance importance;
  final List<String> tags;

  const Requirement({
    required this.name,
    required this.description,
    required this.component,
    required this.platforms,
    required this.importance,
    required this.tags,
  });

  @override
  String toString() => name;
}
