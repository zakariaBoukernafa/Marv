import 'package:ecommerce/utils/cart_drawer_guard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class CartAppBar extends StatelessWidget implements PreferredSizeWidget{
  final Widget? title;
  final bool overrideBackButton;
  const CartAppBar({this.title,this.overrideBackButton = true});

  @override
  Widget build(BuildContext context) {

    return AppBar(
      title: title,
      actions: [
        Builder(
          builder: (context) => IconButton(
            icon: const Icon(CupertinoIcons.shopping_cart),
            onPressed: () {
              openCartDrawer(context);
            },
            tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          ),
        ),
      ],
      leading: overrideBackButton ? Builder(
        builder: (BuildContext context) {
          return IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          );
        },
      ): null
    );
  }

  @override
  Size get preferredSize {
    return const Size.fromHeight(kToolbarHeight);
  }
}
