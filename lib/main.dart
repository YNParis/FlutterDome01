import 'package:event_bus/event_bus.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:camera/camera.dart';

import 'package:flutter_app_demo01/event/event_bus.dart';
import 'package:flutter_app_demo01/event/event_model.dart';
import 'package:flutter_app_demo01/routers/application.dart';
import 'package:flutter_app_demo01/routers/routers.dart';
import 'package:flutter_app_demo01/views/layout_widget_exercise_page/global_theme_data.dart';
import 'package:flutter_app_demo01/views/layout_widget_exercise_page/home.dart';

class MyApp extends StatefulWidget {
  MyApp() {
    final router = new Router();
    Routes.configureRoutes(router);
    //在该类下进行router的配置，将设置好的值赋值给application的router，相当于全局变量。
    // 以后再其他任意一个类当中调用
    Application.router = router;
  }

  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeData themeData;

  @override
  void initState() {
    super.initState();
    themeData = tealDay;
    ApplicationEvent.event = EventBus();
    this._rigisterEventBus();
  }

  void _rigisterEventBus() {
    ApplicationEvent.event
        .on<ThemeEvent>()
        .listen((onData) => setState(() => this.themeData = onData.themeData));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: Application.router.generator,
      home: HomePage(),
      theme: this.themeData,
      debugShowCheckedModeBanner: false, //去掉debug时的右上角图标
    );
  }
}

void main() {
  initCamera();
  return runApp(MyApp());
}

Future<void> initCamera() async {
// Fetch the available cameras before initializing the app.
  try {
    Application.cameras = await availableCameras();
  } on CameraException catch (e) {
    print(e.description);
  }
}
