import 'package:dafluta/dafluta.dart';
import 'package:flutter/material.dart';
import 'package:testflow/domain/state/test_sessions/test_session_list_state.dart';
import 'package:testflow/presentation/common/layout/pane.dart';

class TestSessionListPage extends StatelessWidget {
  final TestSessionListState state;

  const TestSessionListPage._(this.state);

  factory TestSessionListPage.instance() =>
      TestSessionListPage._(TestSessionListState());

  @override
  Widget build(BuildContext context) {
    return StateProvider<TestSessionListState>(
      state: state,
      builder:
          (context, state) =>
              Pane.scrollable(children: const [Text('Sessions')]),
    );
  }
}
