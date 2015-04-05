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

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [VersionController updateVersion];
    self.fireDidBecomeActiveNotification = YES;
    
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
    
    if ([messageType isEqualToString:kWatchExtKeyMessageTypeGetRecorderInfo]) {
        // just getting info so nothing to do
    }
    
    if ([messageType isEqualToString:kWatchExtKeyMessageTypeRecordButtonPressed]) {
        [[NSNotificationCenter defaultCenter] postNotificationName:kNotificationKeyRecordPressedFromWatch object:nil];
        isRecording = !isRecording;
    }
    
    if ([messageType isEqualToString:kWatchExtKeyMessageTypeGetRecordingsList]) {
        [[NSUserDefaults standardUserDefaults] setBool:NO forKey:kUserDefaultsKeyWatchTableViewInfoIsOutOfSync];
        replyDict[kWatchExtKeyRecordingsList] = [Factory arrayOfRecordingsForWatch];
    }
    
    if ([messageType isEqualToString:kWatchExtKeyMessageTypeRecordingPressed]) {
        BOOL isRecording = recorderController.recordingState == RecorderControllerStateRecording;
        
        if (!isRecording) {
            NSString *recordingUUIDString = userInfo[kWatchExtKeyPlayRecordingWithUUIDString];

            NSDictionary *userInfo = @{kUserInfoKeyRecordingToPlayUUIDString: recordingUUIDString};
            [[NSNotificationCenter defaultCenter] postNotificationName:kNotificationKeyRecordingPressedFromWatch
                                                                object:nil
                                                              userInfo:userInfo];
        }
        
        BOOL dataOnWatchIsOld = [[NSUserDefaults standardUserDefaults] boolForKey:kUserDefaultsKeyWatchTableViewInfoIsOutOfSync];
        
        replyDict[kWatchExtKeyRecordingsListChangedWhileShowingOnWatch] = @(dataOnWatchIsOld);
        if (dataOnWatchIsOld) {
            NSLog(@"data on watch is old");
            replyDict[kWatchExtKeyRecordingsList] = [Factory arrayOfRecordingsForWatch];
        }
    }
    
    replyDict[kWatchExtKeyIsRecording] = @(isRecording);
    reply([replyDict copy]);
}

@end
