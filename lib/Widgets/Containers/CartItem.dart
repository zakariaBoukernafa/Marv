import 'package:ecommerce/Widgets/buttons/CounterButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 4,
            child: Image.network(
          'https://pyxis.nymag.com/v1/imgs/853/030/fa9bfcf1f90e2fc68cd8a6fddb282fd1b6-men-packaged-dry-crew-neck.2x.rsquare.w600.jpg',
          fit: BoxFit.cover,
        )),
        Spacer(flex: 1,),
        Flexible(
            flex: 10,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('T-shirt' ,style:TextStyle(fontSize: 20.0)),
            Padding(
              padding: const EdgeInsets.only(top:8.0),
              child: Text('USD 50',style: TextStyle(fontWeight: FontWeight.bold),),
            ),
            Padding(
              padding: const EdgeInsets.only(top:8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CounterButton(child: Icon(CupertinoIcons.minus,size: 20,), onPressed: () => null),
                        //todo: add functionality
                        Text('1'),
                        CounterButton(child: Icon(CupertinoIcons.plus,size: 20,), onPressed: () => null),
                      ],
                    ),
                  ),
                  IconButton(icon: Icon(CupertinoIcons.trash,size: 20.0,), onPressed: ()=> null)
                ],
              ),
            )
          ],
        ))
      ],
    );
  }
}
