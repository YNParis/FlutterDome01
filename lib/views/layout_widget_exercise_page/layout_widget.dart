import 'package:flutter/material.dart';
import 'package:flutter_app_demo01/views/layout_widget_exercise_page/stack.dart';

class LayoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      body: Column(
        children: <Widget>[
          FlexLayout(),
          ExpandedLayout(),
          WrapLayout(),
          FlowLayout(),
          StackLayout('param title')
        ],
      )
      ,
    );
  }

}

class FlexLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Flex(direction: Axis.horizontal,
      children: <Widget>[
        Text('child1', style: TextStyle(
          decoration: TextDecoration.lineThrough,
        ),),
        Text('child1'),
      ],);
  }
}

class ExpandedLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Flex(direction: Axis.horizontal, children: <Widget>[
      Expanded(child: Text('expanded1'), flex: 1),
      Expanded(child: Text('expanded3'), flex: 1,),
      Expanded(child: Text('expanded4'), flex: 1,),
    ],);
  }

}

class WrapLayout extends StatelessWidget {
  //流式布局，控件是自适应大小的矩形，最宽是屏幕宽度
  //若宽度还能容纳下一个控件，则在右边接着显示，若不能，则换行显示
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Wrap(children: <Widget>[
      Text("mino"), //自动换行的控件
      Text("hello" * 5),
      Column(
        //宽度自适应大小
        children: <Widget>[
          Text("hello"), //自动换行的控件
          Text("beauty"), //自动换行的控件
        ],
      ),

    ],
      alignment: WrapAlignment.start,
      spacing: 30.0, //水平方向
//      runSpacing: 30.0, //垂直方向
    );
  }

}

/**
 * 自定义流式布局
 */
class FlowLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Flow(delegate: TestFlowDelegate(margin: EdgeInsets.all(10.0)),
      children: <Widget>[
        new Container(width: 30.0, height: 50.0, color: Colors.red,),
        new Container(width: 80.0, height: 80.0, color: Colors.green,),
        new Container(width: 80.0, height: 70.0, color: Colors.blue,),
        new Container(width: 80.0, height: 160.0, color: Colors.yellow,),
        new Container(width: 130.0, height: 30.0, color: Colors.brown,),
        new Container(width: 80.0, height: 80.0, color: Colors.purple,),
      ],);
  }

}

class TestFlowDelegate extends FlowDelegate {
  EdgeInsets margin = EdgeInsets.zero; //上下左右皆为0
  TestFlowDelegate({this.margin}); //是每一个子控件的margin

  @override
  void paintChildren(FlowPaintingContext context) {
    var x = margin.left;
    var y = margin.top;
    var lineH = 0.0;

    for (int i = 0; i < context.childCount; i++) {
      var w = x + margin.right + context
          .getChildSize(i)
          .width;
      var ch = context
          .getChildSize(i)
          .height + margin.top + margin.bottom;
      if (w < context.size.width) {
        //小于屏幕宽度
        context.paintChild(i, transform: Matrix4.translationValues(x, y, 0.0));
        x = w + margin.left;
        //对比其他整数，0:相同、1:大于、-1:小于
        if (lineH.compareTo(ch) < 0) {
          //取行高和子控件高度的较大值为新的行高
          lineH = ch;
        }
      } else {
        //需要换行
        x = margin.left;
        y = y + lineH;
        context.paintChild(i, transform: Matrix4.translationValues(x, y, 0.0));
        x = x + context
            .getChildSize(i)
            .width + margin.right + margin.left;
      }
    }
  }

  @override
  bool shouldRepaint(FlowDelegate oldDelegate) {
    return oldDelegate != this;
  }

  getSize(BoxConstraints constraints) {
    //指定Flow的大小，高度必须是确定的值，这个大小在绘制之前就会确定，所以不能用子控件的高度和来计算
    return Size(double.infinity, 280.0);
  }

}

