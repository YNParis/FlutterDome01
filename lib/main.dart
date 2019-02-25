import 'package:flutter/material.dart';
import 'package:flutter_app_demo01/views/layout_widget_exercise_page/layout_widget.dart';


class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new LayoutPage();
  }
}

void main() => runApp(new MaterialApp(home: new MyApp()));
