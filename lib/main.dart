
import 'package:ecommerce/routes/pages.dart';
import 'package:ecommerce/routes/routers.dart';
import 'package:ecommerce/theme/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'Controllers/Binding/initial_binding.dart';
import 'Services/localization_service.dart';



void main(){
  WidgetsFlutterBinding.ensureInitialized();
  runApp(GetMaterialApp(
    theme: Themes.light,
    initialBinding: InitialBinding(),
    locale: LocalizationService.locale,
    fallbackLocale: LocalizationService.fallbackLocale,
    translations: LocalizationService(),
    defaultTransition: Transition.fade,
    transitionDuration: const Duration(milliseconds: 250),
    getPages: Pages.getPages,
    initialRoute: Routers.home,
  ));
}
