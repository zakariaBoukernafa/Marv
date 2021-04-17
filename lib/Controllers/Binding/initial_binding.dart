import 'package:ecommerce/Controllers/gql_controller.dart';
import 'package:ecommerce/Controllers/user_controller.dart';
import 'package:get/get.dart';



class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<GqlController>(GqlController(), permanent: true);
    Get.put<UserController>(UserController(), permanent: true);

  }}