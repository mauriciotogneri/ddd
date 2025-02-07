import 'package:testflow/domain/model/project.dart';

class Data {
  static Project currentProject = _projects.first;

  static void onChangeProject(Project project) {
    currentProject = project;
  }

  static void onCreateProject(Project project) {
    _projects.add(project);
    onChangeProject(project);
  }

  static List<Project> projects() {
    _projects.sort((a, b) => a.name.compareTo(b.name));

    return _projects;
  }

  static final List<Project> _projects = [
    Project(
      id: '1',
      name: 'Project 1',
      description: 'Description 1',
      components: [
        'Authentication',
        'Payments',
        'Chat',
        'Notifications',
        'Analytics',
        'Profile',
        'Security',
      ],
      platforms: [
        'Web',
        'Android',
        'iOS',
      ],
    ),
    Project(
      id: '2',
      name: 'Project 2',
      description: 'Description 2',
      components: [
        'Authentication',
        'Payments',
        'Chat',
        'Notifications',
        'Analytics',
        'Profile',
        'Security',
      ],
      platforms: [
        'Web',
        'Android',
        'iOS',
      ],
    ),
    Project(
      id: '3',
      name: 'Project 3',
      description: 'Description 3',
      components: [
        'Authentication',
        'Payments',
        'Chat',
        'Notifications',
        'Analytics',
        'Profile',
        'Security',
      ],
      platforms: [
        'Web',
        'Android',
        'iOS',
      ],
    ),
  ];
}
