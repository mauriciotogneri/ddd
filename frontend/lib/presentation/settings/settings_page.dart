import 'package:dafluta/dafluta.dart';
import 'package:flutter/material.dart';
import 'package:testflow/domain/state/settings/settings_state.dart';
import 'package:testflow/presentation/common/layout/pane.dart';
import 'package:testflow/presentation/common/navigation/navigation_path.dart';
import 'package:testflow/utils/navigation.dart';

class SettingsPage extends StatelessWidget {
  final SettingsState state;

  const SettingsPage._(this.state);

  factory SettingsPage.instance({required String projectId}) =>
      SettingsPage._(SettingsState(projectId: projectId));

  @override
  Widget build(BuildContext context) {
    return StateProvider<SettingsState>(
      state: state,
      builder: (context, state) => Content(state),
    );
  }
}

class Content extends StatelessWidget {
  final SettingsState state;

  const Content(this.state);

  @override
  Widget build(BuildContext context) {
    return Pane.scrollable(children: [Header(state), Body(state)]);
  }
}

class Header extends StatelessWidget {
  final SettingsState state;

  const Header(this.state);

  @override
  Widget build(BuildContext context) {
    return PaneHeader(
      path: NavigationPath(
        paths: [
          PathItem(
            text: 'Settings',
            path: Navigation.settingsPath(projectId: state.projectId),
          ),
        ],
      ),
    );
  }
}

class Body extends StatelessWidget {
  final SettingsState state;

  const Body(this.state);

  @override
  Widget build(BuildContext context) {
    return const Empty();
  }
}
