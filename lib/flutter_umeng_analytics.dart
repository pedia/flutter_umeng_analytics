import 'dart:async';

import 'package:flutter/services.dart';

class Policy {
  static final int REALTIME = 0;
  static final int BATCH = 1;
  static final int SEND_INTERVAL = 6;
  static final int SMART_POLICY = 8;
}

class UMengAnalytics {
  static const MethodChannel _channel =
      const MethodChannel('flutter_umeng_analytics');

  static Future<bool> init(String key,
      {int policy,
      bool reportCrash,
      bool encrypt,
      double interval,
      bool logEnable}) {
    Map<String, dynamic> args = {"key": key};

    if (policy != null) args["policy"] = policy;
    if (reportCrash != null) args["reportCrash"] = reportCrash;
    if (encrypt != null) args["encrypt"] = encrypt;
    if (interval != null) args["interval"] = interval;
    if (logEnable != null) args["logEnable"] = logEnable;

    _channel.invokeMethod("init", args);
    return new Future.value(true);
  }

  // page view
  static Future<Null> logPageView(String name, int seconds) {
    _channel.invokeMethod("logPageView", {"name": name, "seconds": seconds});
  }

  static Future<Null> beginPageView(String name) {
    _channel.invokeMethod("beginPageView", {"name": name});
  }

  static Future<Null> endPageView(String name) {
    _channel.invokeMethod("endPageView", {"name": name});
  }

  // event
  static Future<Null> logEvent(String name, {String label}) {
    _channel.invokeMethod("logEvent", {"label": label});
  }
}
