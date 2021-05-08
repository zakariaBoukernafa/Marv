import 'package:ecommerce/Controllers/user_controller.dart';
import 'package:ecommerce/Widgets/Containers/cart_item.dart';
import 'package:ecommerce/models/cart.dart';
import 'package:get/get.dart';

class ProductsController extends GetxController {
  static ProductsController get to => Get.find();
  RxList<CartItem> cartItems = RxList<CartItem>();
  RxInt cartCharge = RxInt(0);
  @override
  void onInit() {
    super.onInit();
    getCartItems();
    getCartCharge();
  }

  void getCartItems() {
    cartItems.assignAll(UserController.to.user!.value!.authenticatedItem!.cart!
        .map((cartItem) => CartItem(cartItem: cartItem as Cart)));
  }

  void getCartCharge() {
    cartCharge.value = UserController.to.user!.value!.authenticatedItem!.cart!
        .fold(
            0,
            (num previousValue, cartItem) =>
                previousValue + cartItem.product!.price! * cartItem.quantity!)
        .toInt();
  }


}
