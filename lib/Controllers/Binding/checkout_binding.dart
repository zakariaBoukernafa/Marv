import 'package:ecommerce/screens/payment/checkout_controller.dart';
import 'package:get/get.dart';
class CheckoutBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<CheckoutController>(CheckoutController(),permanent: true);

  }
}