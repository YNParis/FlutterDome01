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

  static GlobalKey<ScaffoldState> _globalKey = new GlobalKey();
  TabController controller;
  List tabs = ['HOME', 'ANIMATION', 'FUNCTIONS'];
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
//                Scaffold.of(context).openDrawer();//和下面的语句实现的效果是一样的
                _globalKey.currentState.openDrawer();
              });
        }),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.share),
              onPressed: () {
                //弹出分享页面
                _showDialog(context);
              }), //标题栏右侧的菜单，做分享按钮
        ],

      ),
      body: TabBarView(
        controller: controller,
        children: <Widget>[
          PagesListRoute(),
          CustomScrollViewPage(),
          StaggerDemo(),
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
          Tab(text: tabs[1], icon: Icon(Icons.book),),
          Tab(text: tabs[2], icon: Icon(Icons.list),),
        ],

      ),
    );
  }


  void _showDialog(BuildContext context) {
    var titles = <String>['微信好友', '朋友圈', '微博', 'QQ好友', 'QQ空间'];
    var imgs = <String>[
      'images/wechat_logo.png',
      'images/wechat_logo.png',
      'images/wechat_logo.png',
      'images/wechat_logo.png',
      'images/wechat_logo.png'
    ];

    //从下方弹出的dialog，高度是builder返回控件的高度
    showModalBottomSheet
      (context: context, builder: (_) =>
        Container(
          height: 200.0,
          child: Column(
            children: <Widget>[
              Text('分享到'),
              Container(
                height: 120.0,
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 5,
                      childAspectRatio: 0.7 //宽高比
                  ),
                  itemCount: 5,
                  itemBuilder: (c, i) =>
                      _ShareItem(img: imgs[i], title: titles[i], index: i,),
                  physics: NeverScrollableScrollPhysics(),
                ),
              ),
              FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('取消'))
            ],
          ),

        ));
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
    'camera',
    'AndroidView',
    'net',
    'gomoku',
    'customWidget',
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
    return ListView.separated(

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
    );
  }

}

class _ShareItem extends StatefulWidget {
  _ShareItem({
    this.title,
    this.img,
    this.index
  });

  final String img;
  final String title;
  final int index;

  @override
  __ShareItemState createState() => new __ShareItemState();
}

class __ShareItemState extends State<_ShareItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            widget.img,
            height: 80.0,
            width: 80.0,
            fit: BoxFit.cover,),
          Text(
            widget.title,
            overflow: TextOverflow.ellipsis,
          )
        ],

      ),
      onTap: () {
        _shareToSpecifiedPlatform(widget.index);
      },
    );
  }

  _shareToSpecifiedPlatform(int index) {
    switch (index) {
      case 0:
      //分享到微信好友
        break;
      case 1:
      //分享到微信朋友圈
        break;
      case 2:
      //分享到微博

        break;
      case 3:
      //分享到QQ好友
        break;
      case 4:
      //分享到QQ空间
        break;
      default:
      //Do nothing.
        break;
    }
  }
}



