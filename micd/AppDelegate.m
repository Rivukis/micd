#import "AppDelegate.h"
#import <AVFoundation/AVAudioSession.h>
#import "Constants.h"
#import "RecorderController.h"
#import "DataSourceController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    AVAudioSession *sharedSession = [AVAudioSession sharedInstance];
    [sharedSession setCategory:AVAudioSessionCategoryPlayAndRecord error:nil];
    [sharedSession setActive:YES withOptions:AVAudioSessionSetActiveOptionNotifyOthersOnDeactivation error:nil];
    [sharedSession overrideOutputAudioPort:AVAudioSessionPortOverrideSpeaker error:nil];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark - WatchKit Methods

- (void)application:(UIApplication *)application handleWatchKitExtensionRequest:(NSDictionary *)userInfo reply:(void(^)(NSDictionary *replyInfo))reply {
    NSLog(@"recieved message");
    
    RecorderController *recorderController = [RecorderController sharedRecorder];
    BOOL isRecording = NO;
    if (recorderController.recordingState == RecorderControllerStateRecording) {
        isRecording = YES;
    }
    
    NSString *messageType = userInfo[kWatchExtKeyMessageType];
    if ([messageType isEqualToString:kWatchExtKeyMessageTypeRecordButtonPressed]) {
        // start or stop recording
        NSNotification *notification = [NSNotification notificationWithName:kNotificationKeyDidFinishRecordingFromWatch object:nil];
        [[NSNotificationCenter defaultCenter] postNotification:notification];
        isRecording = !isRecording;
    }
    
    reply(@{kWatchExtKeyIsRecording : @(isRecording)});
}

@end
