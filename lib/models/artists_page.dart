import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'drawer.dart';
import 'group.dart';

class Artists extends StatefulWidget {
  static const routeName = "/artists";

  const Artists({super.key});

  @override
  State<Artists> createState() => _ArtistsState();
}

class _ArtistsState extends State<Artists> {
  late List<Group> _groups = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      loadJson("assets/artists.json");
    });

  }

  ///Parse JSON file nad update state
  loadJson(String path) async {
    String data = await rootBundle.loadString(path);
    final Map<String, dynamic> jsonResult = jsonDecode(data);
    List<Group> groups = [];
    jsonResult.forEach((final String key, final value) {
      groups.add(Group(
          name: value["name"], link: value["link"], about: value["about"]));
    });

    setState(() {
      _groups = groups;
    });
  }

  ///Using [LayoutBuilder] to create view
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Artist"),),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return ListView(
              children: <Widget>[
                for (int i = 0; i < _groups.length; i++)
                  Card(
                    color: Colors.yellow[300],
                    child: ListTile(
                      title: Text(_groups[i].name),
                      leading: Text("${i + 1}. "),
                      onTap: () {
                        ///Send selected [Group] to about page
                        Navigator.of(context)
                            .pushNamed("/about", arguments: _groups[i]);
                      },
                    ),
                  ),
              ],
            );
          },
        ),
      ),
      drawer: const MyDrawer(),
    );
  }
}
