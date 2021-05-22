import 'package:ecommerce/Widgets/Containers/item_thumbnail.dart';
import 'package:ecommerce/models/product.dart';
import 'package:ecommerce/theme/colors.dart';
import 'package:ecommerce/utils/app_state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GridGallery extends StatelessWidget {
  final RxList products;
  final AppState state;

  const GridGallery({required this.products, required this.state});

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return Center(
      child: GridView.builder(
          physics: const ScrollPhysics(),
        shrinkWrap: true,
          itemCount: products.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: (orientation == Orientation.portrait) ? 2 : 3),
          itemBuilder: (BuildContext context, int index) {
            if (state == AppState.LOADING) {
              return SizedBox(
                  width: Get.width * 0.4,
                  height: Get.width * 0.5,
                  child: const Center(child: CircularProgressIndicator()));
            } else {
              return ItemThumbnail(
                product: products[index] as Product,
              );
            }
          }),
    );
  }
}
