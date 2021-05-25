import 'package:ecommerce/models/orders.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/utils/extensions/integers.dart';

class OrderItem extends StatelessWidget {
  final Item item;

  const OrderItem({required this.item});

  @override
  Widget build(BuildContext context) {
    final int? price = item.price as int?;

    final TextTheme style = Theme.of(context).textTheme;
    return  Padding(
      padding: const EdgeInsets.all(8.0),
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
    );
  }
}
