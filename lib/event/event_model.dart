import 'package:flutter/material.dart';

class CollectionEvent {
  final String widgetName;
  final String router;
  final bool isRemove;

  // token uid...
  CollectionEvent(this.widgetName, this.router, this.isRemove);
}

class ThemeEvent {
  final ThemeData themeData;
  final bool isChanged;

  ThemeEvent(this.themeData, this.isChanged);
}