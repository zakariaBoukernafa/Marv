import 'package:ecommerce/Widgets/Appbars/app_bar.dart';
import 'package:ecommerce/routes/routers.dart';
import 'package:ecommerce/screens/products/products_controller.dart';
import 'package:ecommerce/utils/extensions/integers.dart';
import 'package:ecommerce/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class CartScreen extends StatefulWidget {
  final bool disableAppbar;

  const CartScreen({this.disableAppbar=false});

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> with SingleTickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
        width: Get.width,
        color: white,
        height: Get.height * 0.15,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                width:
                    Get.height > Get.width ? Get.width * 0.8 : Get.height * 0.8,
                child: Obx(
                  ()=> Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                          "Total of ${ProductsController.to.cartItems.length} items"),
                      Text(
                        ProductsController.to.cartCharge.value.formatMoney(),
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () async => Get.toNamed( Routers.checkout),
                child: const Text('Checkout'),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      appBar: widget.disableAppbar ? null:const CartAppBar(),
      body: Padding(
          padding: EdgeInsets.only(
              left: 16.0, right: 16.0, top: 16.0, bottom: Get.height * 0.15),
          child: Obx(
            () => AnimatedList(
              key: ProductsController.to.listKey,
              initialItemCount: ProductsController.to.cartItems.length,

              itemBuilder: (context, int index, Animation animation) {
                if(ProductsController.to.cartItems.isNotEmpty){
                  return ProductsController.to.cartItems[index];
                }
                else {
                  return Container();
                }
              },
            ),
          )),
    );
  }
}
