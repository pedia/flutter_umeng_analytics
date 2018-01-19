# flutter_umeng_analytics

Flutter plugin for [umeng:analytics](http://mobile.umeng.com/analytics)

## Usage

### Init
```dart
UMengAnalytics.init('5a20cc45f43e48512000015d',
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