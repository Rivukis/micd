#import "AppDelegate.h"
#import "Constants.h"
#import "RecorderController.h"
#import "PlayerController.h"
#import "DataSourceController.h"
#import "FramesController.h"
#import "VersionController.h"
#import "AudioSessionController.h"
#import "Factory.h"

@interface AppDelegate ()

@property (nonatomic, assign) BOOL fireDidBecomeActiveNotification;
@property (nonatomic, strong) UIImageView *launchImageToFade;

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [VersionController updateVersion];
    self.fireDidBecomeActiveNotification = YES;
    
    self.launchImageToFade = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"splashScreen"]];
    self.launchImageToFade.contentMode = UIViewContentModeScaleAspectFit;
    self.launchImageToFade.frame = self.window.frame;
    [self.window.rootViewController.view addSubview:self.launchImageToFade];
    [self.window.rootViewController.view bringSubviewToFront:self.launchImageToFade];
    [self performSelector:@selector(fadeLaunchImage) withObject:nil afterDelay:0.2];
    
    return YES;
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    self.fireDidBecomeActiveNotification = YES;
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    [[AudioSessionController sharedAudioSessionController] setupAudioSession];
    
    if (self.fireDidBecomeActiveNotification) {
        [[NSNotificationCenter defaultCenter] postNotificationName:kNotificationKeyApplicationDidBecomeActive object:nil];
        self.fireDidBecomeActiveNotification = NO;
    }
}

- (void)applicationWillResignActive:(UIApplication *)application {
    [[NSNotificationCenter defaultCenter] postNotificationName:kNotificationKeyApplicationWillResignActive object:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    [[DataSourceController sharedDataSource] saveData];
}

- (void)applicationWillTerminate:(UIApplication *)application {
    [[DataSourceController sharedDataSource] saveData];
}

#pragma mark - WatchKit Methods

- (void)application:(UIApplication *)application handleWatchKitExtensionRequest:(NSDictionary *)userInfo reply:(void(^)(NSDictionary *replyInfo))reply {
    NSString *messageType = userInfo[kWatchExtKeyMessageType];
    NSMutableDictionary *replyDict = [NSMutableDictionary dictionary];
    
    RecorderController *recorderController = [RecorderController sharedRecorder];
    BOOL isRecording = recorderController.recordingState == RecorderControllerStateRecording;
    
    if ([messageType isEqualToString:kWatchExtMessageTypeGetRecorderInfo]) {
        // just getting info so nothing to do
    }
    
    if ([messageType isEqualToString:kWatchExtMessageTypeRecordButtonPressed]) {
        [[NSNotificationCenter defaultCenter] postNotificationName:kNotificationKeyRecordPressedFromWatch object:nil];
        isRecording = !isRecording;
    }
    
    if ([messageType isEqualToString:kWatchExtMessageTypeGetRecordingsList]) {
        replyDict[kWatchExtKeyRecordingsList] = [Factory arrayOfRecordingsForWatch];
    }
    
    if ([messageType isEqualToString:kWatchExtMessageTypeRecordingPressed]) {
        BOOL isRecording = recorderController.recordingState == RecorderControllerStateRecording;
        
        if (!isRecording) {
            NSString *recordingUUIDString = userInfo[kWatchExtKeyPlayRecordingWithUUIDString];

            NSDictionary *userInfo = @{kUserInfoKeyRecordingToPlayUUIDString: recordingUUIDString};
            [[NSNotificationCenter defaultCenter] postNotificationName:kNotificationKeyRecordingPressedFromWatch
                                                                object:nil
                                                              userInfo:userInfo];
            
            /*
             On the watch we pop back to recorder screen when recording,
             so no need to update info since it will auto refresh when 
             going to recordings screen in the future
             */
            replyDict[kWatchExtKeyRecordingsList] = [Factory arrayOfRecordingsForWatch];
        }
    }
    
    BOOL accessGranted = [[AudioSessionController sharedAudioSessionController] hasMicrophonePermissionBeenGranted];
    
    replyDict[kWatchExtKeyRecordingPermissionIsGranted] = @(accessGranted);
    replyDict[kWatchExtKeyIsRecording] = @(isRecording);
    reply([replyDict copy]);
}

#pragma mark - Helper Methods

- (void)fadeLaunchImage {
    [UIView transitionWithView:self.window
                      duration:1.00f
                       options:UIViewAnimationOptionCurveEaseInOut
                    animations:^(void){
                        self.launchImageToFade.alpha = 0.0f;
                    }
                    completion:^(BOOL finished){
                        [self.launchImageToFade removeFromSuperview];
                    }];

}

@end
