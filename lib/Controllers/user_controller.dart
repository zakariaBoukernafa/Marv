import 'dart:io';

import 'package:ecommerce/Controllers/gql_controller.dart';
import 'package:ecommerce/Models/user.dart';
import 'package:ecommerce/graphql/mutations.dart';
import 'package:ecommerce/graphql/queries.dart';
import 'package:ecommerce/screens/products/products_controller.dart';
import 'package:ecommerce/utils/app_state.dart';
import 'package:ecommerce/utils/user_state.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:graphql_flutter/graphql_flutter.dart' as gql;

class UserController extends GetxController {
  static UserController get to => Get.find();

  final Rxn<User> _user = Rxn<User>();
  final _box = GetStorage();
  final userState = Rx<UserState>(UserState.UNDEFINED);
  final appState = Rx<AppState>(AppState.IDLE);

  @override
  Future<void> onInit() async {
    super.onInit();
    loadUser();
  }

  Rxn<User>? get user => _user;

  Future<void> saveUser() async {
    await _box.write("user", _user);
    UserController.to.userState.value = UserState.AUTHENTICATED;
  }

  Future<void> loadUser() async {
    final data = await _box.read("user");
    final cookie = await _box.read("cookie");
    if (data != null &&
        Cookie.fromSetCookieValue(cookie as String)
            .expires!
            .isAfter(DateTime.now())) {
      _user.value = User.fromJson(data as Map<String, dynamic>);
      if (_user.value!.authenticatedItem != null) {
        userState.value = UserState.AUTHENTICATED;
      } else {
        userState.value = UserState.UNAUTHENTICATED;
      }
    }
    print(userState.value);
  }

  Future<void> fetchCurrentUser() async {
    final gql.Response response = await GqlController.to.httpClient.post(
      gql: CURRENT_USER_QUERY,
    );
    _user.value = User.fromJson(response.data!);
    if (_user.value!.authenticatedItem != null) {
      saveUser();
      ProductsController.to.getCartItems();
    }
  }

  Future<void> signOut() async {
    appState.value = AppState.LOADING;
    final gql.Response response = await GqlController.to.httpClient.post(
      gql: SIGNOUT_MUTATION,
    );

    if (response.data!["endSession"] == true) {
      await  fetchCurrentUser();
      _box.erase();
      appState.value = AppState.DONE;
      userState.value = UserState.UNAUTHENTICATED;
     // Restart.restartApp();
    }
    else{
      appState.value = AppState.ERROR;

    }
  }


}
