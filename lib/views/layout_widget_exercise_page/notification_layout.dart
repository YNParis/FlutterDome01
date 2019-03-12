import 'package:flutter/material.dart';

class NotificationLayout extends StatefulWidget {
  @override
  _NotificationLayoutState createState() => new _NotificationLayoutState();
}

class _NotificationLayoutState extends State<NotificationLayout> {

  String info = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('NotificationLayout'),),
      body: Center(
          child: NotificationListener<MyNotification>(
              onNotification: (notification) {
                setState(() {
                  info = info + notification.string;
                });
              },
              child: Column(
                children: <Widget>[
                  Builder(builder: (context) =>
                  //必须使用Builder创建，将子控件的context传过去
                  RaisedButton(
                    onPressed: () =>
                        MyNotification('Got it! ').dispatch(context),
                    child: Text('button'),)),
                  Text(info),
                ],
              )
          )
      )
      ,
    );
  }
}

class MyNotification extends Notification {
  MyNotification(this.string);

  final String string;
}
