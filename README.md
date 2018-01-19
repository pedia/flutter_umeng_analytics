# flutter_umeng_analytics

Flutter plugin for [umeng:analytics](http://mobile.umeng.com/analytics)

## Usage

### Init
```dart
import 'package:platform/platform.dart';

final Platform platform = const LocalPlatform();
if (platform.isAndroid)
  UMengAnalytics.init('Android AppKey',
          policy: Policy.BATCH, encrypt: true, reportCrash: false);
else if (platform.isIOS)
  UMengAnalytics.init('iOS AppKey',
          policy: Policy.BATCH, encrypt: true, reportCrash: false);
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