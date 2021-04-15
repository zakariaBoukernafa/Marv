import 'package:ecommerce/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Themes {
  static final light = ThemeData.light().copyWith(
    brightness: Brightness.light,
    primaryColor: white,
    accentColor: green,
    indicatorColor: green,
    tabBarTheme: TabBarTheme(
        indicator: BoxDecoration(
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
    buttonTheme: ButtonThemeData(
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
    appBarTheme: AppBarTheme(
      brightness: Brightness.light,
       titleTextStyle: TextStyle(color: black),
      iconTheme: IconThemeData(),
      elevation: 0,
      actionsIconTheme: IconThemeData(),
      textTheme: TextTheme(),

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
