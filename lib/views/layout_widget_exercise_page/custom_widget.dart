import 'package:flutter/material.dart';
import 'dart:math';

class CustomWidgetRoute extends StatefulWidget {
  @override
  _CustomWidgetRouteState createState() => new _CustomWidgetRouteState();
}

class _CustomWidgetRouteState extends State<CustomWidgetRoute> {
  double _turns = .0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('CustomWidgetRoute'),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TurnBox(
              turns: _turns,
              speed: 1000,
              child: Icon(Icons.refresh, size: 80.0, color: Colors.pink,),
            ),
            TurnBox(
              turns: _turns,
              speed: 500,
              child: Icon(Icons.refresh, size: 100.0, color: Colors.teal,),
            ),
            RadiantButton(
                child: Text('顺时针旋转'),
                width: 200.0,
                height: 80.0,
                colors: [Colors.pink[300], Colors.pink[500]],
                onTap: () => (setState(() => _turns += 0.3))),
            RadiantButton(
                child: Text('逆时针旋转'),
                width: 200.0,
                height: 80.0,
                onTap: () => (setState(() => _turns -= 1))),

          ],
        ),
      ),
    );
  }
}

//--------------------------------------组合一自定义渐变色按钮----------------------------------------
class RadiantButton extends StatelessWidget {

  RadiantButton({
    @required this.child,
    this.height,
    this.width,
    this.colors,
    this.onTap,
  });

  final Widget child;
  final double height;
  final double width;
  final List<Color> colors;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    List<Color> _colors = colors ??
        [
          themeData.primaryColor,
          themeData.primaryColorDark ?? themeData.primaryColor
        ];
    return DecoratedBox(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: _colors),
            borderRadius: BorderRadius.circular(5.0)),
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            splashColor: _colors.last,
            highlightColor: Colors.transparent,
            onTap: onTap,
            child: ConstrainedBox(
              constraints: BoxConstraints.tightFor(
                  height: height, width: width),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DefaultTextStyle(
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      child: child),),
              ),),
          ),
        ));
  }

}

//------------------------------------组合二任意角度旋转控件，有旋转动画------------------------------------------
class TurnBox extends StatefulWidget {

  const TurnBox({
    Key key,
    this.child,
    this.speed = 200,
    this.turns = .0
  }) :super(key: key);

  final double turns;
  final int speed;
  final Widget child;

  @override
  _TurnBoxState createState() => new _TurnBoxState();
}

class _TurnBoxState extends State<TurnBox> with SingleTickerProviderStateMixin {

  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this,
        lowerBound: -double.infinity,
        upperBound: double.infinity);
    _controller.value = widget.turns;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _controller,
      child: widget.child,);
  }

  @override
  void didUpdateWidget(TurnBox oldWidget) {
    super.didUpdateWidget(oldWidget);
    //旋转角度发生变化时执行过度动画
    if (oldWidget.turns != widget.turns) {
      _controller.animateTo(
          widget.turns,
          duration: Duration(milliseconds: widget.speed ?? 200),
          curve: Curves.fastOutSlowIn);
    }
  }
}

//----------------------------------------------重绘制 渐变色进度条-----------------------------------
class GradientCircularProgress extends StatelessWidget {

  GradientCircularProgress({
    this.colors
  }) :super();

  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    double _offset = .0;
    Color color = Theme
        .of(context)
        .accentColor;
    var _colors = colors ?? [color, color];

    return Transform.rotate(
      angle: -pi / 2.0 - _offset,
//      child: ,
    );
  }

}

//画笔
class _GradientCircularProgressPainter extends CustomPainter {


  @override
  void paint(Canvas canvas, Size size) {


  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

}

