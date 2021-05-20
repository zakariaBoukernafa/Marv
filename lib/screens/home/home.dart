import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Dashboard/Dashboard.dart';


class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return SafeArea(child: DashboardScreen());
  }
}
