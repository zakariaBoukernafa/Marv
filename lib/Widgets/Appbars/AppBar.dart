
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget appBar ({Widget? title, List<Widget>? actions}) => AppBar(
  actions:actions,
  centerTitle: true,
  title: title
);