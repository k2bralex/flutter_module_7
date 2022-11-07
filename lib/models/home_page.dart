import 'package:flutter/material.dart';

import 'drawer.dart';
import 'group.dart';

class MyHomePage extends StatefulWidget {
  static const routeName = "/";
  final String title;

  const MyHomePage({super.key, required this.title});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

///HomePage
class _MyHomePageState extends State<MyHomePage> {
  late List<Group> groups = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: const MyDrawer(),
      body: SafeArea(
        child: Container(
          color: Colors.greenAccent,
          alignment: Alignment.center,
          child: const Text("Home Page"),
        ),
      ),
    );
  }
}
