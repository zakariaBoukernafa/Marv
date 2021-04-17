import 'package:ecommerce/Widgets/buttons/counter_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
            flex: 4,
            child: Image.network(
              'https://pyxis.nymag.com/v1/imgs/853/030/fa9bfcf1f90e2fc68cd8a6fddb282fd1b6-men-packaged-dry-crew-neck.2x.rsquare.w600.jpg',
              fit: BoxFit.cover,
            )),
        const Spacer(),
        Flexible(
            flex: 10,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('T-shirt', style: TextStyle(fontSize: 20.0)),
                const Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Text(
                    'USD 50',
                    style: TextStyle(fontWeight: FontWeight.bold),
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
