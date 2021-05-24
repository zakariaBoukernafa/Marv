import 'package:ecommerce/theme/colors.dart';
import 'package:flutter/material.dart';

class CircularIndicator extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation<Color>(white),
      strokeWidth: 2.0,
    );
  }
}
