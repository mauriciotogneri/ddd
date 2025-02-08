import 'package:dafluta/dafluta.dart';
import 'package:flutter/material.dart';
import 'package:testflow/utils/navigation.dart';

class SignInState extends BaseState {
  final Key formKey = UniqueKey();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String get email => emailController.text.trim();

  String get password => passwordController.text.trim();

  bool get formFilled => email.isNotEmpty && password.isNotEmpty;

  @override
  void onLoad() {
    emailController.text = 'demo@email.com';
    passwordController.text = '123456';
    notify();
  }

  void onSignIn() {
    //emailController.unfocus();
    //passwordController.unfocus();

    _signIn();
  }

  void _signIn() => Navigation.dashboardScreen();
}
