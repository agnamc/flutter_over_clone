import 'package:flutter/material.dart';
import 'package:flutteroverclone/constants/app_colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WorkspaceScreen extends StatefulWidget {
  @override
  _WorkspaceScreenState createState() => _WorkspaceScreenState();
}

class _WorkspaceScreenState extends State<WorkspaceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myDarkGray,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Icon(Icons.arrow_back, color: myGray,),
                  FaIcon(FontAwesomeIcons.undo, color: myGray,),
                  FaIcon(FontAwesomeIcons.clone, color: myGray,),
                  FaIcon(FontAwesomeIcons.layerGroup, color: myGray,),
                  FaIcon(FontAwesomeIcons.solidShareSquare, color: myGray),
                ],
              ),
            ),
            Expanded(
              child: Center(
                child: Container(
                  color: Colors.white,
                  height: 300,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      FaIcon(FontAwesomeIcons.image, color: myGray,),
                      Text("Image", style: TextStyle(color: myGray),)
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      FaIcon(FontAwesomeIcons.font, color: myGray,),
                      Text("Text", style: TextStyle(color: myGray),)
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      FaIcon(FontAwesomeIcons.magic, color: myGray,),
                      Text("Graphic", style: TextStyle(color: myGray),)
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      FaIcon(FontAwesomeIcons.shapes, color: myGray,),
                      Text("Shape", style: TextStyle(color: myGray),)
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}
