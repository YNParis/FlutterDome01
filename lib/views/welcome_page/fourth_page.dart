import 'package:flutter/material.dart';

class FourthPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new FourthPageState();
  }

}

class FourthPageState extends State<FourthPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      body: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,//父控件居中
            children: <Widget>[
              Text('${getText(OffsetPoint(1, 2, 10))}'),
              Text('${getText(OffsetPoint(1, 2, 0))}'),
              Text('${getText(OffsetPoint(1, 2, 7))}')
            ],
          )
      ),
    );
  }

  getText(OffsetPoint point) {
    var point = OffsetPoint(1, 2, 10);
    point.x = 32;
    return point.x;
  }

}

class OffsetPoint {
  int _x;
  int _y;
  int offset;

  OffsetPoint(int x, int y, int offset)
      :_x=x,
        _y=y,
        this.offset=offset {}

  int get x => _x + offset;

  int get y => _y + offset;

  void set x(int x) => _x = x;

  void set y(int y) => _y = y;

  @override String toString() {
    return "OffsetPoint{x=$x, y=$y}";
  }
}


