import 'package:flutter/material.dart';

import 'models/about_page.dart';
import 'models/artists_page.dart';
import 'models/group.dart';
import 'models/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      initialRoute: "/",
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case MyHomePage.routeName:
            return MaterialPageRoute(builder: (BuildContext context) {
              return const MyHomePage(
                title: 'Module 6',
              );
            });
          case Artists.routeName:
            return MaterialPageRoute(builder: (BuildContext context) {
              return const Artists();
            });
          case AboutPage.routeName:
            final args = settings.arguments as Group;
            //print((args as Group).name);
            return MaterialPageRoute(builder: (BuildContext context) {
              return AboutPage(group: args,);
            });
          default:
        }
        return null;
      },
    );
  }
}
