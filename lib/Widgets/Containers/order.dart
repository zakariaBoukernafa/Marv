import 'package:ecommerce/models/orders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/utils/extensions/integers.dart';

import 'order_item.dart';

class Order extends StatelessWidget {
    final AllOrder order;

    const Order({required this.order});

  @override
  Widget build(BuildContext context) {
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
                        order.id!))
                  ]),
                  DataRow(cells: [
                    const DataCell(Text("Charge")),
                    DataCell(Text(order.charge!))
                  ]),
                  DataRow(cells: [
                    const DataCell(Text("Order total")),
                    DataCell(Text(order.total!
                        .formatMoney()))
                  ]),
                  DataRow(cells: [
                    const DataCell(Text("Item count")),
                    DataCell(Text(order.items!.length
                        .toString()))
                  ]),
                ],
              ),
              ListView.builder(
                  itemCount: order.items!.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, idx) {
                    return OrderItem(
                        item: order.items![idx]);
                  })
            ],
          ),
        ),
      ),
    );
  }
}
