import 'package:dafluta/dafluta.dart';
import 'package:flutter/material.dart';
import 'package:testflow/debug/data.dart';
import 'package:testflow/domain/types/requirement_importance.dart';
import 'package:testflow/domain/types/requirement_status.dart';
import 'package:testflow/domain/types/requirement_type.dart';
import 'package:testflow/presentation/common/button/primary_text_button.dart';
import 'package:testflow/presentation/common/button/secondary_text_button.dart';
import 'package:testflow/presentation/common/form/form_key.dart';
import 'package:testflow/presentation/common/input/custom_dropdown_multiple.dart';
import 'package:testflow/presentation/common/input/custom_dropdown_single.dart';
import 'package:testflow/presentation/common/input/custom_text_input.dart';
import 'package:testflow/presentation/dialogs/base_dialog.dart';

class CreateSuiteDialog extends StatelessWidget {
  final CreateSuiteDialogState state;

  const CreateSuiteDialog._(this.state);

  factory CreateSuiteDialog.instance({required OnCreateSuite onCreateSuite}) =>
      CreateSuiteDialog._(CreateSuiteDialogState(onCreateSuite: onCreateSuite));

  @override
  Widget build(BuildContext context) {
    return StateProvider<CreateSuiteDialogState>(
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
  final CreateSuiteDialogState state;

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
          CustomDropdownMultiple<RequirementType>(
            values: RequirementType.items,
            controller: state.typesController,
            name: 'Type',
            errorMessage: 'Type is required',
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
                    CustomDropdownMultiple<RequirementStatus>(
                      width: 240,
                      values: RequirementStatus.items,
                      controller: state.statusesController,
                      name: 'Status',
                      errorMessage: 'Status is required',
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
                      name: 'Importance',
                      errorMessage: 'Importance is required',
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
                      name: 'Component',
                      errorMessage: 'Component is required',
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

class CreateSuiteDialogState extends BaseState {
  final FormKey formKey = FormKey();
  final OnCreateSuite onCreateSuite;
  final CustomTextInputController nameController = CustomTextInputController();
  final CustomDropdownMultipleController<RequirementType> typesController =
      CustomDropdownMultipleController();
  final CustomDropdownMultipleController<RequirementStatus> statusesController =
      CustomDropdownMultipleController();
  final CustomDropdownMultipleController<RequirementImportance>
  importancesController = CustomDropdownMultipleController();
  final CustomDropdownMultipleController<String> componentsController =
      CustomDropdownMultipleController();
  final CustomDropdownMultipleController<String> platformsController =
      CustomDropdownMultipleController();

  CreateSuiteDialogState({required this.onCreateSuite});

  void onCreate(BuildContext context) {
    if (formKey.validate()) {
      Navigator.of(context).pop();

      onCreateSuite(
        name: nameController.text,
        types: typesController.selected,
        statuses: statusesController.selected,
        importances: importancesController.selected,
        components: componentsController.selected,
        platforms: platformsController.selected,
      );
    }
  }
}

typedef OnCreateSuite =
    void Function({
      required String name,
      required List<RequirementType> types,
      required List<RequirementStatus> statuses,
      required List<RequirementImportance> importances,
      required List<String> components,
      required List<String> platforms,
    });
