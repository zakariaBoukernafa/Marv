
import 'package:ecommerce/Controllers/Binding/AuthBinding.dart';
import 'package:ecommerce/Controllers/Binding/DashboardBinding.dart';
import 'package:ecommerce/Screens/Auth/Login/Login.dart';
import 'package:ecommerce/Screens/Auth/SignUp/SignUp.dart';
import 'package:ecommerce/Screens/Home/Home.dart';
import 'package:ecommerce/Screens/Products/Cart.dart';
import 'package:ecommerce/Screens/Products/Product.dart';

import 'package:ecommerce/routes/routers.dart';
import 'package:get/get.dart';

class Pages {
  static List<GetPage> getPages = [
    //todo : change to home
    GetPage(name: Routers.initialRoute, page: () => LoginScreen()),
    GetPage(name: Routers.home, page: () => Home(),binding: DashboardBinding(),),
    GetPage(
      name: Routers.login,
      page: () => LoginScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
        name: Routers.signUp,
        page: () => SignUpScreen(),
        binding: AuthBinding()),
    GetPage(name: Routers.product, page: () => ProductScreen()),
    GetPage(name: Routers.cart, page: () => CartScreen())
  ];
}
