import 'package:flutter/material.dart';

class StackLayout extends StatelessWidget {
  String title;

  StackLayout(this.title);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Stack(
      alignment: Alignment.centerRight, //todo 指定未定位或部分定位widget的对齐方式
      children: <Widget>[
        Container(
          width: 200.0,
          height: 200.0,
          alignment: Alignment.center,
          //在Container中居中
          child: Text(title, style: TextStyle(color: Colors.white)),
          color: Colors.red,
        ),
        Positioned(
          left: 30.0,
          child: Text("I am Jack"),
        ),
        Positioned(
          top: 20.0,
          child: Text("Your friend"),
        )
      ],

    );
  }
}