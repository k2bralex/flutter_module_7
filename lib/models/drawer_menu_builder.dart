import 'package:flutter/material.dart';

///Drawer menu create. [menuTitle] and [menuIcons] for menu lines
///Menu is scalable. using builder.
class DrawerMenu extends StatefulWidget {
  static const List<String> menuTitle = ["Home", "Artist"];
  static const List<IconData> menuIcons = [Icons.home, Icons.group];

  const DrawerMenu({super.key});

  @override
  State<DrawerMenu> createState() => _DrawerMenuState();
}

///Not sure. This is a best solution, to initiate global variable
/// but it`s working...
int selectedIndex = -1;

class _DrawerMenuState extends State<DrawerMenu> {
  //late int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.builder(
            shrinkWrap: true,
            itemCount: DrawerMenu.menuTitle.length,
            itemBuilder: (context, index) {
              //print(selectedIndex);
              return ListTile(
                tileColor: selectedIndex == index
                    ? Colors.purple[300]
                    : Colors.transparent,
                title: Text(
                  DrawerMenu.menuTitle[index],
                  style: const TextStyle(fontSize: 15),
                ),
                leading: Icon(DrawerMenu.menuIcons[index]),
                trailing: const IconButton(
                  icon: Icon(Icons.arrow_forward_ios),
                  onPressed: null,
                ),
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                    Navigator.of(context)
                        .pushNamed(index == 0 ? "/" : "/artists");
                  });
                },
              );
            }),
      ],
    );
  }

/*  @override
  Widget build(BuildContext context) {
    return Column(
      children: <ListTile>[
        for (int i = 0; i < DrawerMenu.menuTitle.length; i++)
          ListTile(
            tileColor: selectedIndex == index ? Colors.deepPurpleAccent : Colors.grey,
            title: Text(
              DrawerMenu.menuTitle[i],
              style: const TextStyle(fontSize: 15),
            ),
            leading: Icon(DrawerMenu.menuIcons[i]),
            trailing: const IconButton(
              icon: Icon(Icons.arrow_forward_ios),
              onPressed: null,
            ),
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
          )
      ],
    );
  }*/
}
