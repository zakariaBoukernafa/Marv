import 'package:ecommerce/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: avoid_classes_with_only_static_members
class Themes {
   static final light = ThemeData.light().copyWith(
    brightness: Brightness.light,
    splashColor: green,
    primaryColor: green,
    accentColor: white,
    indicatorColor: green,
    tabBarTheme: TabBarTheme(
        indicator: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: green,
              width: 3.0,
            ),
          ),
        ),
        indicatorSize: TabBarIndicatorSize.values[0],
        labelColor: black),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            )),
            backgroundColor: MaterialStateProperty.all(green),
            minimumSize: MaterialStateProperty.all(
              Size(Get.width * 0.8, Get.height * 0.065),
            ))),
    buttonTheme: const ButtonThemeData(
        colorScheme: ColorScheme.light(
          primary: green,
          secondary: white,
        ),
        textTheme: ButtonTextTheme.primary,
        buttonColor: green),
    popupMenuTheme: PopupMenuThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
    ),
    inputDecorationTheme:  InputDecorationTheme(
      labelStyle: const TextStyle(
          color: darkGrey,
      ),
    focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide:   const BorderSide(
          color: red,
        ),
      ),
      errorBorder:  OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide:   const BorderSide(
          color: red,
        ),
      ),

    ),
    textTheme: TextTheme(
      headline1: GoogleFonts.dmSans(
          color: black, fontWeight: FontWeight.bold, letterSpacing: 0.64),
      headline2: GoogleFonts.dmSans(
          color: black, fontWeight: FontWeight.bold, letterSpacing: 0.64),
      headline3: GoogleFonts.dmSans(
          color: black, fontWeight: FontWeight.bold, letterSpacing: 0.64),
      headline4: GoogleFonts.dmSans(
          color: black, fontWeight: FontWeight.bold, letterSpacing: 0.64),
      headline5: GoogleFonts.dmSans(
          color: black, fontWeight: FontWeight.bold, letterSpacing: 0.2),
      headline6: GoogleFonts.dmSans(
          color: black, fontWeight: FontWeight.bold, letterSpacing: 0.2),
      subtitle1: GoogleFonts.dmSans(
          color: black, fontWeight: FontWeight.normal, letterSpacing: 0.2),
      subtitle2: GoogleFonts.dmSans(
          color: black, fontWeight: FontWeight.bold, letterSpacing: 0.2),
      button: GoogleFonts.dmSans(
          color: white, fontWeight: FontWeight.bold, letterSpacing: 0.2),
      bodyText1: GoogleFonts.dmSans(
          color: black, fontWeight: FontWeight.normal, letterSpacing: 0.2),
      bodyText2: GoogleFonts.dmSans(
          color: black, fontWeight: FontWeight.normal, letterSpacing: 0.2),
    ),
    appBarTheme: const AppBarTheme(
      brightness: Brightness.light,
      centerTitle: true,

      titleTextStyle: TextStyle(color: black),
      iconTheme: IconThemeData(),
      elevation: 0,
      actionsIconTheme: IconThemeData(),
      textTheme: TextTheme(),
      backgroundColor: green,


    ),
  );
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
