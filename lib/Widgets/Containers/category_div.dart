import 'package:flutter/material.dart';


class CategoryDiv extends StatelessWidget {
  final Widget titleText;
  final Widget expandButton;

  const CategoryDiv({required this.titleText, required this.expandButton});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        titleText,
        expandButton
      ],
    );
  }
}
