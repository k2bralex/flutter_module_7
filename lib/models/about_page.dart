import 'package:flutter/material.dart';

import 'group.dart';

class AboutPage extends StatefulWidget {
  static const routeName = "/about";
  final Group group;

  const AboutPage({super.key, required this.group});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.group.name),
      ),
      body: SafeArea(
        child: Container(
            padding: const EdgeInsets.all(10),
            child: Text(widget.group.about)),
      ),
    );
  }
}
