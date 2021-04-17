import 'package:ecommerce/Widgets/buttons/radio_button.dart';
import 'package:flutter/material.dart';

class HorizontalScrollableList extends StatefulWidget {
  final List<RadioModel> data;

  const HorizontalScrollableList({required this.data});

  @override
  _HorizontalScrollableListState createState() =>
      _HorizontalScrollableListState();
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
                      for (final element in widget.data) {
                        element.isSelected = false;
                      }
                      widget.data[index].isSelected = true;
                    });
                  },
                  child: RadioItem(widget.data[index])),
            );
          }),
    );
  }
}
