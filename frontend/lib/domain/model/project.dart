class Project {
  final String id;
  final String name;
  final String description;
  final List<String> components;
  final List<String> platforms;

  Project({
    required this.id,
    required this.name,
    required this.description,
    required this.components,
    required this.platforms,
  });

  @override
  String toString() => name;
}
