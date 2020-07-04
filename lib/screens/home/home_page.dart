import 'package:flutter/material.dart';
import 'package:flutteroverclone/constants/app_colors.dart';
import 'package:flutteroverclone/screens/home/projects_page.dart';
import 'package:flutteroverclone/screens/home/templates_screen.dart';
import 'package:flutteroverclone/screens/workspace/create_project_screen.dart';
import 'package:flutteroverclone/transition/reveal_router.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  List<Widget> screens;

  @override
  void initState() {
    screens = [
      TemplatesScreen(),
      ProjectsScreen(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    var screenHeight = MediaQuery.of(context).size.height;

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
        onPressed: () {
          /*Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => CreateProjectScreen()));*/
          Navigator.push(
            context,
            RevealRoute(
              page: CreateProjectScreen(),
              maxRadius: screenHeight + 100,
              centerAlignment: Alignment.bottomCenter,
            ),
          );
        },
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
