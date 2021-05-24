import 'package:ecommerce/Controllers/user_controller.dart';
import 'package:ecommerce/Widgets/Containers/sign_popup.dart';
import 'package:ecommerce/utils/user_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'drawer_header.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextTheme style = Theme
        .of(context)
        .textTheme;


    return Drawer(
        child: Obx(() {
           final bool userState = UserController.to.userState.value ==
              UserState.AUTHENTICATED;
          return ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              if (userState) CustomDrawerHeader() else
                SizedBox(height: Get.height * 0.1,),
              ListTile(
                leading: const Icon(Icons.person),
                title: Text(
                  'Profile',
                  style: style.headline6,
                ),
                onTap: () {
                  if (!userState) {
                    Get.dialog(SignPopup());
                  }
                },
              ),

              ListTile(
                leading: const Icon(Icons.message_outlined),
                title: Text(
                  'Messages',
                  style: style.headline6,
                ),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(CupertinoIcons.list_bullet_below_rectangle),
                title: Text(
                  'Orders',
                  style: style.headline6,
                ),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(CupertinoIcons.settings),
                title: Text(
                  'Settings',
                  style: style.headline6,
                ),
                onTap: () {},
              ),
              if(userState) ListTile(
                leading: const Icon(CupertinoIcons.arrow_right_square),
                title: Text(
                  'Sign Out',
                  style: style.headline6,
                ),
                onTap: () async {
                  await UserController.to.signOut();
                },
              ),
            ],
          );
        })
    );
  }
}
