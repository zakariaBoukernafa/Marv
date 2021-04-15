import 'package:ecommerce/Controllers/GqlController.dart';
import 'package:ecommerce/Controllers/UserController.dart';
import 'package:get/get.dart';



class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<GqlController>(GqlController(), permanent: true);
    Get.put<UserController>(UserController(), permanent: true);

  }}