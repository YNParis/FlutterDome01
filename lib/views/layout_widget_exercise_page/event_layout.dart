import 'package:flutter/material.dart';

class EventLayout extends StatefulWidget {
  @override
  _EventLayoutState createState() => new _EventLayoutState();
}

class _EventLayoutState extends State<EventLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('EventBus'),),
      body: RaisedButton(onPressed: (){

      }),
    );
  }
}
