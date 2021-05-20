import 'package:ecommerce/Controllers/user_controller.dart';
import 'package:ecommerce/Services/format_money.dart';
import 'package:ecommerce/Widgets/Containers/product_preview.dart';
import 'package:ecommerce/Widgets/Containers/sign_popup.dart';
import 'package:ecommerce/models/product.dart';
import 'package:ecommerce/screens/products/products_controller.dart';
import 'package:ecommerce/theme/colors.dart';
import 'package:ecommerce/utils/app_state.dart';
import 'package:ecommerce/utils/auth_guard.dart';
import 'package:ecommerce/utils/user_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'cart.dart';

class ProductScreen extends StatefulWidget {
  // ignore: type_annotate_public_apis
  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  late final product;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    product = Get.arguments;
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme style = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        actions: [
          Builder(
            builder: (context) => IconButton(
              icon: const Icon(CupertinoIcons.shopping_cart),
              onPressed: () {
                    if(UserController.to.userState.value == UserState.AUTHENTICATED) {
                  Scaffold.of(context).openEndDrawer();
                }
                else{
                  Get.dialog(SignPopup());
                }
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            ),
          ),
        ],
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            );
          },
        ),
      ),
      endDrawer: const Drawer(),
      floatingActionButton: Obx(
        () => ElevatedButton(
          onPressed: () async {
            if (ProductsController.to.appState.value != AppState.LOADING) {
              await ProductsController.to.addToCart(product as Product);

              Get.to(() => AuthGuard(
                    guardedItem: CartScreen(),
                  ));
            }
          },
          child: ProductsController.to.appState.value == AppState.LOADING
              ? const CircularProgressIndicator(
                  backgroundColor: white,
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
                  tag: FormatMoney().format(product.price! as int),
                  child: Text(
                    FormatMoney().format(product.price! as int),
                    style: style.headline6!.copyWith(color: green),
                  ),
                ),
                Hero(
                  tag:product.name! as String,
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
    );
  }
}
