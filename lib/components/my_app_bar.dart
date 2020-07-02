import 'package:flutter/material.dart';

Widget MyAppBar({String title}) {
  return AppBar(
    title: Text(
      title,
      style: TextStyle(color: Colors.grey),
    ),
    actions: <Widget>[
      Icon(
        Icons.help_outline,
        color: Colors.grey,
      ),
      SizedBox(
        width: 20,
      ),
      Icon(
        Icons.settings,
        color: Colors.grey,
      ),
      SizedBox(
        width: 10,
      ),
    ],
  );
}
