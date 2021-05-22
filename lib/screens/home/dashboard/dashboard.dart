import 'dart:math';
import 'package:ecommerce/Controllers/user_controller.dart';
import 'package:ecommerce/Widgets/Containers/category_div.dart';
import 'package:ecommerce/Widgets/Containers/presentation_item.dart';
import 'package:ecommerce/Widgets/Lists/grid_gallery.dart';
import 'package:ecommerce/Widgets/Lists/horizontal_scrollable_list.dart';
import 'package:ecommerce/Widgets/TextFields/sarch_text_field.dart';
import 'package:ecommerce/Widgets/buttons/radio_button.dart';
import 'package:ecommerce/Widgets/drawers/cart_drawer.dart';
import 'package:ecommerce/Widgets/drawers/drawer.dart';
import 'package:ecommerce/models/product.dart';
import 'package:ecommerce/theme/colors.dart';
import 'package:ecommerce/utils/cart_drawer_guard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'dashboard_controller.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  List<RadioModel> sampleData = [];
  final _random = Random();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sampleData.add(RadioModel(false, 'Hoodies'));
    sampleData.add(RadioModel(false, 'Phones'));
    sampleData.add(RadioModel(false, 'Shoes'));
    sampleData.add(RadioModel(false, 'Pants'));
  }

  @override
  Widget build(BuildContext context) {
    DashboardController.to.getProducts();
    final TextTheme style = Theme.of(context).textTheme;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'store'.tr,
            style: const TextStyle(color: black),
          ),
          actions: [
            Builder(
              builder: (context) => IconButton(
                icon: const Icon(CupertinoIcons.cart),
                onPressed: () => openCartDrawer(context),
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              ),
            ),
          ],
        ),
        drawer:  CustomDrawer(),
        endDrawer:  CartDrawer(),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Obx(()=>
                  Text(
                    "${'hi'.tr} ${UserController.to.user!.value?.authenticatedItem?.name ?? "There"}",
                    style: style.bodyText1,
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.01,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: Text(
                    'greeting'.tr,
                    style: style.headline5,
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.04,
                ),
                SearchTextField(
                  suffixIcon: const Icon(Icons.search),
                  hintText: 'Search_something'.tr,
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                SizedBox(
                    height: Get.height * 0.06,
                    child: HorizontalScrollableList(
                      data: sampleData,
                    )),
                SizedBox(
                  height: Get.height * 0.04,
                ),
                Obx(() => (DashboardController.to.products.isNotEmpty)
                    ? PresentationItem(
                        product: DashboardController.to.products[
                                _random.nextInt(
                                    DashboardController.to.products.length)]
                            as Product,
                      )
                    : Container()),
                CategoryDiv(
                  titleText: Text(
                    'FeaturedProducts',
                    style: style.bodyText1,
                  ),
                  expandButton: TextButton(
                    onPressed: () => null,
                    child: Text(
                      'See All',
                      style: style.bodyText1!.copyWith(color: grey),
                    ),
                  ),
                ),
                Obx(
                  () => GridGallery(
                    products: DashboardController.to.products,
                    state: DashboardController.to.appState.value,
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
