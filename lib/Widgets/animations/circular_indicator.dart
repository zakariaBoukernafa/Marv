import 'package:ecommerce/theme/colors.dart';
import 'package:flutter/material.dart';

class CircularIndicator extends StatelessWidget {
  final Color color;

  const CircularIndicator({this.color = white});

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation<Color>(color),
      strokeWidth: 2.0,
    );
  }
}
