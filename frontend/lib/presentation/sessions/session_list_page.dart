import 'package:dafluta/dafluta.dart';
import 'package:flutter/material.dart';
import 'package:testflow/domain/state/sessions/session_list_state.dart';
import 'package:testflow/presentation/common/layout/pane.dart';

class SessionListPage extends StatelessWidget {
  final SessionListState state;

  const SessionListPage._(this.state);

  factory SessionListPage.instance() => SessionListPage._(SessionListState());

  @override
  Widget build(BuildContext context) {
    return StateProvider<SessionListState>(
      state: state,
      builder:
          (context, state) =>
              Pane.scrollable(children: const [Text('Sessions')]),
    );
  }
}
