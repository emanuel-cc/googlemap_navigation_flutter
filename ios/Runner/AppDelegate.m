#import "AppDelegate.h"
#import "GeneratedPluginRegistrant.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

      FlutterViewController* controller = (FlutterViewController*)self.window.rootViewController;
      FlutterMethodChannel* initialNavigationChannel = [FlutterMethodChannel
                                          methodChannelWithName:@"com.flutter_navigation_googlemap"
                                          binaryMessenger:controller];
      [initialNavigationChannel setMethodCallHandler:^(FlutterMethodCall* call, FlutterResult result){
          if ([@"initialNavigation" isEqualToString:call.method]){
            [weakSelf initialNavigation];
          }else{
            result(FlutterMethodNotImplemented);
          }
      }]

  [GeneratedPluginRegistrant registerWithRegistry:self];
  // Override point for customization after application launch.
  return [super application:application didFinishLaunchingWithOptions:launchOptions];
}

- (void)initialNavigation{
  NSURL *testURL = [NSURL URLWithString:@"comgooglemaps-x-callback://"];
  if ([[UIApplication sharedApplication] canOpenURL:testURL]) {
    NSString *directionsRequest = @"comgooglemaps-x-callback://" +
        @"?daddr=John+F.+Kennedy+International+Airport,+Van+Wyck+Expressway,+Jamaica,+New+York" +
        @"&x-success=sourceapp://?resume=true&x-source=AirApp";
    NSURL *directionsURL = [NSURL URLWithString:directionsRequest];
    [[UIApplication sharedApplication] openURL:directionsURL];
  } else {
    NSLog(@"Can't use comgooglemaps-x-callback:// on this device.");
  }
}

@end
