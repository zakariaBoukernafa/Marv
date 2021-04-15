import 'package:ecommerce/theme/Styles.dart';
import 'package:ecommerce/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SearchTextField extends StatelessWidget {
  final TextEditingController myController = TextEditingController();
  final bool filled;
  final Color fillColor;
  final FormFieldValidator<String>? validator;
  final String? errorText;
  final String? initialValue;
  final TextEditingController? controller;
  final int maxLines;
  final List<TextInputFormatter>? inputFormatter;
  final AutovalidateMode autoValidateMode;
  final String? hintText;
  final TextInputAction? textInputAction;
  final Widget? suffix;
  final Widget? prefix;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? labelText;

  SearchTextField({this.filled = true,
    this.labelText,
    this.fillColor = white,
    this.validator,
    this.errorText,
    this.initialValue,
    this.controller,
    this.maxLines = 1,
    this.inputFormatter,
    this.autoValidateMode = AutovalidateMode.disabled,
    this.hintText,
    this.textInputAction,
    this.suffix,
    this.prefix,
    this.prefixIcon,
    this.suffixIcon,});

  @override
  Widget build(BuildContext context) {
    const label = "Some Label";
    const dummyList = ['Item 1', 'Item 2', 'Item 3', 'Item 4', 'Item 5'];

    return  TextField( controller: myController,decoration: InputDecoration(
      filled: filled,
      fillColor: fillColor,
      prefix: prefix,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      suffix: suffix,
      hintText: hintText,
      errorText: errorText,
      labelText: labelText,
      hintStyle: inputFieldHintTextStyle,
      focusedBorder: inputFieldFocusedBorderStyle,
      contentPadding: EdgeInsets.symmetric(horizontal: 18, vertical: 18),
      enabledBorder: inputFieldDefaultBorderStyle,
    ),);
  }
}
