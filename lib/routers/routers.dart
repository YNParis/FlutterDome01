import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import '../widgets/index.dart';
import './router_handler.dart';

class Routes {

  static String root = "/";
  static String home = "/home";
  static String widgetDemo = '/widget-demo';
  static String codeView = '/code-view';
  static String webViewPage = '/web-view-page';
  static String notFoundPage = '/category/error/404';
  static String categoryPage = '/category/:type';


  static void configureRoutes(Router router) {
    List widgetDemoList = new WidgetDemoList().getDemos();
    router.notFoundHandler = new Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {}
    );
    router.define(home, handler: homeHandler);
    router.define(categoryPage, handler: categoryHandler);
    router.define(notFoundPage, handler: widgetNotFoundHandler);
    router.define(codeView, handler: fullScreenCodeDialog);
    router.define(webViewPage, handler: webViewPageHand);
    widgetDemoList.forEach((demo) {
      Handler handler = new Handler(
          handlerFunc: (BuildContext context,
              Map<String, List<String>> params) {
            return demo.buildRouter(context);
          }
      );
      router.define('${demo.routerName}', handler: handler);
    });
  }
}