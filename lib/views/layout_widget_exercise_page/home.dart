import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_demo01/main.dart';
import 'package:flutter_app_demo01/routers/application.dart';
import 'package:flutter_app_demo01/routers/router_handler.dart';
import 'package:flutter_app_demo01/routers/routers.dart';
import 'package:flutter_app_demo01/views/layout_widget_exercise_page/animation_test.dart';
import 'package:flutter_app_demo01/views/layout_widget_exercise_page/gesture_detector.dart';
import 'package:flutter_app_demo01/views/layout_widget_exercise_page/layout_widget.dart';
import 'package:flutter_app_demo01/views/layout_widget_exercise_page/scrollview.dart';
import 'package:flutter_app_demo01/views/layout_widget_exercise_page/stack.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {

  var _selectedIndex = 1;
  static GlobalKey<ScaffoldState> _globalKey = new GlobalKey();
  TabController controller;
  List tabs = ['NEWS', 'HISTORY', 'PICTURE'];
  Router router = new Router();
  String stackPage = Routes.stack;


  @override
  void initState() {
    controller = TabController(length: tabs.length, vsync: this);
    router.define(stackPage, handler: stackHandler);
  }

  @override
  Widget build(BuildContext context) {
    Application.controller = controller;
    controller.addListener(() {
      _onItemTapped;
    });
    return Scaffold(
      key: _globalKey,
      appBar: AppBar(
        title: Text('Flutter Demo01'),
        leading: Builder(builder: (context) {
          //自定义leading，设置侧滑菜单的按钮，默认是菜单按钮三条横线，默认也有点击时间，是打开左侧drawer菜单
          return IconButton(
              icon: Icon(Icons.dashboard),
              color: Colors.white,
              onPressed: () {
//                Scaffold.of(context).openDrawer();
                _globalKey.currentState.openDrawer();
              });
        }),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.share),
              onPressed: () {
//                Application.router.navigateTo(context, "$stackPage");
                //弹出分享页面
                _showDialog(context);
              }), //标题栏右侧的菜单，做分享按钮
        ],

      ),
      body: TabBarView(
        controller: controller,
        children: <Widget>[
          CustomScrollViewPage(),
          StaggerDemo(),
          PagesListRoute(),
        ],
      ),
      drawer: new MyDrawer(),
      bottomNavigationBar: TabBar(
        controller: controller,
        indicatorColor: Theme
            .of(context)
            .primaryColor,
        //tab标签的下划线颜色
        indicatorWeight: 3.0,
        labelColor: Theme
            .of(context)
            .primaryColor,
        unselectedLabelColor: const Color(0xFF8E8E8E),
        tabs: <Widget>[
          Tab(text: tabs[0], icon: Icon(Icons.home),),
          Tab(text: tabs[1], icon: Icon(Icons.business),),
          Tab(text: tabs[2], icon: Icon(Icons.school),),
        ],

      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) =>
          AlertDialog(
            title: Text('分享至'),
            actions: <Widget>[
              FlatButton(onPressed: () {
                Navigator.of(context).pop();
              }, child: Text('OK'))
            ],
          ),);
  }
}

class MyDrawer extends StatelessWidget {

  const MyDrawer({
    Key key,
  }) :super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: MediaQuery.removePadding(
          context: context,
          removeTop: true, //列表上方的空白
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: ClipOval(
                        child: Image.asset(
                          "images/lake.png",
                          width: 80,),

                      ),),
                    Text(
                      "Qinghai Lake",
                      style: TextStyle(
                          fontWeight: FontWeight.bold
                      ),
                    )
                  ],
                ),),
              Expanded(child: ListView(
                children: <Widget>[
                  ListTile(
                    leading: const Icon(Icons.add),
                    title: const Text('Add account'),
                  ),
                  ListTile(
                    leading: const Icon(Icons.settings),
                    title: const Text('Manage accounts'),
                  ),
                ],
              ))

            ],
          )),
    );
  }

}

class PagesListRoute extends StatefulWidget {
  @override
  _PagesListRouteState createState() => new _PagesListRouteState();
}

class _PagesListRouteState extends State<PagesListRoute> {

  var titles = <String>[
    'gesture-detector',
    'animation',
    'container',
    'willpopscope',
    'themeData',
    'pointer',
    'inheritedWidget',
    'constriant',
    'notification'
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
//        Container(
//          child: Text('路由列表', style: TextStyle(color: Colors.white),
//            textScaleFactor: 1.5,),
//          //不设置宽度默认是最大
//          padding: const EdgeInsets.all(20.0),
//          color: Theme
//              .of(context)
//              .primaryColor,
//          alignment: Alignment.centerLeft,
//        ),
        Expanded(
            child: ListView.separated(

              itemCount: titles.length,
              separatorBuilder: (context, index) =>
                  Divider(
                    height: 2.0,
                    color: Theme
                        .of(context)
                        .primaryColor,
                  ),
              itemBuilder: (context, index) =>
                  ListTile(
                    title: Text(titles[index]),
                    onTap: () {
                      Application.router.navigateTo(
                          context, '/${titles[index]}');
                    },
                  ),
            ))
      ],
    );
  }

}


