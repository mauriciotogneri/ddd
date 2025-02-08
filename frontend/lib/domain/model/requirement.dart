import 'package:testflow/domain/model/custom_table_cell.dart';
import 'package:testflow/domain/types/importance.dart';

class Requirement implements CustomTableCell {
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
  String cell(int column) {
    switch (column) {
      case 0:
        return name;
      case 1:
        return component;
      case 2:
        return platforms.join(', ');
      case 3:
        return importance.toString().split('.').last;
      case 4:
        return tags.join(', ');
      default:
        return '';
    }
  }

  @override
  String toString() => name;
}
