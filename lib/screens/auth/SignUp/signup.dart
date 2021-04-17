
import 'package:ecommerce/Screens/Auth/SignUp/signup_controller.dart';
import 'package:ecommerce/Widgets/TextFields/custom_text_field.dart';
import 'package:ecommerce/Widgets/buttons/progression_button.dart';
import 'package:ecommerce/routes/routers.dart';
import 'package:ecommerce/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isObscure=true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grey,
      body: CustomScrollView(slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Center(
            child: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/background.jpg"),
                    fit: BoxFit.cover,
                  )),
              child: Column(
                children: [
                  const Spacer(flex: 6),
                  Text(
                    'store'.tr,
                    style: Theme.of(context)
                        .textTheme
                        .headline3!
                        .copyWith(color: white),
                  ),
                  const Spacer(),
                  Text(
                    'Store_description'.tr,
                    style: Theme.of(context).textTheme.subtitle2!.copyWith(
                      color: white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const Spacer(flex: 15),
                  Obx(
                        () => CustomTextFormField(
                        hintText: 'email'.tr,
                        prefixIcon: const Icon(
                          Icons.email_outlined,
                          color: grey,
                        ),
                        onChanged: (value) =>
                            SignUpController.to.changeEmail(value),
                        textInputType: TextInputType.emailAddress,
                        errorText: SignUpController.to.isEmailValid
                            ? null
                            : 'email is not valid'),
                  ),
                  const Spacer(),
                  Obx(
                        () => CustomTextFormField(
                        hintText: 'User name'.tr,
                        prefixIcon: const Icon(
                          Icons.person,
                          color: grey,
                        ),
                        onChanged: (value) =>
                            SignUpController.to.changeName(value),
                        textInputType: TextInputType.name,
                        errorText: SignUpController.to.isNameValid
                            ? null
                            : 'email is not valid'),
                  ),
                  const Spacer(),
                  Obx(
                        () => CustomTextFormField(
                      hintText: 'password'.tr,
                      prefixIcon: const Icon(
                        Icons.lock_outline,
                        color: grey,
                      ),
                      onChanged: (value) =>
                          SignUpController.to.changePassword(value),
                      suffixIcon: IconButton(
                        icon: isObscure
                            ? const Icon(
                          Icons.remove_red_eye_outlined,
                          color: Colors.red,
                        )
                            : const Icon(
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
                      errorText: SignUpController.to.isPasswordValid
                          ? null
                          : "invalid password",
                    ),
                  ),
                  const Spacer(flex: 3),
                  Obx(
                        () => ProgressionButton(
                      idleText: "Sign Up",
                      failText: "Error",
                      function: () => SignUpController.to.isFormValid ? SignUpController.to.signUp() : () => null,
                      loadingText: "loading",
                      state: SignUpController.to.buttonState.value,
                      successText: "Succ",
                      idleIcon: const Icon(Icons.login),
                    ),
                  ),
                  const Spacer(),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('have_an_account'.tr,   style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(color: white),),
                      TextButton(
                        //todo: route to sign in
                        onPressed: () => Get.toNamed(Routers.login),
                        child: Text('sign_in_here'.tr,   style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(color: green),),
                      )
                    ],
                  ),
                  const Spacer(flex: 20),
                ],
              ),
            ),
          ),
        )
      ]),
    );
  }
}
