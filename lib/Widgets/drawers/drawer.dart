import 'package:ecommerce/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'drawer_header.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextTheme style = Theme.of(context).textTheme;

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          CustomDrawerHeader(),
          ListTile(
            leading: const Icon(Icons.person),
            title: Text(
              'Profile',
              style: style.headline6,
            ),
            onTap: () {},
          ),

          ListTile(
            leading: const Icon(Icons.message_outlined),
            title: Text(
              'Messages',
              style: style.headline6,
            ),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(CupertinoIcons.list_bullet_below_rectangle),
            title: Text(
              'Orders',
              style: style.headline6,
            ),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(CupertinoIcons.settings),
            title: Text(
              'Settings',
              style: style.headline6,
            ),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(CupertinoIcons.arrow_right_square),
            title: Text(
              'Sign Out',
              style: style.headline6,
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
