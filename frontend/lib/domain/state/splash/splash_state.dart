import 'package:dafluta/dafluta.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:testflow/debug/data.dart';
import 'package:testflow/extensions/build_context_extension.dart';
import 'package:testflow/persistence/authentication/authentication.dart';

class SplashState extends BaseState {
  @override
  void onLoad() {}

  void _onAuthenticated({required BuildContext context, required User user}) =>
      context.dashboard(projectId: Data.currentProject.id);

  void _onNotAuthenticated(BuildContext context) => context.signIn();

  void init(BuildContext context) {
    Authentication.checkIfAuthenticated(
      onSuccess: (user) => _onAuthenticated(context: context, user: user),
      onError: () => _onNotAuthenticated(context),
    );
  }
}
