import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutteroverclone/constants/app_colors.dart';
import 'package:flutteroverclone/models/project_size.dart';
import 'package:flutteroverclone/screens/workspace/workspace_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

final List<ProjectSize> projectSizes = [
  ProjectSize(
    thumbHeight: 120.0,
    content: FaIcon(
      FontAwesomeIcons.instagram,
      color: myGray,
    ),
    name: "Square",
    paperWidth: 1080,
    paperHeight: 1080,
  ),
  ProjectSize(
    thumbHeight: 150.0,
    content: FaIcon(FontAwesomeIcons.facebook, color: myGray),
    name: "Story",
    paperWidth: 1080,
    paperHeight: 1920,
  ),
  ProjectSize(
    thumbHeight: 90.0,
    content: FaIcon(FontAwesomeIcons.twitter, color: myGray),
    name: "Landscape",
    paperWidth: 1080,
    paperHeight: 714,
  ),
  ProjectSize(
    thumbHeight: 120.0,
    content: Text(
      "1:1",
      style: TextStyle(color: myGray),
    ),
    name: "Square",
    paperWidth: 2048,
    paperHeight: 2048,
  ),
];

class CreateProjectScreen extends StatefulWidget {
  @override
  _CreateProjectScreenState createState() => _CreateProjectScreenState();
}

class _CreateProjectScreenState extends State<CreateProjectScreen> {
  
  PageController _pageSizeController;
  int _currentSize;

  bool _isReversed = false;

  double _opacity = 0.0;
  
  Duration _canvasAnimDuration;
  Duration _opacityDuration;

  @override
  void initState() {

    _opacityDuration = Duration(milliseconds: 200);
    _canvasAnimDuration = Duration(milliseconds: 500);

    _currentSize = 0;

    _pageSizeController =
        PageController(initialPage: _currentSize, viewportFraction: 0.32);
    _pageSizeController.addListener(() {
      var value =
          (_pageSizeController.page - _currentSize).abs().clamp(0.0, 1.0);
      if (value == 1) {
        setState(() {
          _currentSize = _pageSizeController.page.ceil();
          _isReversed = false;
        });
      }
    });

    Timer(_opacityDuration, (){
      setState(() {
        _opacity = 1.0;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: myDarkGray,
      appBar: AppBar(
        backgroundColor: Color(0xFF222222),
        title: Text(
          "Project Size",
          style: TextStyle(color: myGray),
        ),
        iconTheme: IconThemeData(color: myGray),
        actions: <Widget>[
          GestureDetector(
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => WorkspaceScreen(),
              ),
            ),
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
                          vertical: 8.0,
                          horizontal: 16.0,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(0xFF242424),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Text(
                          !_isReversed
                              ? "${projectSizes[_currentSize].paperWidth} x ${projectSizes[_currentSize].paperHeight}"
                              : "${projectSizes[_currentSize].paperHeight} x ${projectSizes[_currentSize].paperWidth}",
                          style: TextStyle(
                            color: myGray,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      SizedBox(width: 20),
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              _isReversed = !_isReversed;
                            });
                          },
                          child: Icon(Icons.replay, color: myGray))
                    ],
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: AnimatedContainer(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("images/grid_paper.jpg"),
                                fit: BoxFit.fill)),
                        duration: _canvasAnimDuration,
                        width: (!_isReversed
                                ? projectSizes[_currentSize].paperWidth
                                : projectSizes[_currentSize].paperHeight) /
                            4,
                        height: (!_isReversed
                                ? projectSizes[_currentSize].paperHeight
                                : projectSizes[_currentSize].paperWidth) /
                            4,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  projectSizes[_currentSize].name,
                  style: TextStyle(
                    color: myGray,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          AnimatedOpacity(
            opacity: _opacity,
            duration: Duration(milliseconds: 500),
            child: Container(
              height: 150,
              margin: EdgeInsets.symmetric(vertical: 12.0),
              child: PageView.builder(
                    physics: PageScrollPhysics(),
                  controller: _pageSizeController,
                  itemCount: projectSizes.length,
                  itemBuilder: (context, index) {
                    var item = projectSizes[index];
                    return Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: item.thumbHeight,
                        decoration: BoxDecoration(
                          border: (_currentSize == index)
                              ? Border.all(color: myYellow, width: 2)
                              : null,
                          color: Color(0xFF282828),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        margin: EdgeInsets.symmetric(horizontal: 4.0),
                        alignment: Alignment.center,
                        child: item.content,
                      ),
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
