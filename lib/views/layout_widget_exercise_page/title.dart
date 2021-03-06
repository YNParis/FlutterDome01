import 'package:flutter/material.dart';
import 'package:flutter_app_demo01/views/layout_widget_exercise_page/favorate_button.dart';

class TitleWidget extends StatefulWidget {

  @override
  TitleWidgetState createState() {
    return new TitleWidgetState();
  }
}

class TitleWidgetState extends State<TitleWidget> {
  int num = 41;
  bool isStar = false;
  Icon icon = Icon(Icons.star);

  @override
  Widget build(BuildContext context) {
    return new Row(
      children: <Widget>[
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, //里面的组件靠左排列
            children: <Widget>[
              Text(
                'Qinghai Lake',
                style:
                TextStyle(color: Color(0xff333333),
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0),
                textAlign: TextAlign.left,),
              Text(
                  'Qinghai Privince,China',
                  style:
                  TextStyle(color: Color(0xff666666),
                      fontSize: 20.0))
            ],
          ),),
        FavorateButton(),
      ],
    );
  }
}