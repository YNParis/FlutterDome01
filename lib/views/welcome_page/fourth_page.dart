import 'package:flutter/material.dart';

class FourthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Stack(
      //相对布局，默认都在左上角，通过Alignment来控制相对children之间的相对位置
      alignment: const Alignment(0, 0),
      //参数（0,0）表示正中间，负号表示向左向上，取值（-1,1）之间，-0.2表示偏移父组件的一半的20%
      children: <Widget>[
        Text('child1'),
        Text('child2'),
        Container(
          width: 400.0,
          height: 200.0,
          color: Colors.blue,
          decoration: BoxDecoration(
              border: Border.all() //加边框
          ),
        ),
      ],
    );
  }

}

class FourthPage1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new FourthPageState();
  }

}

class FourthPageState extends State<FourthPage1> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, //父控件居中
            children: <Widget>[
              Text('${getText(OffsetPoint(1, 2, 10))}'),
              Text('${getText(OffsetPoint(1, 2, 0))}'),
              Text('${getText(OffsetPoint(1, 2, 7))}'),
              RaisedButton(onPressed: () {
                showDialog(
                  context: context,
                  builder: (_) {
                    return AlertDialog(
                      content: Text('Hide me!'),
                      actions: <Widget>[
                        FlatButton(onPressed: () {
                          Navigator.pop(context);
                        }, child: Text('ok')),
                        RaisedButton(onPressed: null, child: Text('cancel'),)
                      ],
                    );
                  },
                );
              },
                child: Text('touch me~~'),),
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


