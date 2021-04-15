import 'dart:async';
import 'package:ecommerce/Controllers/GqlController.dart';
import 'package:ecommerce/Controllers/UserController.dart';
import 'package:ecommerce/Models/AuthenticatedItem.dart';
import 'package:ecommerce/Models/User.dart';
import 'package:ecommerce/graphql/Mutations.dart';
import 'package:ecommerce/graphql/Queries.dart';
import 'package:ecommerce/utils/AppState.dart';
import 'package:ecommerce/utils/Exceptions.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:graphql_flutter/graphql_flutter.dart' as gql;
import 'package:progress_state_button/progress_button.dart';

class LoginController extends GetxController {
  static LoginController get to => Get.find();
  final email = ''.obs;
  final password = ''.obs;
  final Rx<AuthItem> authenticatedItem = AuthItem().obs;
  final box = GetStorage();
  final appState = Rx<AppState>(AppState.IDLE);
  final buttonState = Rx<ButtonState>(ButtonState.idle);

  void changeEmail(String value) => email.value = value;

  void changePassword(String value) => password.value = value;

  Future<void> signIn() async {
    try {
      appState.value = AppState.LOADING;
      buttonState.value = ButtonState.loading;

      var res = await GqlController.to.httpClient.post(
          storeCookie: true,
          gql: SIGNIN_MUTATION,
          variables: {"email": email.value, "password": password.value});
      if (res.errors != null)
        throw AuthenticationException(res.errors![0].message);
      else if (res.data!["authenticateUserWithPassword"]["code"] != null)
        throw AuthenticationException(
            res.data!["authenticateUserWithPassword"]["message"]);

      this.authenticatedItem.value = AuthItem.fromJson(res.data!);
      appState.value = AppState.DONE;
      buttonState.value = ButtonState.success;
      gql.Response currentUser = await fetchCurrentUser();
      UserController.to.user!.value = User.fromJson(currentUser.data!);
      UserController.to.saveUser();
    } on AuthenticationException catch (e) {
      appState.value = AppState.ERROR;
      buttonState.value = ButtonState.fail;
      Get.snackbar("Error", e.message);
    }
  }

  Future<gql.Response> fetchCurrentUser() async {
    return await GqlController.to.httpClient.post(
      gql: CURRENT_USER_QUERY,
    );
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
