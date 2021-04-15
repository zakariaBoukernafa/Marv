
import 'package:ecommerce/routes/pages.dart';
import 'package:ecommerce/routes/routers.dart';
import 'package:ecommerce/theme/Theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'Controllers/Binding/InitialBinding.dart';
import 'Services/LocalizationService.dart';

Future<String> getCookie() async {
  return await GetStorage().read("cookie");
}

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  runApp(GetMaterialApp(
    theme: Themes.light,
    initialBinding: InitialBinding(),
    locale: LocalizationService.locale,
    fallbackLocale: LocalizationService.fallbackLocale,
    translations: LocalizationService(),
    defaultTransition: Transition.fade,
    transitionDuration: Duration(milliseconds: 250),
    getPages: Pages.getPages,
    initialRoute: Routers.home,
  ));
}
