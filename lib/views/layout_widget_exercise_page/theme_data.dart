import 'package:flutter/material.dart';
import 'package:flutter_app_demo01/event/event_bus.dart';
import 'package:flutter_app_demo01/event/event_model.dart';
import 'package:flutter_app_demo01/main.dart';
import 'package:flutter_app_demo01/views/layout_widget_exercise_page/global_theme_data.dart';

class ThemeDataRoute extends StatefulWidget {
  @override
  _ThemeDataRouteState createState() => new _ThemeDataRouteState();
}

class _ThemeDataRouteState extends State<ThemeDataRoute> {

  bool b = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('ThemeData'),
        ),
        body: Center(
          child: RaisedButton(onPressed: () async {
            if (b)
              ApplicationEvent.event.fire(ThemeEvent(blueDay, true));
            else
              ApplicationEvent.event.fire(ThemeEvent(tealDay, false));
            b = !b;
          }, child: Text('换肤'),),
        )
    );
  }
}
