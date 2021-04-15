import 'package:ecommerce/Screens/Auth/Login/LoginController.dart';
import 'package:ecommerce/Screens/Auth/SignUp/SignUpController.dart';
import 'package:get/get.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<LoginController>(LoginController(), permanent: true);
    Get.put<SignUpController>(SignUpController(), permanent: true);
  }
}
