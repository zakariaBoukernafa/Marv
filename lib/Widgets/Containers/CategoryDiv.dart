import 'package:flutter/material.dart';


class CategoryDiv extends StatelessWidget {
  Widget titleText;
  Widget expandButton;

  CategoryDiv({required this.titleText, required this.expandButton});

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
