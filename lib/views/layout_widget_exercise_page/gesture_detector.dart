import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class GestureDetectorRoute extends StatefulWidget {
  @override
  _GestureDetectorRouteState createState() => new _GestureDetectorRouteState();
}

/**
 * 调用手指识别，要用一个GestureDetector作父控件
 * 当同时监听onTap和onDoubleTap事件时，当用户触发tap事件时，会有200毫秒左右的延时，
 * 这是因为当用户点击完之后很可能会再次点击以触发双击事件，所以GestureDetector会等
 * 一断时间来确定是否为双击事件。如果用户只监听了onTap（没有监听onDoubleTap）事件时，
 * 则没有延时
 */
class _GestureDetectorRouteState extends State<GestureDetectorRoute> {
  String _operation = 'No Gesture detected';

  @override
  Widget build(BuildContext context) {
//    return Center(
//      child: GestureDetector(
//        child: Container(
//          child: Text(_operation, style: TextStyle(color: Colors.white),),
//          width: 200.0,
//          height: 100.0,
//          alignment: Alignment.center,
//          color: Colors.blue[500],
//        ),
//        onTap: () => updateText('onTap'),
//        onDoubleTap: () => updateText('onDoubleTap'),
//        onLongPress: () => updateText('onLongPress'),
//      ),
//    );
    return Scaffold(body: GestureRecognizerRoute(),
      appBar: AppBar(title: Text('GestureDetector'),),);
  }

  void updateText(String text) {
    setState(() {
      _operation = text;
    });
  }
}


//-------------------------------控件任意方向拖动---------------------------------
class _Drag extends StatefulWidget {
  @override
  _DragState createState() => new _DragState();
}

class _DragState extends State<_Drag> {
  //本例中是可以朝任意方向移动，若只规定朝一个方向移动，则只改变其中一个的值即可
  double _top = 10.0; //距顶部的偏移
  double _left = 10.0; //距左边的偏移

  @override
  Widget build(BuildContext context) {
    return Stack(
      //相当于一个相对布局
      children: <Widget>[
        //Positioned是一个可以指定位置的控件
        Positioned(
            top: _top,
            left: _left,
            child: GestureDetector(
              child: CircleAvatar(
                child: Text('A'),
              ),
              onPanDown: (DragDownDetails e) {
                //手指按下时会触发此回调
                //globalPosition为用户按下的位置相对于屏幕(而非父widget)原点(左上角)的偏移
                print('用户手指按下：${e.globalPosition}');
              },
              onPanUpdate: (DragUpdateDetails e) {
                //用户手指滑动时，更新偏移，重新构建
                //当用户在屏幕上滑动时，会触发多次Update事件，
                // delta指一次Update事件的滑动的偏移量
                setState(() {
                  _left += e.delta.dx;
                  _top += e.delta.dy;
                });
              },
              onPanEnd: (DragEndDetails e) {
                //打印滑动结束时在x、y轴上的速度
                //该属性代表用户抬起手指时的滑动速度(包含x、y两个轴的），
                // 示例中并没有处理手指抬起时的速度，
                // 常见的效果是根据用户抬起手指时的速度做一个减速动画
                print(e.velocity);
              },
            )),
      ],
    );
  }
}

//-------------------------------------图片缩放--------------------------------------------
class ScaleTestRoute extends StatefulWidget {
  @override
  _ScaleTestRouteState createState() => new _ScaleTestRouteState();
}

class _ScaleTestRouteState extends State<ScaleTestRoute> {

  double _width = 200.0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        child: Image.asset('images/lake.png', width: _width),
        onScaleUpdate: (ScaleUpdateDetails e) {
          setState(() {
            //缩放倍数在0.8到10倍之间
            _width = 200 * e.scale.clamp(.8, 2.0);
          });
        },
        onTap: () {

        },
      ),
    );
  }
}

//---------------------------------水平、垂直两个方向分别拖动-----------------------------------
class BothDirectionRoute extends StatefulWidget {


  @override
  _BothDirectionRouteState createState() => new _BothDirectionRouteState();
}

class _BothDirectionRouteState extends State<BothDirectionRoute> {
  double _top = 10.0;
  double _left = 10.0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          child: GestureDetector(
            child: CircleAvatar(
              child: Text('B'),
            ),
            onVerticalDragUpdate: (DragUpdateDetails e) {
              setState(() {
                _top += e.delta.dy;
              });
            },
            onHorizontalDragUpdate: (DragUpdateDetails e) {
              setState(() {
                _left += e.delta.dx;
              });
            },
          ),
          top: _top,
          left: _left,)
      ],
    );
  }
}

//-------------------------------------手势冲突-----------------------------------

class GestureConflictRoute extends StatefulWidget {
  @override
  _GestureConflictRouteState createState() => new _GestureConflictRouteState();
}

class _GestureConflictRouteState extends State<GestureConflictRoute> {
  double _left = 10.0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          left: _left,
          top: 30.0,
          child: Listener(
              onPointerDown: (e) {
                print('onPointerDown');
              },
              onPointerUp: (e) {
                print('onPointerUp');
              },
              child: GestureDetector(
                child: CircleAvatar(
                  child: Text('C'),
                ),
                onHorizontalDragUpdate: (e) {
                  setState(() {
                    _left += e.delta.dx;
                  });
                },
                onHorizontalDragEnd: (e) {
                  print('onHorizontalDragEnd');
                },
                onTapUp: (e) {
                  print('onTapUp');
                },
                onTapDown: (e) {
                  print('onTapDown');
                },
              )
          ),)
      ],);
  }
}

//--------------------------------------------GestureRecognizer-----------------------------
//给一段富文本（RichText）的不同部分分别添加点击事件处理器
//extSpan并不是一个Widget，这时我们不能用GestureDetector，
// 但TextSpan有一个recognizer属性，它可以接收一个GestureRecognizer
class GestureRecognizerRoute extends StatefulWidget {
  @override
  _GestureRecognizerRouteState createState() =>
      new _GestureRecognizerRouteState();
}

class _GestureRecognizerRouteState extends State<GestureRecognizerRoute> {

  TapGestureRecognizer _tapGestureRecognizer = TapGestureRecognizer();
  bool _toggle = false;

  @override
  void dispose() {
    _tapGestureRecognizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text.rich(TextSpan(
        children: [
          TextSpan(
              text: '你好哇，'
          ),
          TextSpan(
            text: '李银河',
            style: TextStyle(
              fontSize: 30.0,
              color: _toggle ? Colors.pink : Colors.blue,
            ),
            recognizer: _tapGestureRecognizer
              ..onTap = () {
                setState(() {
                  _toggle = !_toggle;
                });
              },
          )
        ],
      )),
    );
  }
}







