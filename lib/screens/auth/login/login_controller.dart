import 'dart:async';
import 'package:ecommerce/Controllers/gql_controller.dart';
import 'package:ecommerce/Controllers/user_controller.dart';
import 'package:ecommerce/Models/authenticated_item.dart';
import 'package:ecommerce/graphql/mutations.dart';
import 'package:ecommerce/utils/app_state.dart';
import 'package:ecommerce/utils/exceptions.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:progress_state_button/progress_button.dart';

class LoginController extends GetxController {
  static LoginController get to => Get.find();
  final email = ''.obs;
  final password = ''.obs;
  final Rx<AuthItem> authenticatedItem = AuthItem().obs;
  final box = GetStorage();
  final appState = Rx<AppState>(AppState.IDLE);
  final buttonState = Rx<ButtonState>(ButtonState.idle);

  // ignore: use_setters_to_change_properties
  void changeEmail(String value) => email.value = value;

  // ignore: use_setters_to_change_properties
  void changePassword(String value) => password.value = value;

  Future<void> signIn() async {
    try {
      appState.value = AppState.LOADING;
      buttonState.value = ButtonState.loading;

      final res = await GqlController.to.httpClient.post(
          storeCookie: true,
          gql: SIGNIN_MUTATION,
          variables: {"email": email.value, "password": password.value});
      if (res.errors != null) {
        throw AuthenticationException(res.errors![0].message);
      } else if (res.data!["authenticateUserWithPassword"]["code"] != null) {
        throw AuthenticationException(
            res.data!["authenticateUserWithPassword"]["message"] as String);
      }
      authenticatedItem.value = AuthItem.fromJson(res.data!);
      await UserController.to.saveUser();
      await UserController.to.fetchCurrentUser();
      appState.value = AppState.DONE;
      buttonState.value = ButtonState.success;
      Get.back();
    } on AuthenticationException catch (e) {
      appState.value = AppState.ERROR;
      buttonState.value = ButtonState.fail;
      Get.snackbar("Error", e.message);
    }
  }

  bool get isEmailValid => GetUtils.isEmail(email.value);

  bool get isPasswordValid =>
      GetUtils.isLengthGreaterOrEqual(password.value, 6);

  bool get isFormValid =>
      isEmailValid &&
      isPasswordValid &&
      email.value.isNotEmpty &&
      password.value.isNotEmpty;
}
