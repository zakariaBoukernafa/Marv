import 'package:ecommerce/theme/colors.dart';
import 'package:flutter/material.dart';

class CounterButton extends StatelessWidget {
  final Widget child;
  final Function onPressed;

  CounterButton({required this.child, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 30,
      height: 30,
      child: Container(
        child: InkWell(
            onTap: onPressed as void Function()?,
            borderRadius: BorderRadius.circular(10.0),
            splashColor: green,
            child: child),
        decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(color: grey)),
      ),
    );
  }
}
