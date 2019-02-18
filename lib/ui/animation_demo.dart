import 'package:flutter/material.dart';

class FadeAppTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: 'Animation Fade Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyFadeTest(title: 'Fade Demo', color: Colors.red,),
    );
  }

}

class MyFadeTest extends StatefulWidget {
  MyFadeTest({Key key, this.title, this.color}) :super(key: key);
  final String title;
  final MaterialColor color;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _MyFadeTest();
  }

}

class _MyFadeTest extends State<MyFadeTest> with TickerProviderStateMixin {

  AnimationController controller;
  CurvedAnimation curve;

  @override
  void initState() {
    controller = new AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    curve = new CurvedAnimation(parent: controller, curve: Curves.easeIn);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: Text(widget.title, style: TextStyle(color: widget.color),),
      ),
      body: Center(
        child: Container(
          child: FadeTransition(
            opacity: curve,
            child: FlutterLogo(
              size: 100.0,
            ),),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          tooltip: 'fade',
          child: Icon(Icons.brush),
          onPressed: () {
            controller.forward();
          }),
    );
  }

}