import 'package:flutter/material.dart';
import 'dart:math' as math;

class ContainerLayoutRoute extends StatefulWidget {
  @override
  _ContainerLayoutRouteState createState() => new _ContainerLayoutRouteState();
}

class _ContainerLayoutRouteState extends State<ContainerLayoutRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ContainerLayout')),
      body: ContainerSizeRoute(),);
  }
}

//--------------------------------------Padding------------------------------------------

class PaddingRoute extends StatefulWidget {
  @override
  _PaddingRouteState createState() => new _PaddingRouteState();
}

class _PaddingRouteState extends State<PaddingRoute> {
  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.fromLTRB(50.0, 80.0, 20.0, 100.0),
        child: DecoratedBox(
          decoration: BoxDecoration(color: Colors.pink), child: Text('text'),));
  }
}

//-----------------------------------------ConstrainedBox--------------------------------
Widget redBox = DecoratedBox(
  decoration: BoxDecoration(color: Colors.red),
  child: Container(
    width: 300.0,
    height: 300.0,
  ),
);

class ConstrainedBoxRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //TODO 如果最外面是ConstrainedBox，不起作用。需将它包裹在一个具有XX属性的控件内
      body: ConstrainedBox(
        constraints: BoxConstraints(
            minWidth: double.infinity, //宽度尽可能大
            minHeight: 50.0, //最小高度为50像素
            maxHeight: 100.0
        ),
        child: Container(
            height: 150.0,
            child: redBox
        ),
      ),
    );
  }
}

class MultiConstrainedBoxRoute extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ConstrainedBox(
        constraints: BoxConstraints(
            maxHeight: 80.0, maxWidth: 100.0),
        child: ConstrainedBox(
          constraints: BoxConstraints(
              maxHeight: 40.0, maxWidth: 200.0),
          child: redBox,),),
    );
  }
}


//------------------------------------------SizedBox-------------------------------------------
class SizedBoxRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SizedBox(width: 80.0, height: 80.0, child: redBox,),);
  }
}

//---------------------------------------DecoratedBox-----------------------------------------
class DecoratedBoxRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: DecoratedBox(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.pink[300], Colors.blue[300]]),
          color: Colors.pink,
          boxShadow: [
            BoxShadow(
                color: Colors.grey,
                offset: Offset(2.0, 2.0), //阴影与控件之间错开的偏移量
                blurRadius: 4.0 //显示为阴影的虚化成都
            ),
            BoxShadow(
                color: Colors.red,
                offset: Offset(3.0, 3.0), //阴影与控件之间错开的偏移量
                blurRadius: 10.0 //显示为阴影的虚化成都
            ),
          ],
          borderRadius: BorderRadius.circular(10.0)), //四角圆角
      position: DecorationPosition.background,

      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 18.0),
        child: Text('Login', style: TextStyle(color: Colors.white),),),
    ),);
  }
}


//------------------------------------Transform沿轴倾斜---------------------------------
class TransformRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 300.0,
        height: 300.0,
        alignment: Alignment.center,
        child: Transform(
          transform: Matrix4.skewY(0.4),
          alignment: Alignment.topRight, //与bottomRight是同一个效果
          child: Container(
            child: const Text('Apartment for rent!'),
            padding: EdgeInsets.all(10.0),
            color: Colors.blue[200],
          ),
        ),
      ),);
  }
}

//--------------------------------------Transform平移----------------------------------------------

class TranslateRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: BoxDecoration(color: Colors.red),
        child: Transform.translate(
          offset: Offset(20.0, 15.0), child: Text('Translate'),),),
    );
  }
}

//------------------------------------Transform旋转----------------------------------------------
class RotateRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(decoration: BoxDecoration(color: Colors.red),
        child: Transform.rotate(angle: math.pi / 2, child: Text('Rotate'),),),
    );
  }
}
//------------------------------------Transform缩放----------------------------------------------
class ScaleRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(decoration: BoxDecoration(color: Colors.red),
        child: Transform.scale(scale: 2.0, child: Text('Scale'),),),

    );
  }
}

//--------------------------------------------RotatedBox旋转----------------------------------------
class RotateBoxRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Row(
      children: <Widget>[
        DecoratedBox(decoration: BoxDecoration(color: Colors.red),
          child: RotatedBox(
            quarterTurns: 1, //整型，代表几个90度
            child: Text('Rotated Box'),),
        ),
        Text('neighbour text')
      ],
    ));
  }
}

//--------------------------------------------Container----------------------------------------

class ContainerRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        body:
        Container(
          margin: EdgeInsets.only(left: 120.0, top: 30.0),
          constraints: BoxConstraints.tightFor(width: 200.0, height: 150.0),
          decoration: BoxDecoration(
              gradient: RadialGradient(
                  colors: [Colors.red, Colors.orange],
                  center: Alignment.bottomRight,
                  radius: 0.5
              ),
              boxShadow: [BoxShadow(
                  color: Colors.black54,
                  offset: Offset(2.0, 2.0),
                  blurRadius: 4.0
              ),
              ],
              borderRadius: BorderRadius.circular(10)
          ),
          transform: Matrix4.rotationZ(.2),
          //卡片旋转
          alignment: Alignment.center,
          child: Text(
            '5.20',
            style: TextStyle(color: Colors.white, fontSize: 40.0),),
        ),
      );
  }
}

//-----------------------------------------Container大小控制-------------------------------------------
class ContainerSizeRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      constraints: BoxConstraints(
          maxWidth: 300.0,
          maxHeight: 300.0
      ),
      width: 40.0, //与设置constraints参数的效果是一样的，同时设置的话这个优先
      height: 40.0,
      color: Colors.red,
    );
  }
}



