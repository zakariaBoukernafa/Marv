import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ProductPreview extends StatelessWidget {
  final Widget? child;

  ProductPreview({this.child});

  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10)
      ),
      width: 300,
      child: child,

    );
  }
}
