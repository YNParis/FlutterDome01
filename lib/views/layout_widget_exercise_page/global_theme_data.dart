import 'package:flutter/material.dart';

var blueDay = ThemeData(
  primarySwatch: Colors.blue,
  iconTheme: IconThemeData(color: Colors.blue[300]),
  textTheme: TextTheme(body1: TextStyle(color: Colors.grey[700]),
  ),
);

var tealDay = ThemeData(
  primarySwatch: Colors.teal,
  iconTheme: IconThemeData(color: Colors.teal[300]),
  textTheme: TextTheme(body1: TextStyle(color: Colors.grey[700]),
  ),
);

var night = ThemeData(
  primarySwatch: Colors.pink,
  brightness: Brightness.dark,
  iconTheme: IconThemeData(color: Colors.blue[300]),
  textTheme: TextTheme(body1: TextStyle(color: Colors.white),
  ),
);

