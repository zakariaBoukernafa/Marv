import 'package:ecommerce/Controllers/gql_controller.dart';
import 'package:ecommerce/Controllers/user_controller.dart';
import 'package:ecommerce/Widgets/Containers/cart_item.dart';
import 'package:ecommerce/graphql/mutations.dart';
import 'package:ecommerce/models/cart.dart';
import 'package:ecommerce/models/product.dart';
import 'package:ecommerce/utils/app_state.dart';
import 'package:ecommerce/utils/user_state.dart';
import 'package:get/get.dart';

class ProductsController extends GetxController {
  static ProductsController get to => Get.find();

  final appState = Rx<AppState>(AppState.IDLE);
  RxList<CartItem> cartItems = RxList<CartItem>();

  RxInt cartCharge = RxInt(0);

  @override
  void onInit() {
    super.onInit();
    getCartItems();
    getCartCharge();
  }

  void getCartItems() {
    if (UserController.to.userState.value == UserState.AUTHENTICATED) {
      cartItems.assignAll(UserController
          .to.user!.value!.authenticatedItem!.cart!
          .map((cartItem) => CartItem(cartItem: cartItem as Cart)));
    }
  }

  void getCartCharge() {
    if (UserController.to.userState.value == UserState.AUTHENTICATED) {
      cartCharge.value = UserController.to.user!.value!.authenticatedItem!.cart!
          .fold(
              0,
              (num previousValue, cartItem) =>
                  previousValue + cartItem.product!.price! * cartItem.quantity!)
          .toInt();
    }
  }

  Future<void> addToCart(Product product) async {
    try {
      appState.value = AppState.LOADING;
      await GqlController.to.httpClient
          .post(gql: ADD_TO_CART_MUTATION, variables: {
        "id": product.id!.toString(),
      });

      appState.value = AppState.DONE;
      await UserController.to.fetchCurrentUser();
    } catch (e) {
      print(e);
    }
  }
  Future<void> deleteFromCart(String id) async {
    try {
      appState.value = AppState.LOADING;
      await GqlController.to.httpClient
          .post(gql: DELETE_PRODUCT_FROM_CART, variables: {
        "id": id.toString(),
      });

      appState.value = AppState.DONE;
      await UserController.to.fetchCurrentUser();
    } catch (e) {
      print(e);
    }
  }
}
