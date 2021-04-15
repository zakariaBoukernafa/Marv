import 'package:ecommerce/Models/Product.dart';
import 'package:ecommerce/Screens/Home/Dashboard/DashboardController.dart';
import 'package:ecommerce/Widgets/Containers/ItemThumbnail.dart';
import 'package:ecommerce/theme/colors.dart';
import 'package:ecommerce/utils/AppState.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemsGallery extends StatelessWidget {
  final RxList<Product> products;
  final AppState state;

  ItemsGallery({required this.products, required this.state});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.2,
      child: Center(
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: products.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              if (state == AppState.LOADING)
                return Container(
                    color: greyLight1,
                    width: Get.width * 0.4,
                    height: Get.width * 0.5,
                    child: Center(child: CircularProgressIndicator()));
              else
                return ItemThumbnail(
                  product: products[index],
                );
            }),
      ),
    );
  }
}
