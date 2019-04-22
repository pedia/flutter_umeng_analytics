import 'dart:async';

import 'package:flutter/services.dart';

/// 友盟统计Flutter插件类
class UMengAnalytics {
  static const MethodChannel _channel =
      const MethodChannel('umeng_analytics_flutter');

  /// [key] 【友盟+】Appkey名称
  /// [mode] 页面采集的两种模式：0表示Android 4.0及以上版本,1表示4.0以下版本，默认为0
  /// [reportCrash] 错误统计，默认为打开
  /// [encrypt] 日志加密 默认为false
  /// [interval] Session间隔时长,单位是毫秒，默认Session间隔时间是30秒,一般情况下不用修改此值
  /// [logEnable] 设置组件化的Log开关，参数默认为false，如需查看LOG设置为true
  static Future<bool> init(String key,
      {int mode = 0,
      bool reportCrash = true,
      bool encrypt = false,
      double interval = 30000,
      bool logEnable = false}) {
    Map<String, dynamic> args = {"key": key};

    if (mode != null) {
      args["mode"] = mode;
    }
    if (reportCrash != null) {
      args["reportCrash"] = reportCrash;
    }
    if (encrypt != null) {
      args["encrypt"] = encrypt;
    }
    if (interval != null) {
      args["interval"] = interval;
    }
    if (logEnable != null) {
      args["logEnable"] = logEnable;
    }
    _channel.invokeMethod("init", args);
    return new Future.value(true);
  }

  /// 打开页面时进行统计
  /// [name]
  static Future<Null> beginPageView(String name) async {
    _channel.invokeMethod("beginPageView", {"name": name});
  }

  /// 关闭页面时结束统计
  /// [name]
  static Future<Null> endPageView(String name) async {
    _channel.invokeMethod("endPageView", {"id": name});
  }

  /// 登陆统计
  /// [id]
  /// [interval]
  static Future<Null> loginPageView(String id, {double interval}) async {
    _channel.invokeMethod("loginPageView", {"id": id, interval: interval});
  }

  /// 计数事件统计
  /// [eventId]  当前统计的事件ID
  /// [label] 事件的标签属性
  static Future<Null> eventCounts(String eventId, {String label}) async {
    _channel.invokeMethod("eventCounts", {"label": label});
  }
}
