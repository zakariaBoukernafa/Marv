import 'package:ecommerce/Widgets/TextFields/CustomTextField.dart';
import 'package:ecommerce/Widgets/buttons/ProgressionButton.dart';
import 'package:ecommerce/routes/routers.dart';
import 'package:ecommerce/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/Screens/Auth/Login/LoginController.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grey,
      body: CustomScrollView(slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage("assets/background.jpg"),
                fit: BoxFit.cover,
              )),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Spacer(flex: 6),
                  Text(
                    'store'.tr,
                    style: Theme.of(context)
                        .textTheme
                        .headline3!
                        .copyWith(color: white),
                  ),
                  Spacer(flex: 1),
                  Text(
                    'Store_description'.tr,
                    style: Theme.of(context).textTheme.subtitle2!.copyWith(
                          color: white,
                        ),
                    textAlign: TextAlign.center,
                  ),
                  Spacer(flex: 15),
                  Obx(
                    () => CustomTextFormField(
                        hintText: 'email'.tr,
                        prefixIcon: Icon(
                          Icons.email_outlined,
                          color: grey,
                        ),
                        onChanged: (value) =>
                            LoginController.to.changeEmail(value),
                        textInputType: TextInputType.emailAddress,
                        errorText: LoginController.to.isEmailValid
                            ? null
                            : 'email is not valid'),
                  ),
                  Spacer(flex: 1),
                  Obx(
                    () => CustomTextFormField(
                      hintText: 'password'.tr,
                      prefixIcon: Icon(
                        Icons.lock_outline,
                        color: grey,
                      ),
                      onChanged: (value) =>
                          LoginController.to.changePassword(value),
                      suffixIcon: IconButton(
                        icon: isObscure
                            ? Icon(
                                Icons.remove_red_eye_outlined,
                                color: Colors.red,
                              )
                            : Icon(
                                Icons.remove_red_eye_outlined,
                                color: green,
                              ),
                        onPressed: () {
                          setState(() {
                            isObscure = !isObscure;
                          });
                        },
                      ),
                      obscureText: isObscure,
                      errorText: LoginController.to.isPasswordValid
                          ? null
                          : "invalid password",
                    ),
                  ),
                  Spacer(flex: 3),
                  Obx(
                    () => ProgressionButton(
                      idleText: "Sign in",
                      failText: "Error",
                      function: LoginController.to.isFormValid
                          ? () => LoginController.to.signIn()
                          : () => null,
                      loadingText: "loading",
                      state: LoginController.to.buttonState.value,
                      successText: "Succ",
                      idleIcon: Icon(Icons.login),
                    ),
                  ),
                  Spacer(flex: 1),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'dont_have_an_account'.tr,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2!
                            .copyWith(color: white),
                      ),
                      TextButton(
                        onPressed: () => Get.toNamed(Routers.signUp),
                        child: Text(
                          'sign_up_here'.tr,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(color: green),
                        ),
                      )
                    ],
                  ),
                  Spacer(flex: 20),
                ],
              ),
            ),
          ),
        )
      ]),
    );
  }
}
