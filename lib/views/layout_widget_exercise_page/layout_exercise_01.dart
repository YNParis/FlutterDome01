import 'package:flutter/material.dart';
import 'package:flutter_app_demo01/views/layout_widget_exercise_page/button.dart';
import 'package:flutter_app_demo01/views/layout_widget_exercise_page/title.dart';

class LakePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new LakePageState();
  }

}

class LakePageState extends State<LakePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Column(
      children: <Widget>[
        //image
        Image.asset('images/lake.png')
        ,
        //title
        TitleWidget(),
        //buttons
        Row(
          children: <Widget>[
            CustomButton(context, Icons.phone, "call"),
            CustomButton(context, Icons.send, "route"),
            CustomButton(context, Icons.share, "share"),
          ],
        ),
        //description
        Text(
            '''Qinghai Lake, the Tibetan language is called "Tuwenbu" (meaning "blue sea"). Located in the northeastern part of the Qinghai-Tibet Plateau, Qinghai Province, China's largest inland lake and saltwater lake. The fault is formed by the fault between the Datong Mountain, the Riyue Mountain and the Qinghai Nanshan Mountain in the Qilian Mountains.'''),
      ]
      ,
    );
  }

}
