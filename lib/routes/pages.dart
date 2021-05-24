import 'package:ecommerce/Controllers/Binding/auth_binding.dart';
import 'package:ecommerce/Controllers/Binding/cart_binding.dart';
import 'package:ecommerce/Controllers/Binding/checkout_binding.dart';
import 'package:ecommerce/Controllers/Binding/dashboard_binding.dart';
import 'package:ecommerce/Screens/Auth/Login/login.dart';
import 'package:ecommerce/Screens/Auth/SignUp/signup.dart';
import 'package:ecommerce/Screens/Home/home.dart';
import 'package:ecommerce/Screens/Products/cart.dart';
import 'package:ecommerce/Screens/Products/product_screen.dart';
import 'package:ecommerce/routes/routers.dart';
import 'package:ecommerce/screens/payment/checkout.dart';
import 'package:get/get.dart';

// ignore: avoid_classes_with_only_static_members
class Pages {
  static List<GetPage> getPages = [
    //todo : change to home
    GetPage(name: Routers.initialRoute, page: () => LoginScreen()),
    GetPage(
      name: Routers.home,
      page: () => Home(),
      bindings: [DashboardBinding(),CartBinding(),],
    ),
    GetPage(
      name: Routers.login,
      page: () => LoginScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
        name: Routers.signUp,
        page: () => SignUpScreen(),
        binding: AuthBinding()),
    GetPage(
      name: Routers.product,
      page: () => ProductScreen(),
      binding: AuthBinding()
    ),
    GetPage(
      name: Routers.cart,
      page: () => const CartScreen(),

    ),
    GetPage(
      name: Routers.checkout,
      page: () => CheckoutScreen(),
      binding: CheckoutBinding(),
    ),
  ];
}
