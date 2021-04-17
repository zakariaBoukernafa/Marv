import 'package:ecommerce/Screens/Auth/Login/login_controller.dart';
import 'package:ecommerce/Screens/Auth/SignUp/signup_controller.dart';
import 'package:get/get.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<LoginController>(LoginController(), permanent: true);
    Get.put<SignUpController>(SignUpController(), permanent: true);
  }
}
