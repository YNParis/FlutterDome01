import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) =>
      new MaterialApp(
        title: 'Title',
        home: new Scaffold(
          body: new MyPage('page main'),
        ),
        routes: <String, WidgetBuilder>{
          '/a': (BuildContext context) => new MyPage('page a'),
          '/b': (BuildContext context) => new MyPage('page b'),
          '/c': (BuildContext context) => new MyPage('page c'),
        },);
}

class MyPage extends StatelessWidget {
  MyPage(this.title);

  final String title;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      home: new Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Column(

          children: <Widget>[
            Text('text',
              style: TextStyle(fontFamily: 'MyCustomFont',
                fontSize: 25.0,

              ),),

            Text('text2',
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),),

            Text('text3',
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.normal,
              ),),
            TextField(
              decoration: new InputDecoration(hintText: 'hint'),
            ),
            RaisedButton(
              child: Text('to a'),
              onPressed: () {
                Navigator.of(context).pushNamed('/a');
              },
            ),
            RaisedButton(
              child: Text('to b'),
              onPressed: () {
                Navigator.of(context).pushNamed('/b');
              },
            ),
            RaisedButton(
              child: Text('to c'),
              onPressed: () {
                Navigator.of(context).pushNamed('/c');
              },
            ),
          ],
        ),
      ),
    );
  }
}

void main() => runApp(new MaterialApp(home: new MyApp()));