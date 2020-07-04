import 'package:flutter/material.dart';
import 'package:flutteroverclone/constants/app_colors.dart';
import 'package:flutteroverclone/models/project_size.dart';
import 'package:flutteroverclone/screens/workspace/workspace_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:math' as math;

final List<ProjectSize> projectSizes = [
  ProjectSize(
      height: 120.0,
      content: FaIcon(FontAwesomeIcons.instagram, color: myGray)),
  ProjectSize(
      height: 150.0,
      content: FaIcon(FontAwesomeIcons.instagram, color: myGray)),
  ProjectSize(
      height: 90.0, content: FaIcon(FontAwesomeIcons.instagram, color: myGray)),
  ProjectSize(
      height: 150.0, content: FaIcon(FontAwesomeIcons.facebook, color: myGray)),
  ProjectSize(
      height: 120.0, content: FaIcon(FontAwesomeIcons.twitter, color: myGray)),
  ProjectSize(
      height: 90.0, content: FaIcon(FontAwesomeIcons.pinterest, color: myGray)),
  ProjectSize(
      height: 120.0,
      content: Text(
        "1:1",
        style: TextStyle(color: myGray),
      )),
  ProjectSize(
      height: 60.0, content: FaIcon(FontAwesomeIcons.image, color: myGray)),
];

class CreateProjectScreen extends StatefulWidget {
  @override
  _CreateProjectScreenState createState() => _CreateProjectScreenState();
}

class _CreateProjectScreenState extends State<CreateProjectScreen> {
  
  PageController _pageSizeController;
  int _currentSize;

  @override
  void initState() {
    super.initState();

    _currentSize = 0;

    _pageSizeController =
        PageController(initialPage: _currentSize, viewportFraction: 0.32);
    _pageSizeController.addListener(() {

      var value = (_pageSizeController.page -  _currentSize).abs().clamp(0.0, 1.0);
      if (value == 1) {
        setState(() {
          _currentSize = _pageSizeController.page.ceil();
        });
      }

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myDarkGray,
      appBar: AppBar(
        backgroundColor: Color(0xFF222222),
        title: Text("Project Size", style: TextStyle(color: myGray)),
        iconTheme: IconThemeData(color: myGray),
        actions: <Widget>[
          GestureDetector(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => WorkspaceScreen())),
            child: Icon(
              Icons.check,
              size: 26,
            ),
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 16.0),
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: Color(0xFF242424), width: 1),
                            borderRadius: BorderRadius.circular(5.0)),
                        child: Text("1080 x 1920",
                            style: TextStyle(
                                color: myGray,
                                fontWeight: FontWeight.bold,
                                fontSize: 16)),
                      ),
                      SizedBox(width: 20),
                      Icon(Icons.replay, color: myGray)
                    ],
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Container(
                      width: 200,
                      height: 200,
                      color: Colors.white,
                    ),
                  ),
                ),
                Text(
                  "Story",
                  style: TextStyle(
                    color: myGray,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 200,
            margin: EdgeInsets.symmetric(vertical: 16.0),
            child: PageView.builder(
                controller: _pageSizeController,
                itemCount: projectSizes.length,
                itemBuilder: (context, index) {
                  var item = projectSizes[index];
                  return Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: item.height,
                      decoration: BoxDecoration(
                          border: (_currentSize == index)
                              ? Border.all(color: myYellow, width: 2)
                              : null,
                          color: Color(0xFF282828),
                          borderRadius: BorderRadius.circular(10.0)),
                      margin: EdgeInsets.symmetric(horizontal: 4.0),
                      alignment: Alignment.center,
                      child: item.content,
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
