import 'package:ecommerce/screens/products/cart.dart';
import 'package:flutter/material.dart';

class CartDrawer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return const Drawer(
      child: CartScreen(disableAppbar: true,),
    );
  }
}
