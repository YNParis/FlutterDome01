import 'package:flutter/material.dart';

import 'package:fluro/fluro.dart';
import 'package:flutter_app_demo01/resources/shared_preferences_keys.dart';
import 'package:flutter_app_demo01/routers/application.dart';
import 'package:flutter_app_demo01/routers/routers.dart';
import 'package:flutter_app_demo01/utils/shared_prefernces.dart';
import 'package:flutter_app_demo01/views/first_page/home.dart';
import 'package:flutter_app_demo01/views/welcome_page/index.dart';


SpUtil sp;

class MyApp extends StatelessWidget {
  MyApp() {
    final router = new Router();
    Routes.configureRoutes(router);
    Application.router = router;
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      body: WelcomePage(),
    );
  }

  showWelcomePage() {
    bool showWelcome = sp.getBool(sharedPreferencesKeys.showWelcome);
    if (showWelcome == null || showWelcome == true) {
      return WelcomePage();
    } else {
      return AppPage();
    }
  }

}

void main() async {
  runApp(new MaterialApp(home: new MyApp()));
}