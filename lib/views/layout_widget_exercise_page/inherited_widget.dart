import 'package:flutter/material.dart';

class InheritedLayout extends StatefulWidget {
  @override
  _InheritedLayoutState createState() => new _InheritedLayoutState();

}

class _InheritedLayoutState extends State<InheritedLayout> {
  int count = 0;
  String str = 'string';


  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print('didChangeDependencies');
  }

  @override
  Widget build(BuildContext context) {
    //build里面调用了包含_ChildWidget，需要调用_ChildWidget控件的didChangeDependencies
    return Scaffold(
      appBar: AppBar(title: Text('InheritedWidget'),),
      body: Center(
        child: ShareDataWidget(
          strData: str,
          data: count,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(padding: const EdgeInsets.only(bottom: 20.0),
                child: _ChildWidget(),),
              RaisedButton(child: Text('increment'),
                onPressed: () =>
                    setState(() =>
                    str = str + '-'
                    ),)
            ],
          ),),
      )
      ,
    );
  }
}


class ShareDataWidget extends InheritedWidget {
  ShareDataWidget({
    @required this.data,
    @required this.strData,

    Widget child
  }) :super(child: child);

  int data; //需要在子树中共享的数据，保存点击次数
  String strData = 'string';

  //定义一个便捷方法，方便子树中的widget获取共享数据
  static ShareDataWidget of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(ShareDataWidget);
  }

  //该回调决定当data发生变化时，是否通知子树中依赖data的Widget
  @override
  bool updateShouldNotify(ShareDataWidget oldWidget) {
    //如果返回false，则子树中依赖(build函数中有调用)本widget
    //的子widget的`state.didChangeDependencies`会被调用
//    return oldWidget.data != data;
    return oldWidget.strData.length != strData.length;
  }

}

class _ChildWidget extends StatefulWidget {
  @override
  __ChildWidgetState createState() => new __ChildWidgetState();
}

class __ChildWidgetState extends State<_ChildWidget> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    print('index=${index++}');
    return Text(ShareDataWidget
        .of(context)
        .strData);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    //在执行者这个函数的时候，该控件的build方法将会被调用
    print('dependences change...');
  }
}

