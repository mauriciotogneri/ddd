import 'package:dafluta/dafluta.dart';
import 'package:flutter/material.dart';
import 'package:testflow/domain/state/test_cases/test_case_detail_state.dart';
import 'package:testflow/domain/types/test_case_execution.dart';
import 'package:testflow/presentation/common/input/custom_dropdown_single.dart';
import 'package:testflow/presentation/common/input/custom_multiline_input.dart';
import 'package:testflow/presentation/common/input/custom_text_input.dart';
import 'package:testflow/presentation/common/layout/pane.dart';
import 'package:testflow/presentation/common/menu/context_menu.dart';
import 'package:testflow/presentation/common/navigation/navigation_path.dart';
import 'package:testflow/utils/navigation.dart';
import 'package:testflow/utils/palette.dart';

class TestCaseDetailPage extends StatelessWidget {
  final TestCaseDetailState state;

  const TestCaseDetailPage._(this.state);

  factory TestCaseDetailPage.instance({
    required String projectId,
    required String requirementId,
    required String testCaseId,
  }) => TestCaseDetailPage._(
    TestCaseDetailState(
      projectId: projectId,
      requirementId: requirementId,
      testCaseId: testCaseId,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return StateProvider<TestCaseDetailState>(
      state: state,
      builder:
          (context, state) => state.isLoading ? const Empty() : Content(state),
    );
  }
}

class Content extends StatelessWidget {
  final TestCaseDetailState state;

  const Content(this.state);

  @override
  Widget build(BuildContext context) {
    return Pane.scrollable(
      children: [
        PaneHeader(
          path: NavigationPath(
            paths: [
              PathItem(
                text: 'Requirements',
                path: Navigation.requirementListPath(state.projectId),
              ),
              PathItem(
                text: state.requirement.code,
                path: Navigation.requirementDetailPath(
                  projectId: state.projectId,
                  requirementId: state.requirement.id,
                ),
              ),
              PathItem(text: state.testCase.name),
            ],
          ),
          actions: [
            ContextMenu(
              icon: Icons.more_horiz,
              children: [
                ContextMenuItem(
                  icon: Icons.delete_outline,
                  text: 'Delete',
                  color: Palette.semanticError,
                  onPressed: state.onDeleteTestCase,
                ),
              ],
            ),
          ],
        ),
        FormFields(state),
      ],
    );
  }
}

class FormFields extends StatelessWidget {
  final TestCaseDetailState state;

  const FormFields(this.state);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Form(
        key: state.formKey.key,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomTextInput(
                  width: 835,
                  name: 'Name',
                  controller: state.nameController,
                  errorMessage: 'Name is required',
                ),
                const HBox(16),
                CustomDropdownSingle<TestCaseExecution>(
                  width: 150,
                  name: 'Execution',
                  values: TestCaseExecution.items,
                  controller: state.executionController,
                  errorMessage: 'Execution is required',
                ),
              ],
            ),
            const VBox(16),
            CustomMultilineInput(
              width: 1000,
              minLines: 5,
              maxLines: 5,
              name: 'Preconditions',
              controller: state.preconditionsController,
            ),
            const VBox(16),
            CustomTextInput(
              width: 1000,
              minLines: 5,
              maxLines: 5,
              name: 'Steps',
              controller: state.stepsController,
            ),
            const VBox(16),
            CustomTextInput(
              width: 1000,
              minLines: 5,
              maxLines: 5,
              name: 'Expected result',
              controller: state.expectedController,
            ),
            const VBox(16),
          ],
        ),
      ),
    );
  }
}
