/**
 * Created with Android Studio.
 * User: 三帆
 * Date: 14/01/2019
 * Time: 23:00
 * email: sanfan.hx@alibaba-inc.com
 * tartget:  xxx
 */

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app_demo01/views/welcome_page/fourth_page.dart';
import 'package:flutter_app_demo01/views/layout_widget_exercise_page/layout_exercise_01.dart';

class WelcomePage extends StatefulWidget {
  WelcomePage({Key key}) : super(key: key);

  @override
  _WelcomePageState createState() {
    return new _WelcomePageState();
  }
}

class _WelcomePageState extends State<WelcomePage> {

  @override
  Widget build(BuildContext context) {
    return new LakePage();
  }
}
