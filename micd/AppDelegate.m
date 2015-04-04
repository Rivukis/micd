#import "AppDelegate.h"
#import <AVFoundation/AVAudioSession.h>
#import "Constants.h"
#import "RecorderController.h"
#import "PlayerController.h"
#import "DataSourceController.h"
#import "FramesController.h"
#import "VersionController.h"

//    UIImage *image = [UIImage imageNamed:@"album_art"];
//    MPMediaItemArtwork *artwork = [[MPMediaItemArtwork alloc] initWithImage:image];
//    [trackInfo setObject:artwork forKey:MPMediaItemPropertyArtwork];

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [VersionController updateVersion];
        
    return YES;
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    [self setupAudioSession];
    [self startObservingNotifications];
    [[NSNotificationCenter defaultCenter] postNotificationName:kNotificationKeyApplicationDidBecomeActive object:nil];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    [[DataSourceController sharedDataSource] saveData];
}

#pragma mark - Helper Methods

- (void)setupAudioSession {
    AVAudioSession *sharedSession = [AVAudioSession sharedInstance];
    [sharedSession setCategory:AVAudioSessionCategoryPlayAndRecord error:nil];
    [sharedSession setActive:YES withOptions:AVAudioSessionSetActiveOptionNotifyOthersOnDeactivation error:nil];
    [self setAudioSessionOutputToSpeakersIfCurrentlySetToReciever];
}

- (void)setAudioSessionOutputToSpeakersIfCurrentlySetToReciever {
    AVAudioSessionRouteDescription* route = [[AVAudioSession sharedInstance] currentRoute];
    for (AVAudioSessionPortDescription* desc in [route outputs]) {
        if ([[desc portType] isEqualToString:AVAudioSessionPortBuiltInReceiver]) {
            [[AVAudioSession sharedInstance] overrideOutputAudioPort:AVAudioSessionPortOverrideSpeaker error:nil];
        }
    }
}

#pragma mark - Notification Methods

- (void)startObservingNotifications {
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(responseToAVAudioSessionRouteChange:)
                                                 name:AVAudioSessionRouteChangeNotification
                                               object:nil];
}

- (void)responseToAVAudioSessionRouteChange:(NSNotification *)notification {
    AVAudioSessionRouteChangeReason changeReason = [notification.userInfo[AVAudioSessionRouteChangeReasonKey] integerValue];
    if (changeReason == AVAudioSessionRouteChangeReasonOldDeviceUnavailable) {
        [self setAudioSessionOutputToSpeakersIfCurrentlySetToReciever];
    }
}

#pragma mark - WatchKit Methods

- (void)application:(UIApplication *)application handleWatchKitExtensionRequest:(NSDictionary *)userInfo reply:(void(^)(NSDictionary *replyInfo))reply {
    NSString *messageType = userInfo[kWatchExtKeyMessageType];
    NSMutableDictionary *replyDict = [NSMutableDictionary dictionary];
    
    RecorderController *recorderController = [RecorderController sharedRecorder];
    BOOL isRecording = recorderController.recordingState == RecorderControllerStateRecording;
    
    PlayerController *playerController = [PlayerController sharedPlayer];
    BOOL isPlaying = playerController.playerState == PlayerControllerStatePlaying;
    
    if ([messageType isEqualToString:kWatchExtKeyMessageTypeGetRecorderInfo]) {
        // just getting info so nothing to do
    }
    
    if ([messageType isEqualToString:kWatchExtKeyMessageTypeRecordButtonPressed]) {
        [[NSNotificationCenter defaultCenter] postNotificationName:kNotificationKeyRecordPressedFromWatch object:nil];
        isRecording = !isRecording;
    }
    
    if ([messageType isEqualToString:kWatchExtKeyMessageTypeGetRecordingsList]) {
        DataSourceController *dataSourceController = [DataSourceController sharedDataSource];
        NSInteger numberOfRecordingsToSend = dataSourceController.numberOfRecordings <= 20 ? dataSourceController.numberOfRecordings : 20;
        NSMutableArray *titlesList = [NSMutableArray array];
        
        for (NSInteger i = 0; i < numberOfRecordingsToSend; i++) {
            Recording *recording = dataSourceController.recordings[i];
            NSString *nameToSend;
            
            if (recording.title.length > 0) {
                nameToSend = recording.title;
            } else {
                nameToSend = recording.dateAsString;
            }
            
            [titlesList addObject:nameToSend];
        }
        
        replyDict[kWatchExtKeyRecordingsList] = [titlesList copy];
    }
    
    if ([messageType isEqualToString:kWatchExtKeyMessageTypeRecordingPressed]) {
        __unused NSInteger indexPressed = [userInfo[kWatchExtKeyPlayRecordingIndex] integerValue];
        
        // post notification to play recording at watch index
    }
    
    if ([messageType isEqualToString:kWatchExtKeyMessageTypePlayButtonPressed]) {
        NSDictionary *userInfo = @{kNotificationKeyControlPlayerFromWatchValue: kNotificationKeyControlPlayerFromWatchValuePlay};
        [[NSNotificationCenter defaultCenter] postNotificationName:kNotificationKeyControlPlayerFromWatch object:nil userInfo:userInfo];
    }
    
    if ([messageType isEqualToString:kWatchExtKeyMessageTypePauseButtonPressed]) {
        NSDictionary *userInfo = @{kNotificationKeyControlPlayerFromWatchValue: kNotificationKeyControlPlayerFromWatchValuePause};
        [[NSNotificationCenter defaultCenter] postNotificationName:kNotificationKeyControlPlayerFromWatch object:nil userInfo:userInfo];
    }
    
    if ([messageType isEqualToString:kWatchExtKeyMessageTypePreviousButtonPressed]) {
        NSDictionary *userInfo = @{kNotificationKeyControlPlayerFromWatchValue: kNotificationKeyControlPlayerFromWatchValuePrevious};
        [[NSNotificationCenter defaultCenter] postNotificationName:kNotificationKeyControlPlayerFromWatch object:nil userInfo:userInfo];
    }
    
    if ([messageType isEqualToString:kWatchExtKeyMessageTypeNextButtonPressed]) {
        NSDictionary *userInfo = @{kNotificationKeyControlPlayerFromWatchValue: kNotificationKeyControlPlayerFromWatchValueNext};
        [[NSNotificationCenter defaultCenter] postNotificationName:kNotificationKeyControlPlayerFromWatch object:nil userInfo:userInfo];
    }
    
    replyDict[kWatchExtKeyIsRecording] = @(isRecording);
    replyDict[kWatchExtKeyIsPlaying]= @(isPlaying);
    
    reply([replyDict copy]);
}

@end
