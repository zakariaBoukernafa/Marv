import 'package:ecommerce/routes/routers.dart';
import 'package:ecommerce/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignPopup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextTheme style = Theme.of(context).textTheme;

    return AlertDialog(
        titlePadding: const EdgeInsets.all(16.0),
        title: Center(
          child: Column(
            children: [
               Placeholder(fallbackHeight: Get.height*0.15,fallbackWidth: 10,),
              Text(
                'Get your goods,\nRight now.',
                style: style.headline4,
              ),
            ],
          ),
        ),
        content: SingleChildScrollView(
          child: ListBody(
           children: <Widget>[
              ElevatedButton(
                  onPressed: () async => Get.toNamed(Routers.signUp),
                  child: const Text("SIGN UP FREE")),
              Row(children: <Widget>[
                Expanded(
                  child: Container(
                      margin: const EdgeInsets.only(left: 10.0, right: 20.0),
                      child: const Divider(
                        color: Colors.black,
                        height: 36,
                      )),
                ),
                SizedBox(height: Get.height*0.12,),
                const Text("HAVE AN ACCOUNT?"),
                Expanded(
                  child: Container(
                      margin: const EdgeInsets.only(left: 20.0, right: 10.0),
                      child: const Divider(
                        color: Colors.black,
                        height: 36,
                      )),
                ),
              ]),
              ElevatedButton(
                  onPressed: () async => Get.toNamed(Routers.login),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(black),

                ),
                  child: const Text("LOG IN"),
              ),
            ],
          ),
        ));
  }
}
