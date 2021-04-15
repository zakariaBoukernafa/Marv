import 'dart:async';
import 'package:ecommerce/Screens/Auth/Login/LoginController.dart';
import 'package:ecommerce/graphql/Mutations.dart';
import 'package:ecommerce/utils/AppState.dart';
import 'package:ecommerce/utils/Exceptions.dart';

import 'package:get/get.dart';
import 'package:progress_state_button/progress_button.dart';

import '../../../Controllers/GqlController.dart';

class SignUpController extends GetxController {
  static SignUpController get to => Get.find();
  final email = ''.obs;
  final name = ''.obs;
  final password = ''.obs;
  final appState = Rx<AppState>(AppState.IDLE);
  final buttonState = Rx<ButtonState>(ButtonState.idle);

  void changeEmail(String value) => email.value = value;

  void changeName(String value) => name.value = value;

  void changePassword(String value) => password.value = value;

  Future<void> signUp() async {
    try {
      appState.value = AppState.LOADING;
      buttonState.value = ButtonState.loading;

     var res = await GqlController.to.httpClient.post(gql: SIGNUP_MUTATION, variables: {
        "email": email.value,
        "name": name.value,
        "password": password.value
      });
      if (res.errors!= null) {
        throw SignUpException(
            res.errors![0].message);
      }
      createLoginToken();

      appState.value = AppState.DONE;
      buttonState.value = ButtonState.success;
    } on SignUpException catch (e) {
      appState.value = AppState.ERROR;
      buttonState.value = ButtonState.fail;
      Get.snackbar("Error", e.message);
    }
  }

  void createLoginToken() {
    LoginController.to.email.value = this.email.value;
    LoginController.to.password.value = this.password.value;
    LoginController.to.signIn();
  }

  bool get isEmailValid => GetUtils.isEmail(email.value);

  bool get isPasswordValid =>
      GetUtils.isLengthGreaterOrEqual(password.value, 6);

  bool get isNameValid => GetUtils.isLengthGreaterOrEqual(name.value, 4);

  bool get isFormValid =>
      isEmailValid &&
      isNameValid &&
      isPasswordValid &&
      email.value.isNotEmpty &&
      name.value.isNotEmpty &&
      password.value.isNotEmpty;
}
