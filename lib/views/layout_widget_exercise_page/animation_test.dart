import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:flutter_app_demo01/routers/application.dart';

class AnimationRoute extends StatefulWidget {
  @override
  _AnimationRouteState createState() => new _AnimationRouteState();
}

class _AnimationRouteState extends State<AnimationRoute>
    with SingleTickerProviderStateMixin {

  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: Duration(seconds: 3), vsync: this);
    animation = Tween(begin: 0.0, end: 300.0).animate(controller);
    animation.addListener(() {
      setState(() {

      });
    });
    int i = 0;
    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reverse();
      }
    });
    //启动动画(正向执行)
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Animation'),),
      body: Center(
        child: Image.asset(
          'images/lake.png',
          width: animation.value,
          height: animation.value,),),);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class AnimatedImage extends AnimatedWidget {
  AnimatedImage({Key key, Animation<double> animation})
      :super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double>animation = listenable;
    return Center(
      child: Image.asset(
        'images/lake.png', width: animation.value, height: animation.value,),
    );
  }

}

/**
 * 正弦曲线
 */
class _SinCurve extends Curve {
  @override
  double transform(double t) {
    return math.sin(t * math.pi * 2);
  }

}


/**
 * 过度类
 */
class GrowTransition extends StatelessWidget {
  GrowTransition({this.child, this.animation});

  final Widget child;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    //将child一层一层传下去
    return Center(
        child: AnimatedBuilder(
          animation: animation,
          builder: (con, child) =>
              Container(
                child: child,
                width: animation.value,
                height: animation.value,
              ),
          child: child,)

    );
  }
}

//-------------------------Hero动画------------------------------------------------------
class HeroAnimationRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: InkWell(
          child: Hero(tag: 'hero',
              child: ClipOval(child: Image.asset(
                'images/lake.png', width: 50.0, height: 50.0,),)),
          onTap: () {
            Navigator.push
              (context, PageRouteBuilder(
                pageBuilder: (BuildContext context, Animation animation,
                    Animation secondaryAnimation) {
                  return FadeTransition(
                    opacity: animation, child: HeroAnimationRouteB(),);
                }));
          }
      ),
      alignment: Alignment.center,
    );
  }

}

class HeroAnimationRouteB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Hero(tag: 'hero', child: Image.asset('images/lake.png')),
    );
  }

}

//------------------------------------交错动画，即复合动画---------------------------------------------------

class StaggerAnimation extends StatelessWidget {
//定义动画类
  StaggerAnimation({
    Key key, this.controller
  }) :super(key: key) {
    height = Tween<double>(begin: .0, end: 300.0).animate(CurvedAnimation(
        parent: controller, curve: Interval(0.0, 0.6, curve: Curves.ease)));
    color = ColorTween(begin: Colors.grey, end: Colors.red).animate(
        CurvedAnimation(
            parent: controller, curve: Interval(0.0, 0.6, curve: Curves.ease)));
    padding = Tween<EdgeInsets>(
        begin: EdgeInsets.only(left: .0), end: EdgeInsets.only(left: 100.0))
        .animate(CurvedAnimation(
        parent: controller, curve: Interval(0.6, 1.0, curve: Curves.ease)));
  }

  final Animation<double> controller;
  Animation<double> height;
  Animation<EdgeInsets> padding;
  Animation<Color> color;

  Widget _buildAnimation(BuildContext context, Widget child) {
    return Container(
      padding: padding.value,
      child: Container(
        color: color.value,
        width: 50.0,
        height: height.value,
        alignment: Alignment.center,
      ),
      alignment: Alignment.center,
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AnimatedBuilder(animation: controller, builder: _buildAnimation);
  }

}

class StaggerDemo extends StatefulWidget {
  @override
  _StaggerDemoState createState() => new _StaggerDemoState();
}

class _StaggerDemoState extends State<StaggerDemo>
    with TickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 2000));
  }

  Future<Null> _playAnimation() async {
    try {
      await _controller
          .forward()
          .orCancel;
    } on TickerCanceled {
      await _controller
          .reverse()
          .orCancel;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        _playAnimation();
      },
      child: Center(
        child: Container(
          child: StaggerAnimation(
            controller: _controller,
          ),
          width: 300.0,
          height: 300.0,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.1),
            border: Border.all(
                color: Colors.black.withOpacity(0.5)
            ),

          ),
        ),
      ),
    );
  }
}








