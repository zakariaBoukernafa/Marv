import 'package:ecommerce/Widgets/Appbars/app_bar.dart';
import 'package:ecommerce/Widgets/drawers/cart_drawer.dart';
import 'package:ecommerce/models/orders.dart';
import 'package:ecommerce/models/product.dart';
import 'package:ecommerce/routes/routers.dart';
import 'package:ecommerce/screens/Home/dashboard/dashboard_controller.dart';
import 'package:ecommerce/screens/Orders/orders_contoller.dart';
import 'package:ecommerce/utils/extensions/integers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrdersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextTheme style = Theme.of(context).textTheme;

    return SafeArea(
      child: Scaffold(
        appBar: const CartAppBar(),
        endDrawer: CartDrawer(),
        body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Obx(() => ListView.builder(
                itemCount: OrdersController.to.allOrders.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 16.0),
                    child: Material(
                      elevation: 2.0,
                      child: SizedBox(
                        width: Get.height * 0.8,
                        child: Column(
                          children: [
                            DataTable(
                              headingRowHeight: 0,
                              columns: const [
                                DataColumn(label: Text("")),
                                DataColumn(label: Text(""))
                              ],
                              rows: [
                                DataRow(cells: [
                                  const DataCell(Text("Order ID")),
                                  DataCell(Text(
                                      OrdersController.to.allOrders[index].id!))
                                ]),
                                DataRow(cells: [
                                  const DataCell(Text("Charge")),
                                  DataCell(Text(OrdersController
                                      .to.allOrders[index].charge!))
                                ]),
                                DataRow(cells: [
                                  const DataCell(Text("Order total")),
                                  DataCell(Text(OrdersController
                                      .to.allOrders[index].total!
                                      .formatMoney()))
                                ]),
                                DataRow(cells: [
                                  const DataCell(Text("Item count")),
                                  DataCell(Text(OrdersController
                                      .to.allOrders[index].items!.length
                                      .toString()))
                                ]),
                              ],
                            ),
                            ListView.builder(
                                itemCount: OrdersController
                                    .to.allOrders[index].items!.length,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, idx) {
                                  final Item item = OrdersController
                                      .to.allOrders[index].items![idx];
                                  final int? price = item.price as int?;
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: InkWell(
                                      onTap:()async {
                                        print(item.id);
                                        final Product? product = await DashboardController.to.getSingleProduct(id: item.id!);
                                        print(product!.price);
                                        Get.toNamed(Routers.product,arguments: product);
                                      },
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Flexible(
                                              flex: 6,
                                              child: SizedBox(
                                                width: 150,
                                                child: Image.network(item
                                                    .photo!
                                                    .image!
                                                    .publicUrlTransformed!),
                                              )),
                                          const Spacer(),
                                          Flexible(
                                              flex: 4,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    item.name!,
                                                    style: style.headline5,
                                                  ),
                                                  Text("Qty:${item.quantity}"),
                                                  Text(
                                                      "Each:${price?.formatMoney() ?? ""}"),
                                                  Text(
                                                      "Sub total:${price ?? 0 * item.quantity!}"),
                                                  Text(item.description!),
                                                ],
                                              )),
                                        ],
                                      ),
                                    ),
                                  );
                                })
                          ],
                        ),
                      ),
                    ),
                  );
                }))),
      ),
    );
  }
}
