import 'package:flutter/material.dart';

class ProjectSize {
  final int paperWidth;
  final int paperHeight;
  final double thumbHeight;
  final Widget content;
  final String name;

  ProjectSize({
    this.paperWidth = 0,
    this.paperHeight = 0,
    this.thumbHeight,
    this.content,
    this.name,
  });
}
