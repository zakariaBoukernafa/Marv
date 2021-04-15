import 'package:ecommerce/Models/Product.dart';
import 'package:ecommerce/routes/routers.dart';
import 'package:ecommerce/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PresentationItem extends StatefulWidget {

  final Product product ;
  PresentationItem(
      {required this.product});

  @override
  _PresentationItemState createState() => _PresentationItemState();
}

class _PresentationItemState extends State<PresentationItem> {
  bool isTapped = false;

  @override
  Widget build(BuildContext context) {
    TextTheme style = Theme.of(context).textTheme;
    return Center(
      child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
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
              Get.toNamed(Routers.product,arguments: widget.product);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 1,
                  child: Column(
                    children: [
                      Flexible(
                          flex: 5,
                          child: Container(
                            child: Align(
                                alignment: Alignment.bottomLeft,
                                child: Text(
                                  widget.product.name!,
                                  style: style.headline4!.copyWith(
                                      color: isTapped ? black : green),
                                )),
                          )),
                      Flexible(
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
                    flex: 1,
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
