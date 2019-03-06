import 'package:event_bus/event_bus.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_demo01/event/event_bus.dart';
import 'package:flutter_app_demo01/event/event_model.dart';
import 'package:flutter_app_demo01/routers/application.dart';
import 'package:flutter_app_demo01/routers/routers.dart';
import 'package:flutter_app_demo01/views/layout_widget_exercise_page/global_theme_data.dart';
import 'package:flutter_app_demo01/views/layout_widget_exercise_page/home.dart';


class MyApp extends StatelessWidget {
  MyApp() {
    final router = new Router();
    Routes.configureRoutes(router);
    //在该类下进行router的配置，将设置好的值赋值给application的router，相当于全局变量。
    // 以后再其他任意一个类当中调用
    Application.router = router;

    ApplicationEvent.event = new EventBus();
    themeData = tealDay;
    _registerEventBus();
  }

  ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      onGenerateRoute: Application.router.generator,
      home: HomePage(),
      theme: this.themeData,
//      debugShowMaterialGrid: true, //显示窗格，UI设计时的那种参考线。每格8pixel，粗线2pixel，细线1pixel，如 控件设置宽40.0，则占满5格
    );
  }

  void _registerEventBus() {
    ApplicationEvent.event.on<ThemeEvent>().listen((ThemeEvent onData) =>
        () {
      this.themeData = onData.themeData;
    });
  }

}

void main() => runApp(MyApp());




