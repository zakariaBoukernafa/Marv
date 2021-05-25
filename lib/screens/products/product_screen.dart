import 'package:ecommerce/Controllers/user_controller.dart';
import 'package:ecommerce/utils/extensions/integers.dart';
import 'package:ecommerce/Widgets/Appbars/app_bar.dart';
import 'package:ecommerce/Widgets/Containers/product_preview.dart';
import 'package:ecommerce/Widgets/Containers/sign_popup.dart';
import 'package:ecommerce/Widgets/animations/circular_indicator.dart';
import 'package:ecommerce/Widgets/drawers/cart_drawer.dart';
import 'package:ecommerce/models/product.dart';
import 'package:ecommerce/screens/products/products_controller.dart';
import 'package:ecommerce/theme/colors.dart';
import 'package:ecommerce/utils/app_state.dart';
import 'package:ecommerce/utils/cart_drawer_guard.dart';
import 'package:ecommerce/utils/user_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ProductScreen extends StatefulWidget {
  // ignore: type_annotate_public_apis
  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // ignore: type_annotate_public_apis
  late final product;
  int? productPrice;

  @override
  void initState() {

    super.initState();
    product = Get.arguments;
    productPrice = product!.price as int;
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme style = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        appBar: const CartAppBar(),
        endDrawer: CartDrawer(),
        floatingActionButton: Obx(
          () => ElevatedButton(
            onPressed: () async {
              if (UserController.to.userState.value != UserState.AUTHENTICATED) {
              return  Get.dialog(SignPopup());
              }
              if (ProductsController.to.appState.value != AppState.LOADING) {
                await ProductsController.to
                    .addToCart(product as Product, cartKey: _scaffoldKey);
              }
            },
            child: ProductsController.to.appState.value == AppState.LOADING
                ?  CircularIndicator(
                  )
                : const Text('add To Cart'),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: DefaultTabController(
              length: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Hero(
                    tag: productPrice!.formatMoney(),
                    child: Text(
                      productPrice!.formatMoney(),
                      style: style.headline6!.copyWith(color: green),
                    ),
                  ),
                  Hero(
                    tag: product.name! as String,
                    child: Material(
                      child: Text(
                        product.name! as String,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 36.0),
                      ),
                    ),
                  ),
                  const TabBar(
                      indicatorPadding: EdgeInsets.symmetric(horizontal: 40),
                      tabs: [
                        Tab(
                          text: "Overview",
                        ),
                        Tab(text: "Features"),
                        Tab(text: "Specification"),
                      ]),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: SizedBox(
                      //Add this to give height
                      height: Get.height > Get.width
                          ? Get.height * 0.6
                          : Get.width * 0.5,
                      child: TabBarView(children: [
                        Column(
                          children: [
                            Hero(
                              tag: product.photo!.image!.publicUrlTransformed!
                                  as String,
                              child: ProductPreview(
                                child: Image.network(
                                  product.photo!.image!.publicUrlTransformed!
                                      as String,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(
                                width: 300,
                                child: Text(
                                  product.description! as String,
                                  style: style.headline5,
                                ))
                          ],
                        ),
                        const Text("Articles Body"),
                        const Text("User Body"),
                      ]),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
