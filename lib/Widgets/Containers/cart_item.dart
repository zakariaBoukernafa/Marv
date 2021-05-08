import 'package:ecommerce/Services/format_money.dart';
import 'package:ecommerce/Widgets/buttons/counter_button.dart';
import 'package:ecommerce/models/cart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  final Cart cartItem;

  const CartItem({ required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
            flex: 4,
            child: Image.network(
              cartItem.product!.photo!.image!.publicUrlTransformed!,
              fit: BoxFit.cover,
            )),
        const Spacer(),
        Flexible(
            flex: 10,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Text(cartItem.product!.name!, style: const TextStyle(fontSize: 20.0)),
                 Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    FormatMoney().format(cartItem.product!.price!),
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 100,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CounterButton(
                              onPressed: () => null,
                              child: const Icon(
                                CupertinoIcons.minus,
                                size: 20,
                              ),
                            ),
                            //todo: add functionality
                            const Text('1'),
                            CounterButton(
                              onPressed: () => null,
                              child: const Icon(
                                CupertinoIcons.plus,
                                size: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                      IconButton(

                          onPressed: () => null,
                        icon: const Icon(
                          CupertinoIcons.trash,
                          size: 20.0,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ))
      ],
    );
  }
}
