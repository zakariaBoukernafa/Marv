import 'package:ecommerce/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PrimaryButton extends StatelessWidget {
  final Function onPressed;
  final Widget child;
  final BorderRadius? radius;
  final width,height;
  PrimaryButton({Key? key,required this.onPressed, required this.child, this.radius,this.width ,this.height});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0,horizontal: 16),

      child: MaterialButton(
          color: Theme.of(context).accentColor,
          minWidth: width,
          height: height,
          textColor: white,
          shape:  RoundedRectangleBorder(
          borderRadius: radius!
    ),
          onPressed: onPressed as void Function()?, child: child),
    );
  }
}
