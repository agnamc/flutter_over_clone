import 'package:flutter/material.dart';
import 'package:flutteroverclone/screens/home/home_page.dart';
import 'package:flutteroverclone/screens/workspace/workspace_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Over Clone',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: Colors.white
        ),
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}
