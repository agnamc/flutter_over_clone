import 'package:flutter/material.dart';
import 'package:flutteroverclone/components/my_app_bar.dart';
import 'package:flutteroverclone/models/category.dart';

class ProjectsScreen extends StatefulWidget {
  @override
  _ProjectsScreenState createState() => _ProjectsScreenState();
}

class _ProjectsScreenState extends State<ProjectsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: "Projects"),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20.0),
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: Colors.grey),
              child: Icon(
                Icons.image,
                color: Colors.white,
                size: 50,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "Let's start a project",
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 15,
            ),
            MaterialButton(
              color: Color(0xFFFFC701),
              onPressed: () {},
              child: Text(
                "Start creating",
                style: TextStyle(fontSize: 16),
              ),
            )
          ],
        ),
      ),
    );
  }
}
