import 'package:flutter/material.dart';

class PointerLayoutRoute extends StatefulWidget {
  @override
  _PointerLayoutRouteState createState() => new _PointerLayoutRouteState();
}

class _PointerLayoutRouteState extends State<PointerLayoutRoute> {
  PointerEvent _event;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pointer'),
      ),
      body: Listener(
        child: Container(
          color: Colors.pink,
          child: Text(
            _event?.toString() + '${_event?.orientation}',
            style: TextStyle(color: Colors.white),),
          width: 150.0,
          height: 150.0,
          alignment: Alignment.center,

        ),
        behavior: HitTestBehavior.deferToChild,
//        behavior: HitTestBehavior.opaque,
//        behavior: HitTestBehavior.translucent,
//        behavior: HitTestBehavior.values,
        onPointerDown: (e) {
          setState(() {
            _event = e;
          });
        },
        onPointerMove: (e) {
          setState(() {
            _event = e;
          });
        },
        onPointerUp: (e) {
          setState(() {
            _event = e;
          });
        },
      ),
    );
  }
}


