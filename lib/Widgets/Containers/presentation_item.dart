import 'package:ecommerce/models/product.dart';
import 'package:ecommerce/routes/routers.dart';
import 'package:ecommerce/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PresentationItem extends StatefulWidget {
  final Product product;

  const PresentationItem({required this.product});

  @override
  _PresentationItemState createState() => _PresentationItemState();
}

class _PresentationItemState extends State<PresentationItem> {
  bool isTapped = false;

  @override
  Widget build(BuildContext context) {
    final TextTheme style = Theme.of(context).textTheme;
    return Center(
      child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: 400,
          height: Get.height * 0.3,
          child: GestureDetector(
            onTapDown: (details) {
              setState(() {
                isTapped = false;
              });
            },
            onTapUp: (details) {
              setState(() {
                isTapped = true;
              });
              Get.toNamed(Routers.product, arguments: widget.product);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Column(
                    children: [
                      Flexible(
                          flex: 5,
                          child: Align(
                              alignment: Alignment.bottomLeft,
                              child: Hero(
                                tag: widget.product.name!,
                                child: Material(
                                  child: Text(
                                    widget.product.name!,
                                    style: style.headline4!.copyWith(
                                        color: isTapped ? black : green),
                                  ),
                                ),
                              ))),
                      const Flexible(
                          flex: 4,
                          child: Align(
                              alignment: Alignment.topCenter,
                              child: Text(
                                'Shop now!',
                                style: TextStyle(color: green),
                              )))
                    ],
                  ),
                ),
                Flexible(
                    child: Image.network(
                  widget.product.photo!.image!.publicUrlTransformed!,
                  fit: BoxFit.cover,
                ))
              ],
            ),
          )),
    );
  }
}
