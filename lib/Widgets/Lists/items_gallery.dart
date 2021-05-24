import 'package:ecommerce/Widgets/Containers/item_thumbnail.dart';
import 'package:ecommerce/Widgets/animations/circular_indicator.dart';
import 'package:ecommerce/models/product.dart';
import 'package:ecommerce/theme/colors.dart';
import 'package:ecommerce/utils/app_state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemsGallery extends StatelessWidget {
  final RxList products;
  final AppState state;

  const ItemsGallery({required this.products, required this.state});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height * 0.2,
      child: Center(
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: products.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              if (state == AppState.LOADING) {
                return Container(
                    color: greyLight1,
                    width: Get.width * 0.4,
                    height: Get.width * 0.5,
                    child:  Center(child: CircularIndicator()));
              } else {
                return ItemThumbnail(
                  product: products[index] as Product,
                );
              }
            }),
      ),
    );
  }
}
