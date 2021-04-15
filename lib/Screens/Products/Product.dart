import 'package:ecommerce/Models/Product.dart';
import 'package:ecommerce/Services/FormatMoney.dart';
import 'package:ecommerce/Widgets/Appbars/AppBar.dart';
import 'package:ecommerce/Widgets/Containers/ProductPreview.dart';
import 'package:ecommerce/routes/routers.dart';
import 'package:ecommerce/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money2/money2.dart';

class ProductScreen extends StatelessWidget {
  final Product product = Get.arguments;

  @override
  Widget build(BuildContext context) {
    TextTheme style = Theme.of(context).textTheme;
    return Scaffold(
      appBar: appBar(
        actions: [
          Builder(
            builder: (context) => IconButton(
              icon: Icon(CupertinoIcons.shopping_cart),
              onPressed: () => Scaffold.of(context).openEndDrawer(),
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            ),
          ),
        ],
      ) as PreferredSizeWidget?,
      floatingActionButton: ElevatedButton(
        onPressed: () => Get.toNamed(Routers.cart),
        child: Text('add To Cart'),
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
                  FormatMoney().format( product.price!),
                  style: style.headline6!.copyWith(color: green),
                ),
                Text(
                  product.name!,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 36.0),
                ),
                TabBar(
                    indicatorPadding: EdgeInsets.symmetric(horizontal: 40),
                    tabs: [
                      Tab(
                        text: "Overview",
                      ),
                      Tab(text: "Features"),
                      Tab(text: "Specification"),
                    ]),
                Padding(
                  padding: const EdgeInsets.only(top:16.0),
                  child: Container(
                    //Add this to give height
                    height: Get.height> Get.width ? Get.height*0.6: Get.width*0.5,
                    child: TabBarView(children: [
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ProductPreview(
                              child: Image.network(
                                product.photo!.image!.publicUrlTransformed!,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Container(
                              width: 300,
                                child: Text(product.description!,style: style.headline5,))

                          ],
                        ),
                      ),
                      Container(
                        child: Text("Articles Body"),
                      ),
                      Container(
                        child: Text("User Body"),
                      ),
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
