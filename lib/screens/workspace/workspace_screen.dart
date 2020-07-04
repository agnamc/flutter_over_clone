import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutteroverclone/constants/app_colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WorkspaceScreen extends StatefulWidget {
  @override
  _WorkspaceScreenState createState() => _WorkspaceScreenState();
}

class _WorkspaceScreenState extends State<WorkspaceScreen>
    with TickerProviderStateMixin {
  AnimationController _topOffsetController;
  Animation<Offset> _topOffsetAnimation;

  AnimationController _bottomOffsetController;
  Animation<Offset> _bottomOffsetAnimation;

  @override
  void initState() {
    _topOffsetController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _topOffsetAnimation = Tween<Offset>(
      begin: Offset(0.0, -2.5),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _topOffsetController,
        curve: Curves.decelerate,
      ),
    );

    _bottomOffsetController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _bottomOffsetAnimation = Tween<Offset>(
      begin: Offset(0.0, 2.5),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _topOffsetController,
        curve: Curves.decelerate,
      ),
    );

    Timer(Duration(milliseconds: 500), () {
      _topOffsetController.forward();
      _bottomOffsetController.forward();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: myDarkGray,
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: SlideTransition(
                  position: _topOffsetAnimation,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Icon(Icons.arrow_back, color: myGray),
                      FaIcon(
                        FontAwesomeIcons.undo,
                        color: myGray,
                        size: 18,
                      ),
                      FaIcon(
                        FontAwesomeIcons.clone,
                        color: myGray,
                        size: 18,
                      ),
                      FaIcon(
                        FontAwesomeIcons.layerGroup,
                        color: myGray,
                        size: 18,
                      ),
                      FaIcon(
                        FontAwesomeIcons.solidShareSquare,
                        color: myGray,
                        size: 18,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("images/grid_paper.jpg"),
                            fit: BoxFit.cover)),
                    height: 300,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: SlideTransition(
                  position: _bottomOffsetAnimation,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          FaIcon(
                            FontAwesomeIcons.image,
                            color: myGray,
                            size: 18,
                          ),
                          Text(
                            "Image",
                            style: TextStyle(color: myGray),
                          )
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          FaIcon(
                            FontAwesomeIcons.font,
                            color: myGray,
                            size: 18,
                          ),
                          Text(
                            "Text",
                            style: TextStyle(color: myGray),
                          )
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          FaIcon(
                            FontAwesomeIcons.magic,
                            color: myGray,
                            size: 18,
                          ),
                          Text(
                            "Graphic",
                            style: TextStyle(color: myGray),
                          )
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          FaIcon(
                            FontAwesomeIcons.shapes,
                            color: myGray,
                            size: 18,
                          ),
                          Text(
                            "Shape",
                            style: TextStyle(color: myGray),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }

  @override
  void dispose() {
    _topOffsetController.dispose();
    _bottomOffsetController.dispose();
    super.dispose();
  }
}
