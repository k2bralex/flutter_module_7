import 'package:flutter/material.dart';
import 'package:flutter_module_7/models/drawer_menu_builder.dart';

///Create Drawer
class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  late int selectedIndex;
  @override
  Widget build(BuildContext context) {
    return const Drawer(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(top: 60.0),
            child: DrawerMenu(),
          ),
        ),
    );
  }
}