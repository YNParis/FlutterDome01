import 'package:flutter/material.dart';

/**
 * 控制两次点击不超过1秒，返回。对于手机上的返回键和Scaffold中的返回键都管用
 */
class WillPopScopeTestRoute extends StatefulWidget {
  @override
  WillPopScopeTestRouteState createState() {
    return WillPopScopeTestRouteState();
  }
}

class WillPopScopeTestRouteState extends State<WillPopScopeTestRoute> {
  DateTime _lastTime; //上次点击的时间

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text('WILLPOPSCOPE'),
        ),
        body: WillPopScope(
            child: Text('I am child', textScaleFactor: 3.0,),
            onWillPop: () async {
              if (_lastTime == null || DateTime.now().difference(_lastTime) >
                  Duration(seconds: 1)) {
                //这个比较里面，不能用_lastTime.difference来比较
                _lastTime = DateTime.now();
                return false;
              }
              return true;
            })
    );
  }
}