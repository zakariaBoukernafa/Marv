
import 'package:ecommerce/routes/pages.dart';
import 'package:ecommerce/routes/routers.dart';
import 'package:ecommerce/theme/themes.dart';
import 'package:flutter/material.dart';
// ignore: library_prefixes
import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'Controllers/Binding/initial_binding.dart';
import 'Services/localization_service.dart';



Future<void> main()async{
  await DotEnv.load();

  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(GetMaterialApp(

    debugShowCheckedModeBanner: false,
    theme: Themes.light,
    initialBinding: InitialBinding(),
    locale: LocalizationService.locale,
    fallbackLocale: LocalizationService.fallbackLocale,
    translations: LocalizationService(),
    defaultTransition: Transition.fade,
    transitionDuration: const Duration(milliseconds: 450),
    getPages: Pages.getPages,
    initialRoute: Routers.home,
  ));
}
