#import "FlutterUmengAnalyticsPlugin.h"

#import "UMMobClick/MobClick.h"

@implementation FlutterUmengAnalyticsPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel =
      [FlutterMethodChannel methodChannelWithName:@"flutter_umeng_analytics"
                                  binaryMessenger:[registrar messenger]];
  FlutterUmengAnalyticsPlugin* instance = [[FlutterUmengAnalyticsPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"getPlatformVersion" isEqualToString:call.method]) {
    result([@"iOS " stringByAppendingString:[[UIDevice currentDevice] systemVersion]]);
  } else if ([@"init" isEqualToString:call.method]) {
    [self init:call result:result];
  } else if ([@"logPageView" isEqualToString:call.method]) {
    [MobClick logPageView:call.arguments[@"name"] seconds:[call.arguments[@"seconds"] intValue]];
    result(nil);
  } else if ([@"beginPageView" isEqualToString:call.method]) {
    [MobClick beginLogPageView:call.arguments[@"name"]];
    result(nil);
  } else if ([@"endPageView" isEqualToString:call.method]) {
    [MobClick endLogPageView:call.arguments[@"name"]];
    result(nil);
  } else if ([@"logEvent" isEqualToString:call.method]) {
    if (call.arguments[@"label"] != [NSNull null])
      [MobClick event:call.arguments[@"name"] label:call.arguments[@"label"]];
    else
      [MobClick event:call.arguments[@"name"]];
    result(nil);
  } else {
    result(FlutterMethodNotImplemented);
  }
}

- (void)init:(FlutterMethodCall*)call result:(FlutterResult)result {
  UMConfigInstance.appKey = call.arguments[@"key"];
  // UMConfigInstance.secret = call.arguments[@"secret"];

  NSString* channel = call.arguments[@"channel"];
  if (channel) UMConfigInstance.channelId = channel;

  NSNumber* policy = call.arguments[@"policy"];
  if (policy) UMConfigInstance.eSType = [policy intValue];

  NSNumber* reportCrash = call.arguments[@"reportCrash"];
  if (reportCrash) UMConfigInstance.bCrashReportEnabled = [reportCrash boolValue];

  [MobClick startWithConfigure:UMConfigInstance];

  NSNumber* logEnable = call.arguments[@"logEnable"];
  if (logEnable) [MobClick setLogEnabled:[logEnable boolValue]];

  NSNumber* encrypt = call.arguments[@"encrypt"];
  if (encrypt) [MobClick setEncryptEnabled:[encrypt boolValue]];

  NSNumber* interval = call.arguments[@"interval"];
  if (interval) [MobClick setLogSendInterval:[interval doubleValue]];
}

@end
