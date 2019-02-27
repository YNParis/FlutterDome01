import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_demo01/routers/application.dart';
import 'package:flutter_app_demo01/routers/routers.dart';
import 'package:flutter_app_demo01/views/layout_widget_exercise_page/home.dart';


class MyApp extends StatelessWidget {
  MyApp() {
    final router = new Router();
    Routes.configureRoutes(router);
    //在该类下进行router的配置，将设置好的值赋值给application的router，相当于全局变量。
    // 以后再其他任意一个类当中调用
    Application.router = router;
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      onGenerateRoute: Application.router.generator,
      home: HomePage(),
    );
  }
}

void main() => runApp(MyApp());




