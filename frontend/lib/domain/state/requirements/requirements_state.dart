import 'package:dafluta/dafluta.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:testflow/domain/model/requirement.dart';

class RequirementsState extends BaseState {
  final TextEditingController filterController = TextEditingController();
  final ShadPopoverController componentController = ShadPopoverController();
  final ShadPopoverController platformController = ShadPopoverController();

  final FocusNode componentFocusNode = FocusNode();
  final FocusNode platformFocusNode = FocusNode();

  void onRequirementSelected(Requirement requirement) {
    print(requirement);
  }
}
