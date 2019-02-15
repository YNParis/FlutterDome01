import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //随机产生一个英文单词
    return new MaterialApp(
      title: 'My app',
      theme: new ThemeData(
        primaryColor: Colors.grey,

      ),
//      home: new RandomWords(),
      home: new MyScaffold(),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new RandomWordsState();
  }

}

class RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);
  final _saved = new Set<WordPair>();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return new Scaffold(
      appBar: AppBar(
        title: new Text('Flutter Demo01'),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.list), onPressed: _pushSaved),
        ],),
      body: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions() {
    return new ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, i) {
        if (i.isOdd) return new Divider();
        //表示i除以2向下取整，计算当前实际有多少个单词
        //除以2的意思是：分割线算一个，单词算一个
        final index = i ~/ 2;

        if (index >= _suggestions.length) {
          // ...接着再生成10个单词，然后添加到建议列表
          _suggestions.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_suggestions[index]);
      },
    );
  }

  Widget _buildRow(WordPair pair) {
    final alreadySaved = _saved.contains(pair);
    return new ListTile(
      title: new Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: new Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        //在Flutter的响应式风格的框架中，
        // 调用setState() 会为State对象触发build()方法，从而导致对UI的更新
        setState(() {
          if (alreadySaved) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        });
      },
    );
  }

  void _pushSaved() {
    Navigator.of(context).push(
      new MaterialPageRoute(
        builder: (context) {
          final tiles = _saved.map(
                (pair) {
              return new ListTile(
                title: new Text(
                  pair.asPascalCase,
                  style: _biggerFont,
                ),
              );
            },
          );
          final divided = ListTile
              .divideTiles(
            context: context,
            tiles: tiles,
          )
              .toList();
          return new Scaffold(
            appBar: new AppBar(
              title: new Text('Saved Suggestions'),
            ),
            body: new ListView(children: divided),
          );
        },
      ),
    );
  }

}

class MyAppBar extends StatelessWidget {

  MyAppBar({this.title});

  final Widget title;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      height: 56.0,
      padding: const EdgeInsets.symmetric(horizontal: 10.0), //水平方向的padding为10
      decoration: BoxDecoration(color: Colors.blue[300]),
      child: Row(
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.menu),
            tooltip: 'Navigation menu',
            onPressed: null, //大写的Null会报错
          ),
          Expanded(child: title),
          IconButton(
              icon: Icon(Icons.search),
              tooltip: 'Search',
              onPressed: null),
        ],
      ),
    );
  }
}

class MyScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Material(
      child: Column(
        children: <Widget>[
          MyAppBar(
            title: Text('MyAppBar', style: Theme
                .of(context)
                .primaryTextTheme
                .title,),
          ),

          Expanded(
            child: Center(
              child: Text('Hello, world!'),
            ),
          )
        ],
      ),
    );
  }

}




