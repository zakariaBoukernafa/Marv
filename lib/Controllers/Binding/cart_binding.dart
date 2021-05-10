import 'package:ecommerce/screens/products/products_controller.dart';
import 'package:get/get.dart';
class CartBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ProductsController>(ProductsController());

  }
}