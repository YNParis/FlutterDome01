import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_app_demo01/components/category.dart';
import 'package:flutter_app_demo01/components/full_screen_code_dialog.dart';
import 'package:flutter_app_demo01/views/first_page/home.dart';
import 'package:flutter_app_demo01/views/layout_widget_exercise_page/android_view.dart';
import 'package:flutter_app_demo01/views/layout_widget_exercise_page/animation_test.dart';
import 'package:flutter_app_demo01/views/layout_widget_exercise_page/camera.dart';
import 'package:flutter_app_demo01/views/layout_widget_exercise_page/camera_result.dart';
import 'package:flutter_app_demo01/views/layout_widget_exercise_page/constraint_container.dart';
import 'package:flutter_app_demo01/views/layout_widget_exercise_page/container_layout.dart';
import 'package:flutter_app_demo01/views/layout_widget_exercise_page/custom_widget.dart';
import 'package:flutter_app_demo01/views/layout_widget_exercise_page/gesture_detector.dart';
import 'package:flutter_app_demo01/views/layout_widget_exercise_page/gomoku.dart';
import 'package:flutter_app_demo01/views/layout_widget_exercise_page/inherited_widget.dart';
import 'package:flutter_app_demo01/views/layout_widget_exercise_page/layout_widget.dart';
import 'package:flutter_app_demo01/views/layout_widget_exercise_page/network_page.dart';
import 'package:flutter_app_demo01/views/layout_widget_exercise_page/notification_layout.dart';
import 'package:flutter_app_demo01/views/layout_widget_exercise_page/pointer.dart';
import 'package:flutter_app_demo01/views/layout_widget_exercise_page/stack.dart';
import 'package:flutter_app_demo01/views/layout_widget_exercise_page/theme_data.dart';
import 'package:flutter_app_demo01/views/layout_widget_exercise_page/will_pop_scope.dart';
import 'package:flutter_app_demo01/views/web_page/web_view_page.dart';
import '../widgets/404.dart';

// app的首页
var homeHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    //以Map<String 参数名,List<String> 参数list>的形式在页面之间传递参数
    return new AppPage();
  },
);

var categoryHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    String name = params["type"]?.first;
    return new CategoryHome();
  },
);

var widgetNotFoundHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return new WidgetNotFound();
});

var fullScreenCodeDialog = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  String path = params['filePath']?.first;
  return new FullScreenCodeDialog();
});

var webViewPageHand = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  String title = params['title']?.first;
  String url = params['url']?.first;
  return new WebViewPage();
});

var stackHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  String center = 'center';
  return new LayoutPage();
});
var gestureHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return new GestureDetectorRoute();
});
var animationHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return new AnimationRoute();
});
var containerHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return new ContainerLayoutRoute();
});
var willpopscopeHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return new WillPopScopeTestRoute();
});
var themeDataHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return new ThemeDataRoute();
});
var pointerHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return new PointerLayoutRoute();
});
var inheritedHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return new InheritedLayout();
});
var constraintHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return new ConstraintBoxLayout();
});
var notificationHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return new NotificationLayout();
});
var customWidgetHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return new CustomWidgetRoute();
});
var gomokuHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return new GomokuRoute();
});
var netHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return new HttpTestRoute();
});
var nativeViewHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return new AndroidNativeViewRoute();
});
var cameraHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return new CameraRoute();
});
var cameraResultHandler;
