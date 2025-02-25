import 'package:dafluta/dafluta.dart';
import 'package:flutter/material.dart';
import 'package:testflow/debug/data.dart';
import 'package:testflow/domain/state/test_sessions/test_session_detail_state.dart';
import 'package:testflow/presentation/common/card/metadata_card.dart';
import 'package:testflow/presentation/common/input/custom_dropdown_single.dart';
import 'package:testflow/presentation/common/input/custom_text_input.dart';
import 'package:testflow/presentation/common/layout/pane.dart';
import 'package:testflow/presentation/common/menu/context_menu.dart';
import 'package:testflow/presentation/common/navigation/navigation_path.dart';
import 'package:testflow/utils/formatter.dart';
import 'package:testflow/utils/navigation.dart';
import 'package:testflow/utils/palette.dart';

class TestSessionDetailPage extends StatelessWidget {
  final TestSessionDetailState state;

  const TestSessionDetailPage._(this.state);

  factory TestSessionDetailPage.instance({
    required String projectId,
    required String testSessionId,
  }) => TestSessionDetailPage._(
    TestSessionDetailState(projectId: projectId, testSessionId: testSessionId),
  );

  @override
  Widget build(BuildContext context) {
    return StateProvider<TestSessionDetailState>(
      state: state,
      builder:
          (context, state) => state.isLoading ? const Empty() : Content(state),
    );
  }
}

class Content extends StatelessWidget {
  final TestSessionDetailState state;

  const Content(this.state);

  @override
  Widget build(BuildContext context) {
    return Pane.scrollable(children: [Header(state), Body(state)]);
  }
}

class Header extends StatelessWidget {
  final TestSessionDetailState state;

  const Header(this.state);

  @override
  Widget build(BuildContext context) {
    return PaneHeader(
      path: NavigationPath(
        paths: [
          PathItem(
            text: 'Sessions',
            path: Navigation.testSessionListPath(projectId: state.projectId),
          ),
          PathItem(text: state.testSession.id),
        ],
      ),
      actions: [
        ContextMenu(
          offset: const Offset(-85, 0),
          icon: Icons.more_horiz,
          children: [
            ContextMenuItem(
              icon: Icons.delete_outline,
              text: 'Delete',
              color: Palette.semanticError,
              onPressed: () => state.onDeleteTestSession(context),
            ),
          ],
        ),
      ],
    );
  }
}

class Body extends StatelessWidget {
  final TestSessionDetailState state;

  const Body(this.state);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [FormFields(state)],
          ),
        ),
        Metadata(state),
        const HBox(32),
      ],
    );
  }
}

class FormFields extends StatelessWidget {
  final TestSessionDetailState state;

  const FormFields(this.state);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 32, right: 32, bottom: 32, left: 32),
      child: Form(
        key: state.formKey.key,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomTextInput(
              name: 'Name',
              controller: state.nameController,
              errorMessage: 'Name is required',
            ),
            const VBox(16),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: CustomDropdownSingle<String>(
                    name: 'Environment',
                    values: DropdownItem.fromList(
                      Data.currentProject.environments,
                    ),
                    controller: state.environmentController,
                    errorMessage: 'Environment is required',
                  ),
                ),
                const HBox(16),
                Expanded(
                  child: CustomDropdownSingle<String>(
                    name: 'Platform',
                    values: DropdownItem.fromList(
                      Data.currentProject.platforms,
                    ),
                    controller: state.platformController,
                    errorMessage: 'Platform is required',
                  ),
                ),
              ],
            ),
            const VBox(16),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: CustomDropdownSingle<String>(
                    name: 'Device',
                    values: DropdownItem.fromList(Data.currentProject.devices),
                    controller: state.deviceController,
                    errorMessage: 'Device is required',
                  ),
                ),
                const HBox(16),
                Expanded(
                  child: CustomTextInput(
                    name: 'Version',
                    controller: state.versionController,
                    errorMessage: 'Version is required',
                  ),
                ),
              ],
            ),
            const VBox(16),
          ],
        ),
      ),
    );
  }
}

class Metadata extends StatelessWidget {
  final TestSessionDetailState state;

  const Metadata(this.state);

  @override
  Widget build(BuildContext context) {
    return MetadataCard([
      if (state.testSession.startedOn != null)
        MetadataItem(
          label: 'Started on',
          value: Formatter.dateMonthYear(state.testSession.startedOn!),
          tooltip: Formatter.fullDateTime(state.testSession.startedOn!),
        ),
      if (state.testSession.endedOn != null)
        MetadataItem(
          label: 'Ended on',
          value: Formatter.dateMonthYear(state.testSession.endedOn!),
          tooltip: Formatter.fullDateTime(state.testSession.endedOn!),
        ),
      if (state.testSession.timeSpent > 0)
        MetadataItem(
          label: 'Time spent',
          value: Formatter.timeElapsed(state.testSession.timeSpent),
        ),
      MetadataItem(label: 'Status', widget: state.testSession.status.chip),
      MetadataItem(
        label: 'Created on',
        value: Formatter.dateMonthYear(state.testSession.createdOn),
        tooltip: Formatter.fullDateTime(state.testSession.createdOn),
      ),
      MetadataItem(label: 'Created by', value: state.testSession.createdBy),
      MetadataItem(
        label: 'Updated on',
        value: Formatter.dateMonthYear(state.testSession.updatedOn),
        tooltip: Formatter.fullDateTime(state.testSession.updatedOn),
      ),
      MetadataItem(label: 'Updated by', value: state.testSession.updatedBy),
    ]);
  }
}
