import 'package:dafluta/dafluta.dart';
import 'package:flutter/material.dart';
import 'package:testflow/debug/data.dart';
import 'package:testflow/domain/types/requirement_importance.dart';
import 'package:testflow/domain/types/requirement_type.dart';
import 'package:testflow/presentation/common/button/primary_text_button.dart';
import 'package:testflow/presentation/common/button/secondary_text_button.dart';
import 'package:testflow/presentation/common/form/form_key.dart';
import 'package:testflow/presentation/common/input/custom_dropdown_multiple.dart';
import 'package:testflow/presentation/common/input/custom_dropdown_single.dart';
import 'package:testflow/presentation/common/input/custom_text_input.dart';
import 'package:testflow/presentation/dialogs/base_dialog.dart';

class CreateTestSuiteDialog extends StatelessWidget {
  final CreateTestSuiteDialogState state;

  const CreateTestSuiteDialog._(this.state);

  factory CreateTestSuiteDialog.instance({
    required OnCreateTestSuite onCreateTestSuite,
  }) => CreateTestSuiteDialog._(
    CreateTestSuiteDialogState(onCreateTestSuite: onCreateTestSuite),
  );

  @override
  Widget build(BuildContext context) {
    return StateProvider<CreateTestSuiteDialogState>(
      state: state,
      builder:
          (context, state) => BaseDialog(
            title: 'New suite',
            width: 350,
            actions: [
              SecondaryTextButton(
                text: 'Cancel',
                onPressed: Navigator.of(context).pop,
              ),
              const HBox(4),
              PrimaryTextButton(
                text: 'Create',
                onPressed: () => state.onCreate(context),
              ),
            ],
            content: FormFields(state),
          ),
    );
  }
}

class FormFields extends StatelessWidget {
  final CreateTestSuiteDialogState state;

  const FormFields(this.state);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: state.formKey.key,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomTextInput(
            autofocus: true,
            controller: state.nameController,
            name: 'Name',
            errorMessage: 'Name is required',
          ),
          const VBox(16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomDropdownMultiple<RequirementType>(
                      width: 240,
                      values: RequirementType.items,
                      controller: state.typesController,
                      name: 'Types',
                      errorMessage: 'Types is required',
                    ),
                  ],
                ),
              ),
              const HBox(16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomDropdownMultiple<RequirementImportance>(
                      width: 240,
                      values: RequirementImportance.items,
                      controller: state.importancesController,
                      name: 'Importances',
                      errorMessage: 'Importances is required',
                    ),
                  ],
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomDropdownMultiple<String>(
                      width: 240,
                      values: DropdownItem.fromList(
                        Data.currentProject.components,
                      ),
                      controller: state.componentsController,
                      name: 'Components',
                      errorMessage: 'Components is required',
                    ),
                  ],
                ),
              ),
              const HBox(16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomDropdownMultiple<String>(
                      width: 240,
                      values: DropdownItem.fromList(
                        Data.currentProject.platforms,
                      ),
                      controller: state.platformsController,
                      name: 'Platforms',
                      errorMessage: 'Platforms is required',
                    ),
                  ],
                ),
              ),
            ],
          ),
          const VBox(16),
        ],
      ),
    );
  }
}

class CreateTestSuiteDialogState extends BaseState {
  final FormKey formKey = FormKey();
  final OnCreateTestSuite onCreateTestSuite;
  final CustomTextInputController nameController = CustomTextInputController();
  final CustomDropdownMultipleController<RequirementType> typesController =
      CustomDropdownMultipleController();
  final CustomDropdownMultipleController<RequirementImportance>
  importancesController = CustomDropdownMultipleController();
  final CustomDropdownMultipleController<String> componentsController =
      CustomDropdownMultipleController();
  final CustomDropdownMultipleController<String> platformsController =
      CustomDropdownMultipleController();

  CreateTestSuiteDialogState({required this.onCreateTestSuite});

  void onCreate(BuildContext context) {
    if (formKey.validate()) {
      Navigator.of(context).pop();

      onCreateTestSuite(
        name: nameController.text,
        types: typesController.selected,
        importances: importancesController.selected,
        components: componentsController.selected,
        platforms: platformsController.selected,
      );
    }
  }
}

typedef OnCreateTestSuite =
    void Function({
      required String name,
      required List<RequirementType> types,
      required List<RequirementImportance> importances,
      required List<String> components,
      required List<String> platforms,
    });
