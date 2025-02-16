import 'package:dafluta/dafluta.dart';
import 'package:testflow/presentation/common/form/form_key.dart';
import 'package:testflow/presentation/common/input/custom_text_input.dart';
import 'package:testflow/utils/navigation.dart';

class SignInState extends BaseState {
  final FormKey formKey = const FormKey();
  final CustomTextInputController emailController = CustomTextInputController();
  final CustomTextInputController passwordController =
      CustomTextInputController();

  @override
  void onLoad() {
    emailController.text = 'demo@email.com';
    passwordController.text = '123456';
    notify();
  }

  void onSignIn() {
    if (formKey.validate()) {
      _signIn();
    }
  }

  void _signIn() => Navigation.dashboardScreen();
}
