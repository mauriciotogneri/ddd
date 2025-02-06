import 'package:dafluta/dafluta.dart';
import 'package:flutter/material.dart';
import 'package:testflow/domain/state/dashboard/dashboard_state.dart';
import 'package:testflow/presentation/common/text/label_large.dart';

class DashboardScreen extends StatelessWidget {
  final DashboardState state;

  const DashboardScreen._(this.state);

  factory DashboardScreen.instance() => DashboardScreen._(DashboardState());

  @override
  Widget build(BuildContext context) {
    return StateProvider<DashboardState>(
      state: state,
      builder: (context, state) => Scaffold(
        body: Content(state),
      ),
    );
  }
}

class Content extends StatelessWidget {
  final DashboardState state;

  const Content(this.state);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        NavigationMenu(state),
        Expanded(
          child: ActiveView(state),
        ),
      ],
    );
  }
}

class NavigationMenu extends StatelessWidget {
  final DashboardState state;

  const NavigationMenu(this.state);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      child: SizedBox(
        width: 250,
        child: Column(
          children: [
            ListTile(
              title: const LabelLarge(text: 'Requirements'),
              leading: const Icon(Icons.map_outlined),
              onTap: () => state.onActiveViewChange(0),
            ),
            ListTile(
              title: const LabelLarge(text: 'Suites'),
              leading: const Icon(Icons.home_outlined),
              onTap: () => state.onActiveViewChange(1),
            ),
            ListTile(
              title: const LabelLarge(text: 'Sessions'),
              leading: const Icon(Icons.text_snippet_outlined),
              onTap: () => state.onActiveViewChange(2),
            ),
            ListTile(
              title: const LabelLarge(text: 'Settings'),
              leading: const Icon(Icons.settings_outlined),
              onTap: () => state.onActiveViewChange(3),
            ),
          ],
        ),
      ),
    );
  }
}

class ActiveView extends StatelessWidget {
  final DashboardState state;

  const ActiveView(this.state);

  @override
  Widget build(BuildContext context) {
    if (state.activeView == 0) {
      return const RequirementsView();
    } else if (state.activeView == 1) {
      return const Center(
        child: Text('Suites'),
      );
    } else if (state.activeView == 2) {
      return const Center(
        child: Text('Sessions'),
      );
    } else {
      return const Center(
        child: Text('Settings'),
      );
    }
  }
}

class RequirementsView extends StatelessWidget {
  const RequirementsView();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Requirements'),
    );
  }
}
