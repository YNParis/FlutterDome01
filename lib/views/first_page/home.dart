import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app_demo01/components/search_input.dart';
import 'package:flutter_app_demo01/model/widget.dart';
import 'package:flutter_app_demo01/resources/widget_name_to_icon.dart';
import 'package:flutter_app_demo01/routers/application.dart';
import 'package:flutter_app_demo01/utils/provider.dart';
import 'package:flutter_app_demo01/views/collection_page/collection_page.dart';
import 'package:flutter_app_demo01/views/first_page/first_page.dart';
import 'package:flutter_app_demo01/views/welcome_page/fourth_page.dart';
import 'package:flutter_app_demo01/views/widget_page/widget_page.dart';
import 'package:flutter_app_demo01/widgets/index.dart';

const int themeColor = 0xFFC91B3A;

class AppPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyHomePageState();
  }


}

class _MyHomePageState extends State<AppPage>
    with SingleTickerProviderStateMixin {

  WidgetControlModel widgetControlModel = new WidgetControlModel();
  TabController controller;
  bool isSearch = false;
  String data = '无';
  String data2ThirdPage = '这是传给thirdpage的值';
  static List tabData = [
    {'text': '业界动态', 'icon': new Icon(Icons.language)},
    {'text': 'WIDGET', 'icon': new Icon(Icons.extension)},
    {'text': '组件收藏', 'icon': new Icon(Icons.favorite)},
    {'text': '关于手册', 'icon': new Icon(Icons.import_contacts)},
  ];
  String appBarTitle = tabData[0]['text'];
  List<Widget> myTabs = [];

  Widget build(BuildContext context) {
    var db = Provider.db;

    return new Scaffold(
      appBar: AppBar(title: buildSearchInput(context)),
      body: new TabBarView(
          controller: controller,
          children: <Widget>[
            //TODO 加入页面
            new FirstPage(),
            new WidgetPage(),
            new CollectionPage(),
            new FourthPage(),

          ])
      ,
      bottomNavigationBar: Material(
        color: Colors.grey,
        child: SafeArea(child: Container(
          height:
          65.0,
          decoration: BoxDecoration(
              color: Colors.
              lightBlue,
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: const Color(0xFFd0d0d0),
                  blurRadius:
                  3.0,
                  spreadRadius: 2.0,
                  offset: Offset(
                      -1.0, -1.0),
                )
              ]
          )
          ,
          child: TabBar(controller: controller,
              indicatorColor
                  : Theme
                  .of(context)
                  .primaryColor,
              indicatorWeight: 3.0,
              labelColor: Theme
                  .of(
                  context
              )
                  .
              primaryColor
              ,
              unselectedLabelColor
                  :
              const
              Color
                (
                  0xFF8E8E8E
              )
              ,
              tabs
                  :
              myTabs
          )
          ,
        )
        )
        ,

      )
      ,
    );
  }

  @override
  void initState() {
    super.initState();
    controller = new TabController(initialIndex: 0, length: 4, vsync: this);
    for (int i = 0; i < tabData.length; i++) {
      myTabs.add(new Tab(text: tabData[i]['text'], icon: tabData[i]['icon']));
    }
    controller.addListener(() {
      if (controller.indexIsChanging) {
        _onTabChange();
      }
    });
    Application.controller = controller;
  }

  void _onTabChange() {
    if (this.mounted) {
      this.setState(() {
        appBarTitle = tabData[controller.index]['text'];
      });
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void onWidgetTap(WidgetPoint widgetPoint, BuildContext context) {
    List widgetDemosList = new WidgetDemoList().getDemos();
    String targetName = widgetPoint.name;
    String targetRouter = '/category/error/404';
    widgetDemosList.forEach((item) {
      if (item.name == targetName) {
        targetRouter = item.routerName;
      }
    });
    Application.router.navigateTo(context, "${targetRouter}");
  }

  Widget buildSearchInput(BuildContext context) {
    return new SearchInput((value) async {
      if (value != '') {
        List<WidgetPoint> list = await widgetControlModel.search(value);
        return list.map((item) =>
        new MaterialSearchResult<String>(
          value: item.name,
          icon: WidgetName2Icon.icons[item.name] ?? null,
          text: 'widget',
          onTap: () {
            onWidgetTap(item, context);
          },
        )).toList();
      } else {
        return null;
      }
    }, (value) {}, () {});
  }

}