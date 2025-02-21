import 'package:dafluta/dafluta.dart';
import 'package:flutter/material.dart';
import 'package:testflow/domain/state/settings/settings_state.dart';
import 'package:testflow/presentation/common/layout/pane.dart';

class SettingsPage extends StatelessWidget {
  final SettingsState state;

  const SettingsPage._(this.state);

  factory SettingsPage.instance() => SettingsPage._(SettingsState());

  @override
  Widget build(BuildContext context) {
    return StateProvider<SettingsState>(
      state: state,
      builder:
          (context, state) =>
              Pane.scrollable(children: const [Text('Settings')]),
    );
  }
}
