import 'package:ecommerce/Screens/Home/Dashboard/DashboardController.dart';
import 'package:get/get.dart';
class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<DashboardController>(DashboardController(), permanent: true);

  }
}