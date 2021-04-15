import 'package:ecommerce/Models/Product.dart';
import 'package:ecommerce/Services/FormatMoney.dart';
import 'package:ecommerce/routes/routers.dart';
import 'package:ecommerce/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemThumbnail extends StatelessWidget {
  final Product product;

  ItemThumbnail({required this.product});

  @override
  Widget build(BuildContext context) {
    TextTheme style = Theme.of(context).textTheme;

    return Center(
      child: GestureDetector(
        onTap: () => Get.toNamed(Routers.product,arguments: this.product) ,
        child: Container(
          color: greyLight1,
          width: Get.width*0.4,
          height: Get.width*0.5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Flexible(
                  flex: 6,
                  child: Image.network(product.photo!.image!.publicUrlTransformed!,fit: BoxFit.cover,)),
              Flexible(flex:2,child:Text(
                product.name!,
                style: style.bodyText2,
              ),),
              Flexible(flex:2,child: Text(
                FormatMoney().format( product.price!),
                style: style.caption!.copyWith(
                    fontWeight: FontWeight.bold, color: black),
              ))

            ],
          ),
        ),
      ),
    );
  }
}
