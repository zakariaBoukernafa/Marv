import 'package:ecommerce/Controllers/user_controller.dart';
import 'package:ecommerce/Widgets/Containers/sign_popup.dart';
import 'package:ecommerce/utils/user_state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> openCartDrawer(BuildContext? context) async {
  if (UserController.to.userState.value == UserState.AUTHENTICATED) {
    try {
      Scaffold.of(context!).openEndDrawer();
    }catch(e){
      print(e);
    }
  } else {
    Get.dialog(SignPopup());
  }
}
