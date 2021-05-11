import 'package:flutter/material.dart';

Widget slidAnimation({required BuildContext context, required Animation<double> animation,required Widget child}) {
  return SlideTransition(
    position: Tween<Offset>(
      begin: const Offset(-1, 0),
      end: const Offset(0, 0),
    ).animate(animation),
    child: child
  );
}