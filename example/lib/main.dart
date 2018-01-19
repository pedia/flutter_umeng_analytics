import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_umeng_analytics/flutter_umeng_analytics.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static bool _inited;
  @override
  initState() {
    super.initState();

    if (_inited == null) {
      _inited = true;
      UMengAnalytics.init('5a20cc45f43e48512000015d',
          policy: Policy.BATCH, encrypt: true, reportCrash: false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Plugin example app'),
        ),
        body: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            new RaisedButton(
              onPressed: () {
                UMengAnalytics.logEvent("hello");
              },
              child: new Text('Running on: hello'),
            ),
          ]),
        ),
      ),
    );
  }
}
