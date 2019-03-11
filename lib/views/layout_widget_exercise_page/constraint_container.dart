import 'package:flutter/material.dart';

/**
 * 测试最外层是Scaffold时，内部控件的盒约束情况
 */
class ConstraintBoxLayout extends StatefulWidget {
  @override
  _ConstraintBoxLayoutState createState() => new _ConstraintBoxLayoutState();
}

class _ConstraintBoxLayoutState extends State<ConstraintBoxLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ConstraintBoxLayout'),),
      body:
      Container(
//        width: 100.0,
        height: 100.0,
        child: ListView.builder(
          itemCount: 50,
          itemBuilder: (context, index) {
            return Container(
              child: Text('$index'),
              alignment: Alignment.center,
            );
          },
          scrollDirection: Axis.horizontal,),
        color: Colors.red,
      ),
    );
  }
}
