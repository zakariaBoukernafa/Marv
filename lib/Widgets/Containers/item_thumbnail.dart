import 'package:ecommerce/utils/extensions/integers.dart';
import 'package:ecommerce/models/product.dart';
import 'package:ecommerce/routes/routers.dart';
import 'package:ecommerce/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemThumbnail extends StatelessWidget {
  final Product product;

  const ItemThumbnail({required this.product});

  @override
  Widget build(BuildContext context) {
    final TextTheme style = Theme.of(context).textTheme;

    return Center(
      child: GestureDetector(
        onTap: () => Get.toNamed(Routers.product, arguments: product),
        child: SizedBox(
          width: Get.width * 0.4,
          height: Get.width * 0.5,
          child: Column(
            children: [
              Flexible(
                  flex: 6,
                  child: Hero(
                      tag: product.photo!.image!.publicUrlTransformed!,
                      child: Image.network(
                        product.photo!.image!.publicUrlTransformed!,
                        fit: BoxFit.cover,
                      ))),
              Flexible(
                flex: 2,
                child: Hero(
                  tag: product.name!,
                  child: Material(
                    child: Text(
                      product.name!,
                      style: style.bodyText2,
                    ),
                  ),
                ),
              ),
              Flexible(
                  flex: 2,
                  child: Hero(
                    tag:product.price!.formatMoney(),
                    child: Text(
                      product.price!.formatMoney(),
                      style: style.caption!
                          .copyWith(fontWeight: FontWeight.bold, color: black),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
