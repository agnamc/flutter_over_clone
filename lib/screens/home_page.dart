import 'package:flutter/material.dart';
import 'package:flutteroverclone/screens/projects_page.dart';
import 'package:flutteroverclone/screens/templates_screen.dart';
import 'package:flutteroverclone/constants/app_colors.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePaeState createState() => _HomePaeState();
}

class _HomePaeState extends State<HomePage> {
  int currentIndex = 0;

  List<Widget> screens;

  @override
  void initState() {
    screens = [TemplatesScreen(), ProjectsScreen()];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        selectedItemColor: myYellow,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            title: Text("Templates"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.image),
            title: Text("Projects"),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: myYellow,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: screens[currentIndex],
    );
  }
}
