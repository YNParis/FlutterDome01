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
  Color _themeColor = Colors.teal;
  int i = 0;

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Theme(
        data: ThemeData(
          primarySwatch: _themeColor,
          iconTheme: IconThemeData(color: _themeColor),
          textTheme: TextTheme(body1: TextStyle(
              color: _themeColor),), //App中字体颜色，一般的Text控件的文本颜色是body1
        ),
        child: Scaffold(
          appBar: AppBar(
            title: Text('ThemeData'),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.favorite),
                  Icon(Icons.airport_shuttle),
                  Text('颜色跟随主题')
                ],
              ),
              Theme(
                  data: themeData.copyWith(
                      iconTheme: themeData.iconTheme.copyWith(
                          color: Colors.black
                      )
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.favorite),
                      Icon(Icons.airport_shuttle),
                      Text('颜色固定黑色')
                    ],
                  )),
              RaisedButton(onPressed: () {
                ApplicationEvent.event.fire(ThemeEvent(blueDay, true));
              }, child: Text('换肤'),)
            ],
          ),

        ));
  }
}
