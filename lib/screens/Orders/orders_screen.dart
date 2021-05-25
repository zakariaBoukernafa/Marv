import 'package:ecommerce/Widgets/Appbars/app_bar.dart';
import 'package:ecommerce/Widgets/Containers/order.dart';
import 'package:ecommerce/Widgets/animations/circular_indicator.dart';
import 'package:ecommerce/Widgets/drawers/cart_drawer.dart';
import 'package:ecommerce/screens/Orders/orders_contoller.dart';
import 'package:ecommerce/theme/colors.dart';
import 'package:ecommerce/utils/app_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrdersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CartAppBar(
          title: Text("My Orders"),
        ),
        endDrawer: CartDrawer(),
        body: Padding(
            padding: const EdgeInsets.all(8.0),
            child:
                Obx(() => OrdersController.to.appState.value == AppState.LOADING
                    ? const Center(
                        child: CircularIndicator(
                        color: green,
                      ))
                    : OrdersController.to.allOrders.isNotEmpty
                        ? ListView.builder(
                            itemCount: OrdersController.to.allOrders.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return Order(
                                order: OrdersController.to.allOrders[index],
                              );
                            })
                        : const Center(
                            child: Text("You have no Orders :)"),
                          ))),
      ),
    );
  }
}
