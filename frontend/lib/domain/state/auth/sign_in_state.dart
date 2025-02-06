import 'package:dafluta/dafluta.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:testflow/utils/navigation.dart';

class SignInState extends BaseState {
  final Key formKey = UniqueKey();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool get formFilled =>
      emailController.text.isNotEmpty && passwordController.text.isNotEmpty;

  @override
  void onLoad() {
    if (kDebugMode) {
      Navigation.dashboardScreen();
    } else {
      emailController.text = 'demo@email.com';
      passwordController.text = '123456';
      notify();
    }
  }

  void onEmailChanged(String value) {
    notify();
  }

  void onPasswordChanged(String value) {
    notify();
  }

  void onSignIn() {
    //emailController.unfocus();
    //passwordController.unfocus();

    _signIn();
  }

  void _signIn() => Navigation.dashboardScreen();
}
