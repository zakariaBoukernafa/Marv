import 'package:ecommerce/Widgets/buttons/RadioButton.dart';
import 'package:flutter/material.dart';


class HorizontalScrollableList extends StatefulWidget {
  final List data;


  HorizontalScrollableList({required this.data});

  @override
  _HorizontalScrollableListState createState() => _HorizontalScrollableListState();
}

class _HorizontalScrollableListState extends State<HorizontalScrollableList> {



  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: widget.data.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return Align(
              alignment: Alignment.topCenter,

              child: InkWell(
                //highlightColor: Colors.red,
                onTap: () {

                  setState(() {

                    widget.data
                        .forEach((element) => element.isSelected = false);
                    widget.data[index].isSelected = true;
                  });
                },
                child:  RadioItem(widget.data[index])
              ),
            );
          }),
    );
  }
}
