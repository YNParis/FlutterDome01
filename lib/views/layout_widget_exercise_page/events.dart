import 'package:flutter/material.dart';

typedef void EventCallback(arg);

class EventBus {

  //构造私有函数
  EventBus._internal();

  //保存单例
  static EventBus _singleton = new EventBus._internal();

  //工厂构造函数
  factory EventBus()=> _singleton;

  //保存时间订阅者序列，key：事件名，value：对应事件的订阅者序列
  var _emp = Map<Object, List<EventCallback>>();

  //添加订阅者
  void on(eventName, EventCallback f) {
    if (eventName == null || f == null) return;
    _emp[eventName] ??= List<EventCallback>();
    _emp[eventName].add(f);
  }

  //移除订阅者
  void off(eventName, [EventCallback f]) {
    if (eventName == null) return;
    var list = _emp[eventName];
    if (list == null) return;
    if (f == null) {
      _emp[eventName] = null;
    } else {
      list.remove(f);
    }
  }

  //触发事件，事件触发后该事件所有订阅者会被调用
  void emit(eventName, [arg]) {
    var list = _emp[eventName];
    if (list == null) return;
    int l = list.length - 1;
    //反向遍历，防止在订阅者在回调中移除自身带来的下标错位
    for (var i = l; i > -1; i--) {
      list[i](arg);
    }
  }

}

var bus = EventBus();