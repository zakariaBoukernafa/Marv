
import 'package:ecommerce/models/product.dart';
import 'package:ecommerce/routes/routers.dart';
import 'package:ecommerce/screens/Home/dashboard/dashboard_controller.dart';
import 'package:ecommerce/screens/products/products_controller.dart';
import 'package:ecommerce/theme/styles.dart';
import 'package:ecommerce/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';


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

  SearchTextField({
    this.filled = true,
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
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TypeAheadField(
      textFieldConfiguration: TextFieldConfiguration(
        controller: myController,
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
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
          enabledBorder: inputFieldDefaultBorderStyle,
        ),
      ),
      suggestionsCallback: (pattern) async {
         return DashboardController.to.searchProducts(searchTerm: pattern);
      },
      itemBuilder: (context, Product product) {
        return ListTile(
          leading: Image.network(
            product.photo!.image!.publicUrlTransformed!,
            fit: BoxFit.cover,
          ),
          title: Text(product.name!),
          subtitle: Text(product.description!),
        );
      },
      onSuggestionSelected: (Product product) async{
        final Product? selectedProduct = await DashboardController.to.getSingleProduct(id: product.id!);
        Get.toNamed(Routers.product,arguments: selectedProduct);
      },
    );
  }

}
