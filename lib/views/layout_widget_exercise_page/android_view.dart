import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AndroidNativeViewRoute extends StatefulWidget {
  @override
  _AndroidNativeViewRouteState createState() =>
      new _AndroidNativeViewRouteState();
}

class _AndroidNativeViewRouteState extends State<AndroidNativeViewRoute> {

  static const platform = const MethodChannel(
      'samples.flutter.io/battery'); //对应的是Android里面的MethodChannel，名称一定要一样

  // Get battery level.
  String _batteryLevel = 'Unknown battery level.';

  String _string = 'Hello Android native.';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('使用PlatformChannel调用原生API'),),
        body: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              new RaisedButton(
                child: new Text('Get Battery Level'),
                onPressed: _getBatteryLevel,
              ),
              new Text(_batteryLevel),
              new RaisedButton(
                child: new Text('print by logcat'),
                onPressed: _print,
              ),
              new RaisedButton(
                child: new Text('获取字符串 Hello Android native. 的前10位'),
                onPressed: () {
                  _get10Char(_string);
                },
              ),
              new Text(_string),
            ],
          ),
        )
    );
  }

  Future<Null> _getBatteryLevel() async {
    String batteryLevel;
    try {
      final int result = await platform.invokeMethod(
          'getBatteryLevel'); //对应的是Android里面的方法名
      batteryLevel = 'Battery level at $result % .';
    } on PlatformException catch (e) {
      batteryLevel = "Failed to get battery level: '${e.message}'.";
    }

    setState(() {
      _batteryLevel = batteryLevel;
    });
  }

  Future<Null> _print() async {
    //在logcat中打印日志
    try {
      await platform.invokeMethod('printByLogcat');
    } on PlatformException catch (e) {
      print('打印失败:${e.message}');
    }
  }

  Future<Null> _get10Char(String s) async {
    var str = '获取失败';
    try {
      str = await platform.invokeMethod('get10Char', {"before": _string});
    } on PlatformException catch (e) {
      print('获取失败:${e.message}');
    }
    setState(() {
      _string = str;
    });
  }

}

