import 'package:flutter/material.dart';
import 'dart:math';

//--------------------------------自定义绘制五子棋盘-----------------------------------------

class GomokuRoute extends StatefulWidget {
  @override
  _GomokuRouteState createState() => new _GomokuRouteState();
}

class _GomokuRouteState extends State<GomokuRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('五子棋'),),
      body: Center(
        child: CustomPaint(
          size: Size(300.0, 300.0),
          painter: MyPainter(),
        ),
      ),
    );
  }
}


class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double eh = size.height / 15; //每一格的高度
    double ew = size.width / 15; //每一格的宽度
    var paint = Paint()
      ..color = Color(0x77cdb175)
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    //画纸黄色背景
    canvas.drawRect(Offset.zero & size, paint);

    paint
      ..style = PaintingStyle.stroke
      ..color = Colors.black
      ..strokeWidth = 1.0;

    //画格子
    for (int i = 0; i <= 15; i++) {
      canvas.drawLine(Offset(0, eh * i), Offset(size.width, eh * i), paint);
    }
    for (int i = 0; i <= 15; i++) {
      canvas.drawLine(Offset(ew * i, 0), Offset(ew * i, size.height), paint);
    }

    paint
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    //画白棋
    canvas.drawCircle(Offset(ew * 5, eh * 7), min(ew, eh) / 2 - 2, paint);

    paint.color = Colors.black;
    //画黑棋
    canvas.drawCircle(Offset(ew * 7, eh * 7), min(ew, eh) / 2 - 2, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

}


