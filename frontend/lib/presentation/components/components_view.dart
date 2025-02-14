import 'package:dafluta/dafluta.dart';
import 'package:flutter/material.dart';
import 'package:testflow/domain/state/components/components_state.dart';
import 'package:testflow/presentation/common/input/text_input_field.dart';
import 'package:testflow/presentation/common/view/base_view.dart';

class ComponentsView extends StatelessWidget {
  final ComponentsState state;

  const ComponentsView._(this.state);

  factory ComponentsView.instance() => ComponentsView._(ComponentsState());

  @override
  Widget build(BuildContext context) {
    return StateProvider<ComponentsState>(
      state: state,
      builder:
          (context, state) => BaseView.normal(
            header: const Text('HEADER'),
            content: Content(state),
          ),
    );
  }
}

class Content extends StatelessWidget {
  final ComponentsState state;

  const Content(this.state);

  @override
  Widget build(BuildContext context) {
    //return TextFields(state);
    return const Text('CONTENT');
    /*return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [TextFields(state)],
      ),
    );*/
  }
}

class TextFields extends StatelessWidget {
  final ComponentsState state;

  const TextFields(this.state);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: state.formKey,
      child: Row(
        children: [
          TextInputField(
            hint: 'Query',
            controller: state.queryFilterController,
            onChange: (_) => state.notify(),
            prefixIcon: const TextInputIcon(Icons.email_outlined),
          ),
        ],
      ),
    );
  }
}
