import 'package:ecommerce/screens/Orders/orders_contoller.dart';
import 'package:get/get.dart';

class OrdersBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<OrdersController>(OrdersController());
  }
}
