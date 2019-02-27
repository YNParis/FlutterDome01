import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_demo01/routers/application.dart';
import 'package:flutter_app_demo01/routers/routers.dart';
import 'package:flutter_app_demo01/views/layout_widget_exercise_page/button.dart';

class ScrollViewPage extends StatefulWidget {
  @override
  _ScrollViewState createState() => new _ScrollViewState();
}

class _ScrollViewState extends State<ScrollViewPage> {
  String str = 'ABCDEFGHIJKLMN' * 2;

  @override
  Widget build(BuildContext context) {
    return new SingleChildScrollView(
      child: Row(
        children: str.split('').map((c) => Text(c, textScaleFactor: 2.0,))
            .toList(),
      ),
      scrollDirection: Axis.horizontal,
    );
  }
}

class ListViewPage extends StatefulWidget {
  @override
  _ListViewPageState createState() => new _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {

  var datas = ('ABCDEFGHIJKLMN' * 2).split('');
  static const String loading = 'loading...';
  var _words = <String>[loading]; //数组的第一个元素是loading

  @override
  void initState() {
    _retrieveData();
  }

  void _retrieveData() {
    Future.delayed(Duration(seconds: 2)).then((e) {
      _words.insertAll(_words.length - 1,
          generateWordPairs().take(20).map((e) => e.asPascalCase).toList());
      setState(() {
//重新构建列表
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    //-----------------------------------------------------------------
    //返回一个没有分割线的listview，使用itembuilder创建子条目
//    return new ListView.builder(
//      shrinkWrap: true,
//      itemCount: datas.length, //必须指定
//      itemBuilder: (BuildContext context, int index) {
//        return ListTile(
//          title: CustomButton(context, Icons.map, datas[index]),
//        );
//      },
//    );

    //--------------------------------------------------------------------
    //返回一个有分割线的listview，使用itembuilder创建子条目
//    Widget d1 = Divider(color: Colors.blue, height: 2.0,);
//    Widget d2 = Divider(color: Colors.pink, height: 2.0,);
//    return new ListView.separated(
//        itemBuilder: (BuildContext context, int index) {
//          return ListTile(
//            title: CustomButton(context, Icons.map, datas[index]),
//            onTap: () {
//              return AlertDialog(title: Text(datas[index]));
//            },
//          );
//        },
//        separatorBuilder: (BuildContext context, int index) {
//          return index % 2 == 1 ? d1 : d2;
//        },
//        itemCount: datas.length);

    //---------------------------------------------------------
    //无线加载列表项，拉到底部显示loading...提示
//    Widget d1 = Divider(color: Colors.blue, height: 2.0,);
//    Widget d2 = Divider(color: Colors.pink, height: 2.0,);
//    return new ListView.separated(
//        itemBuilder: (BuildContext context, int index) {
//          if (_words[index] == loading) {
//            //已经到底部
//            if (_words.length - 1 < 100) {
//              //小于100条数据
//              _retrieveData();
//              return Container(
//                //加载时显示loading
//                child: SizedBox(
//                  height: 24.0,
//                  width: 24.0,
//                  child: CircularProgressIndicator(
//                    strokeWidth: 2.0,
//                  ),
//                ),
//                padding: const EdgeInsets.all(16.0),
//                alignment: Alignment.center,
//              );
//            } else {
//              //提示没有更多数据
//              return Container(
//                child: Text(
//                  'No more data.', style: TextStyle(color: Colors.grey),),
//                padding: EdgeInsets.all(16.0),
//                alignment: Alignment.center,
//              );
//            }
//          }
//          return ListTile(
//            title: Text(_words[index]),
//          );
//        },
//        separatorBuilder: (context, index) =>
//            Divider(height: 2.0, color: Colors.blue,),
//        itemCount: _words.length);
    //-------------------------------------------------------------------------------------
    //给列表添加表头
    return Column(
      children: <Widget>[
        ListTile(title: Text('商品列表'),),
        Expanded(child: ListView.separated(
            itemBuilder: (context, index) =>
                ListTile(title: Text(datas[index]),),
            separatorBuilder: (context, index) => Divider(height: .0,),
            itemCount: datas.length))
      ],
    );
  }
}

class GridViewPage extends StatefulWidget {
  @override
  _GridViewPageState createState() => new _GridViewPageState();
}

class _GridViewPageState extends State<GridViewPage> {
  @override
  Widget build(BuildContext context) {
    return new GridView.builder(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200.0, //该属性表示每一个item所占的宽度，能放几个放几个，放不下换行，有自适应的效果
          childAspectRatio: 2.0),
      itemBuilder: (context, index) =>
          GridTile(child: Text('${index}',
            style: TextStyle(decoration: TextDecoration.underline),)),
      itemCount: 100,);
  }
}

class InfiniteGridView extends StatefulWidget {
  @override
  _InfiniteGridViewState createState() => new _InfiniteGridViewState();
}

class _InfiniteGridViewState extends State<InfiniteGridView> {
  List<IconData> _icons = []; //保存icons数据

  @override
  void initState() => _retrieveIcons();

  @override
  Widget build(BuildContext context) {
    return new GridView.builder
      (
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(

          crossAxisCount: 3,
          childAspectRatio: 1.0
      ),
      itemBuilder: (context, index) {
        if (index == _icons.length - 1 && _icons.length < 200) {
          //显示到最后一个并且总数小于200
          _retrieveIcons();
        }
        return Icon(_icons[index]);
      }
      ,
      itemCount: _icons.length,

    );
  }

  void _retrieveIcons() {
    Future.delayed(Duration(microseconds: 2000)).then((e) {
      setState(() {
        _icons.addAll([
          Icons.map,
          Icons.school,
          Icons.business,
          Icons.home,
          Icons.router,
        ]);
      });
    });
  }
}

class CustomScrollViewPage extends StatelessWidget {
  //整合两个scrollview，如listview和gridview
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Material(
      child: CustomScrollView(
        slivers: <Widget>[
          //AppBar，包含一个导航栏
          SliverAppBar(
            pinned: true,
            expandedHeight: 250.0,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('demo'),
              background: Image.asset('./images/lake.png',
                  fit: BoxFit.cover),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(8.0),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate((context, index) =>
                  Container(
                    child: Text('grid item $index'),
                    color: Colors.cyan[100 * (index % 9)],
                    alignment: Alignment.center,
                  ),
                childCount: 20,
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                childAspectRatio: 4.0,
              ),
            ),
          ),
          SliverFixedExtentList(
            delegate: SliverChildBuilderDelegate(
                  (context, index) =>
                  Container(
                    color: Colors.lightBlue[100 * (index % 9)],
                    child: new Text('list item $index'),
                    alignment: Alignment.center,
                  ),
              childCount: 50,
            ),
            itemExtent: 50.0,
          )
        ],
      ),
    );
  }
}

class ScrollControllerState extends StatefulWidget {
  @override
  _ScrollControllerStateState createState() =>
      new _ScrollControllerStateState();
}

class _ScrollControllerStateState extends State<ScrollControllerState> {

  ScrollController _controller = ScrollController(keepScrollOffset: true);
  bool showToTopBtn = false;

  @override
  void initState() {
    _controller.addListener(() {
      print(_controller.offset);
      if (_controller.offset < 1000 && showToTopBtn) {
        setState(() {
          showToTopBtn = false;
        });
      } else if (_controller.offset >= 1000 && !showToTopBtn) {
        setState(() {
          showToTopBtn = true;
        });
      }
    });
    _controller.
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Scrollbar(
        child: ListView.builder(
          itemBuilder: (context, index) =>
              ListTile(title: Text('$index'),
                onTap: () =>
                    Application.router.navigateTo(context, Routes.stack),),
          itemCount: 100,
          itemExtent: 50.0,
          controller: _controller,
        ),),
      floatingActionButton: !showToTopBtn ? null : FloatingActionButton(
        onPressed: () {
          _controller.animateTo(
              .0, //设置回滚到哪里，一般顶部的话是0.0或者.0，可以指定一个任意的位置
              duration: Duration(milliseconds: 3000),
              curve: Curves.fastOutSlowIn);
        },
        child: Icon(Icons.arrow_upward),
      ),

    );
  }
}













