import 'package:ecommerce/Services/format_money.dart';
import 'package:ecommerce/Widgets/Appbars/app_bar.dart';
import 'package:ecommerce/Widgets/Containers/product_preview.dart';
import 'package:ecommerce/theme/colors.dart';
import 'package:ecommerce/utils/auth_guard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'cart.dart';

class ProductScreen extends StatelessWidget {
  // ignore: type_annotate_public_apis
  final product = Get.arguments;

  @override
  Widget build(BuildContext context) {
    final TextTheme style = Theme
        .of(context)
        .textTheme;
    return Scaffold(
      appBar: appBar(
        actions: [
          Builder(
            builder: (context) =>
                IconButton(
                  icon: const Icon(CupertinoIcons.shopping_cart),
                  onPressed: () => Scaffold.of(context).openEndDrawer(),
                  tooltip: MaterialLocalizations
                      .of(context)
                      .openAppDrawerTooltip,
                ),
          ),
        ],
      ) as PreferredSizeWidget?,
      floatingActionButton: ElevatedButton(
        onPressed: () =>
            Get.to((){
              return AuthGuard(guardedItem: CartScreen(),);
            }),
        child: const Text('add To Cart'),
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
                Text(
                  FormatMoney().format(product.price! as int),
                  style: style.headline6!.copyWith(color: green),
                ),
                Text(
                  product.name! as String,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 36.0),
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
                    height: Get.height > Get.width ? Get.height * 0.6 : Get
                        .width * 0.5,
                    child: TabBarView(children: [
                      Column(
                        children: [
                          ProductPreview(
                            child: Image.network(
                              product.photo!.image!
                                  .publicUrlTransformed! as String,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(
                              width: 300,
                              child: Text(product.description! as String,
                                style: style.headline5,))

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
