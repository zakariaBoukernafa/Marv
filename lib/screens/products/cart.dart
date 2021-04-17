import 'package:ecommerce/Widgets/Appbars/app_bar.dart';
import 'package:ecommerce/Widgets/Containers/cart_item.dart';
import 'package:ecommerce/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
        width: Get.width,
        color: white,
        height: 100,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                width: Get.height> Get.width ? Get.width*0.8 :Get.height*0.8,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                     Text("Total of 2 items"),
                     Text('USD 260',style:  TextStyle(fontWeight: FontWeight.bold),)
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () => null,
                child: const Text('add To Cart'),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
      appBar: appBar(
        title: const Text('Shopping Cart', style: TextStyle(color: black)),
        actions: [
          Builder(
            builder: (context) => IconButton(
              icon: const Icon(CupertinoIcons.trash),
              onPressed: () => Scaffold.of(context).openEndDrawer(),
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            ),
          ),
        ],
      ) as PreferredSizeWidget?,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              CartItem(),
              CartItem(),
              CartItem(),
              CartItem(),
              CartItem(),
              CartItem(),
              CartItem(),
            ],
          ),
        ),
      ),
    );
  }
}
