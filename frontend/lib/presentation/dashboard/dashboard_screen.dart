import 'package:dafluta/dafluta.dart';
import 'package:flutter/material.dart';
import 'package:testflow/domain/state/dashboard/dashboard_state.dart';
import 'package:testflow/utils/palette.dart';

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
            NavigationMenuRow(
              state: state,
              text: 'Requirements',
              icon: Icons.map_outlined,
              index: DashboardState.VIEW_REQUIREMENTS,
            ),
            NavigationMenuRow(
              state: state,
              text: 'Suites',
              icon: Icons.home_outlined,
              index: DashboardState.VIEW_SUITES,
            ),
            NavigationMenuRow(
              state: state,
              text: 'Sessions',
              icon: Icons.text_snippet_outlined,
              index: DashboardState.VIEW_SESSIONS,
            ),
            NavigationMenuRow(
              state: state,
              text: 'Settings',
              icon: Icons.settings_outlined,
              index: DashboardState.VIEW_SETTINGS,
            ),
          ],
        ),
      ),
    );
  }
}

class NavigationMenuRow extends StatelessWidget {
  final DashboardState state;
  final String text;
  final IconData icon;
  final int index;

  const NavigationMenuRow({
    required this.state,
    required this.text,
    required this.icon,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final bool isSelected = state.activeView == index;

    return ListTile(
      title: Text(
        text,
        style: Theme.of(context).textTheme.labelLarge!.copyWith(
              color: isSelected ? Palette.textEnabled : Palette.textDisabled,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
      ),
      leading: Icon(icon),
      onTap: () => state.onActiveViewChange(index),
      selected: isSelected,
      selectedTileColor: Palette.rowSelected,
      selectedColor: Palette.iconEnabled,
      iconColor: Palette.iconDisabled,
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
      return const SuitesView();
    } else if (state.activeView == 2) {
      return const SessionsView();
    } else {
      return const SettingsView();
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

class SuitesView extends StatelessWidget {
  const SuitesView();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Suites'),
    );
  }
}

class SessionsView extends StatelessWidget {
  const SessionsView();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Sessions'),
    );
  }
}

class SettingsView extends StatelessWidget {
  const SettingsView();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Settings'),
    );
  }
}
