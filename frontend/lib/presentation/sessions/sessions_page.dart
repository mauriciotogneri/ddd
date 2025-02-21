import 'package:dafluta/dafluta.dart';
import 'package:flutter/material.dart';
import 'package:testflow/domain/state/sessions/sessions_state.dart';
import 'package:testflow/presentation/common/layout/pane.dart';

class SessionsPage extends StatelessWidget {
  final SessionsState state;

  const SessionsPage._(this.state);

  factory SessionsPage.instance() => SessionsPage._(SessionsState());

  @override
  Widget build(BuildContext context) {
    return StateProvider<SessionsState>(
      state: state,
      builder:
          (context, state) =>
              Pane.scrollable(children: const [Text('Sessions')]),
    );
  }
}
