import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_app_demo01/utils/shared_prefernces.dart';
import 'package:camera/camera.dart';

class Application {
  static Router router;
  static TabController controller;
  static SpUtil sharePeferences;

//  static EventBus eventBus = EventBus();

  static Map<String, String> github = {
    'widgetsURL': 'https://github.com/alibaba/flutter-go/blob/develop/lib/widgets/',
  };

  static List<CameraDescription> cameras = <CameraDescription>[];
}