# flutter_umeng_analytics

Flutter plugin for [umeng:analytics](http://mobile.umeng.com/analytics)

## Usage

### Init

```dart
import 'dart:io';

if (Platform.isAndroid)
  UMengAnalytics.init('Android AppKey',
           encrypt: true, reportCrash: false);
else if (Platform.isIOS)
  UMengAnalytics.init('iOS AppKey',
          encrypt: true, reportCrash: false);
```

### Log page

```dart
initState() {
  super.initState();

  UMengAnalytics.beginPageView("home");
}

dispose() {
  super.dispose();

  UMengAnalytics.endPageView("home");
}

someFunction() {
  UMengAnalytics.logEvent("some click");
}
```

## Getting Started

For help getting started with Flutter, view our online
[documentation](http://flutter.io/).

For help on editing plugin code, view the [documentation](https://flutter.io/platform-plugins/#edit-code).