import 'package:ecommerce/Controllers/user_controller.dart';
import 'package:ecommerce/screens/auth/login/login.dart';
import 'package:ecommerce/utils/user_state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthGuard extends StatelessWidget {
  final Widget guardedItem;

  const AuthGuard({Key? key, required this.guardedItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() =>
        (UserController.to.userState.value == UserState.AUTHENTICATED)
            ? guardedItem
            : LoginScreen());
  }
}
