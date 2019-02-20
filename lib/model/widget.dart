import 'package:flutter/material.dart';
import 'package:flutter_app_demo01/utils/sql.dart';

abstract class WidgerInterface {
  int get id;

  //组件英文名
  String get name;

  //组件中文名
  String get cnName;

  //组件截图
  String get image;

  //组件文档
  String get doc;

  //类目id
  int get catId;

}

class WidgetPoint implements WidgerInterface {

  int id;

  //组件英文名
  String name;

  //组件中文名
  String cnName;

  //组件截图
  String image;

  // 路由地址
  String routerName;

  //组件markdown 文档
  String doc;

  //组件 demo ，多个以 , 分割
  String demo;

  //类目 id
  int catId;

  final WidgetBuilder buildRouter;

  WidgetPoint({
    this.id,
    this.name,
    this.cnName,
    this.image,
    this.doc,
    this.catId,
    this.routerName,
    this.buildRouter
  });

  WidgetPoint.fromJSON(Map json)
      : id=json['id'],
        name=json['name'],
        cnName=json['cnName'],
        image=json['image'],
        routerName=json['routerName'],
        doc=json['doc'],
        catId=json['catId'],
        buildRouter=json['buildRouter'];

  String toString() {
    return '(WidgetPoint $name)';
  }

  Object toMap() {
    return {
      'id': id,
      'name': name,
      'cnName': cnName,
      'image': image,
      'doc': doc,
      'catId': catId
    };
  }

  Map toSqlCondition() {
    Map _map = this.toMap();
    Map condition = {};
    _map.forEach((key, value) {
      if (value != null) {
        condition[key] = value;
      }
    });
    if (condition.isEmpty) {
      return {};
    }
    return condition;
  }

}

class WidgetControlModel {

  final String table = 'widget';
  Sql sql;

  WidgetControlModel() {
    sql = Sql.setTable(table);
  }

  //future，异步的一种机制
  Future<List<WidgetPoint>> getList(WidgetPoint widgetPoint) async {
    List listJson =
    await sql.getByCondition(conditions: widgetPoint.toSqlCondition());
    List<WidgetPoint> widgets = listJson.map((json) {
      return new WidgetPoint.fromJSON(json);
    }).toList();

    return widgets;
  }

  Future<List<WidgetPoint>> search(String name) async {
    List json = await sql.search(conditions: {'name': name});
    if (json.isEmpty) {
      return [];
    }
    List<WidgetPoint> widgets = json.map((json) {
      return new WidgetPoint.fromJSON(json);
    }).toList();

    return widgets;
  }

  Future<WidgetPoint> getCatByName(String name) async {
    List json = await sql.getByCondition(conditions: {'name': name});
    if (json.isEmpty) {
      return null;
    }
    return new WidgetPoint.fromJSON(json.first);
  }
}

