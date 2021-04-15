import 'package:ecommerce/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RadioItem extends StatelessWidget {
  final RadioModel _item;

  RadioItem(this._item);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        duration: Duration(milliseconds: 300),
        height: _item.isSelected ? Get.height * 0.06 : Get.height * 0.04,
        width: Get.width * 0.25,
        curve: Curves.fastOutSlowIn,
        decoration: BoxDecoration(
          color: _item.isSelected ? green : white,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Center(
          child: Text(
            _item.text,
            style: TextStyle(color: _item.isSelected ? white : black),
          ),
        ));
  }
}

class RadioModel {
  bool isSelected;
  final String text;

  RadioModel(this.isSelected, this.text);
}
