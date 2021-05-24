import 'package:ecommerce/Controllers/gql_controller.dart';
import 'package:ecommerce/Controllers/user_controller.dart';
import 'package:ecommerce/Widgets/Containers/cart_item.dart';
import 'package:ecommerce/Widgets/animations/slide_animation.dart';
import 'package:ecommerce/graphql/mutations.dart';
import 'package:ecommerce/graphql/queries.dart';
import 'package:ecommerce/models/cart.dart';
import 'package:ecommerce/models/product.dart';
import 'package:ecommerce/utils/app_state.dart';
import 'package:ecommerce/utils/cart_drawer_guard.dart';
import 'package:ecommerce/utils/user_state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductsController extends GetxController {
  static ProductsController get to => Get.find();

  final appState = Rx<AppState>(AppState.IDLE);
  RxList<CartItem> cartItems = RxList<CartItem>();

  final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();

  RxInt cartCharge = RxInt(0);

  @override
  void onInit() {
    super.onInit();
    getCartItems();
  }

  void getCartItems() {
    if (UserController.to.userState.value == UserState.AUTHENTICATED) {
      print("getting cart items");

      cartItems.assignAll(UserController
          .to.user!.value!.authenticatedItem!.cart!
          .map((cartItem) => CartItem(
              cartItem: cartItem,
              index: UserController.to.user!.value!.authenticatedItem!.cart!
                  .indexOf(cartItem))));
      getCartCharge();
    }
  }

  void getCartCharge() {
    cartCharge.value = UserController.to.user!.value!.authenticatedItem!.cart!
        .fold(
            0,
            (num previousValue, cartItem) =>
                previousValue + cartItem.product!.price! * cartItem.quantity!)
        .toInt();
  }

  int getCartItemTotalPrice(Cart cartItem) {
    return cartItem.quantity! * cartItem.product!.price!;
  }

  Future<void> addToCart(Product product,{GlobalKey<ScaffoldState>? cartKey}) async {
    try {
      appState.value = AppState.LOADING;
      await GqlController.to.httpClient
          .post(gql: ADD_TO_CART_MUTATION, variables: {
        "id": product.id!.toString(),
      });
      await UserController.to.fetchCurrentUser();
      cartKey!.currentState!.openEndDrawer();

      appState.value = AppState.DONE;

    } catch (e) {
      print(e);
    }
  }

  Future<void> deleteFromCart(String id, int index) async {
    try {
      appState.value = AppState.LOADING;
      cartCharge.value -= getCartItemTotalPrice(cartItems[index].cartItem);
      listKey.currentState!.removeItem(
          index,
          (context, animation) => slidAnimation(
              context: context, animation: animation, child: cartItems[index]),
          duration: const Duration(milliseconds: 200));

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
  Future<List<Product>> searchProducts({required String searchTerm}) async {

    final List<Product> products = [];

    try {
      appState.value = AppState.LOADING;
      final res = await GqlController.to.httpClient.post(
        gql: SEARCH_PRODUCTS_QUERY,
        variables: {
          "searchTerm": searchTerm,
        },
      );

      final dynamic productsList = res.data!["searchTerms"];
      productsList.forEach((element) {
        products.add(Product.fromJson(element as Map<String, dynamic>));
      });
      appState.value = AppState.DONE;
      return products;

    } catch (e) {
      //todo: remove on production
      print(e);
    }
    return [];
  }
}
