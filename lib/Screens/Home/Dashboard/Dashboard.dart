import 'dart:math';

import 'package:ecommerce/Controllers/UserController.dart';
import 'package:ecommerce/Screens/Auth/Login/LoginController.dart';
import 'package:ecommerce/Screens/Home/Dashboard/DashboardController.dart';
import 'package:ecommerce/Widgets/Appbars/AppBar.dart';
import 'package:ecommerce/Widgets/Containers/CategoryDiv.dart';
import 'package:ecommerce/Widgets/Containers/ItemThumbnail.dart';
import 'package:ecommerce/Widgets/Containers/PresentationItem.dart';
import 'package:ecommerce/Widgets/Lists/HorizontalScrollableList.dart';
import 'package:ecommerce/Widgets/Lists/ItemsGallery.dart';
import 'package:ecommerce/Widgets/TextFields/SearchTextField.dart';
import 'package:ecommerce/Widgets/buttons/RadioButton.dart';
import 'package:ecommerce/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboadScreen extends StatefulWidget {
  @override
  _DashboadScreenState createState() => _DashboadScreenState();
}

class _DashboadScreenState extends State<DashboadScreen> {
  List<RadioModel> sampleData = [];
  final _random = new Random();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sampleData.add(new RadioModel(false, 'Hoodies'));
    sampleData.add(new RadioModel(false, 'Phones'));
    sampleData.add(new RadioModel(false, 'Shoes'));
    sampleData.add(new RadioModel(false, 'Pants'));
  }

  @override
  Widget build(BuildContext context) {
    DashboardController.to.getProducts();
    TextTheme style = Theme.of(context).textTheme;
    return Scaffold(
        appBar: appBar(
          title: Text(
            'store'.tr,
            style: TextStyle(color: black),
          ),
          actions: [
            Builder(
              builder: (context) => IconButton(
                icon: Icon(CupertinoIcons.bell_solid),
                onPressed: () => Scaffold.of(context).openEndDrawer(),
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              ),
            ),
          ],
        ) as PreferredSizeWidget?,
        drawer: Drawer(),
        endDrawer: Drawer(),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    "${'hi'.tr} ${UserController.to.user!.value?.authenticatedItem?.name??"There"}",
                  style: style.bodyText1,
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
                  suffixIcon: Icon(Icons.search),
                  hintText: 'Search_something'.tr,
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                Container(
                    height: Get.height * 0.06,
                    child: HorizontalScrollableList(
                      data: sampleData,
                    )),
                SizedBox(
                  height: Get.height * 0.04,
                ),
                Obx(
                    ()=>
                    (DashboardController.to.products.length>0)? PresentationItem(
                    product: DashboardController.to.products[_random.nextInt(DashboardController.to.products.length)],
                  ):Container()
                ),
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
                  () => ItemsGallery(
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
