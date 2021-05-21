import 'package:ecommerce/Controllers/user_controller.dart';
import 'package:ecommerce/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDrawerHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextTheme style = Theme.of(context).textTheme;

    return Obx(() => Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CircleAvatar(
            radius: 50.0,
            backgroundColor: green,
            child: Icon(CupertinoIcons.person_fill,color: white,size: 50.0,),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            UserController.to.user!.value!.authenticatedItem!.name!,
            style: style.headline4,
          )
        ],
      ),
    ));
  }
}
