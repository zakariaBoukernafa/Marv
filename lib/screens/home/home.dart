import 'package:flutter/material.dart';

import 'Dashboard/Dashboard.dart';


class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: DashboardScreen());
  }
}
