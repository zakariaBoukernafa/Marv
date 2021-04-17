import 'package:ecommerce/theme/themes.dart';
import 'package:ecommerce/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final inputFieldHintTextStyle =
    Themes.light.textTheme.bodyText2!.copyWith(color: grey);

final inputFieldTextStyle = Themes.light.textTheme.bodyText2;


final inputFieldFocusedBorderStyle = OutlineInputBorder(
  borderRadius: BorderRadius.circular(10.0),
  borderSide: const  BorderSide(
    color: green,
  ),
);

final inputFieldDefaultBorderStyle = OutlineInputBorder(
  borderRadius: BorderRadius.circular(10.0),
  borderSide: const BorderSide(
    color: grey,
  ),


);
