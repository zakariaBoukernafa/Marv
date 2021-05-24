import 'package:ecommerce/screens/Home/dashboard/dashboard_controller.dart';
import 'package:get/get.dart';
class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<DashboardController>(DashboardController(), permanent: true);

  }
}