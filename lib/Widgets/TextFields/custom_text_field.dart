

import 'package:ecommerce/theme/styles.dart';
import 'package:ecommerce/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class CustomTextFormField extends StatelessWidget {
  final String? labelText;
  final Function? onTap;
  final ValueChanged<String>? onChanged;
  final Function? onEditingComplete;
  final bool obscureText;
  final bool filled;
  final Color fillColor;
  final TextInputType? textInputType;
  final Function(String?)? onSaved;
  final bool autoCorrect;
  final FormFieldValidator<String>? validator;
  final String? errorText;
  final String? initialValue;
  final TextEditingController? controller;
  final int maxLines;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatter;
  final AutovalidateMode autoValidateMode;
  final String? hintText;
  final TextInputAction? textInputAction;
  final Widget? suffix;
  final FocusNode? focusNode;
  final Widget? prefix;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  const CustomTextFormField({
    Key? key,
    this.labelText,
    this.onTap,
    this.onChanged,
    this.onEditingComplete,
    this.textInputType,
    this.onSaved,
    this.autoCorrect = false,
    this.obscureText = false,
    this.filled = true,
    this.fillColor = white,
    this.validator,
    this.errorText,
    this.initialValue,
    this.controller,
    this.maxLines = 1,
    this.maxLength,
    this.inputFormatter,
    this.autoValidateMode = AutovalidateMode.disabled,
    this.hintText,
    this.textInputAction,
    this.suffix,
    this.focusNode,
    this.prefix,
    this.prefixIcon,
    this.suffixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 16),
      child: TextFormField(
        textInputAction: textInputAction,
        autovalidateMode: autoValidateMode,
        inputFormatters: inputFormatter,
        maxLines: maxLines,
        controller: controller,
        initialValue: initialValue,
        onTap: onTap as void Function()?,
        onChanged: onChanged,
        onEditingComplete: onEditingComplete as void Function()?,
        cursorColor: Get.theme.primaryColor,
        style: inputFieldTextStyle,
        obscureText: obscureText,
        keyboardType: textInputType,
        onSaved: onSaved,
        maxLength: maxLength,
        focusNode: focusNode,
        autocorrect: autoCorrect,
        validator: validator,
        decoration: InputDecoration(
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
          contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
          enabledBorder: inputFieldDefaultBorderStyle,
        ),
      ),
    );
  }
}