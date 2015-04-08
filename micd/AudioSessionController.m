#import "AudioSessionController.h"
#import <AVFoundation/AVFoundation.h>
#import "Constants.h"

@implementation AudioSessionController

- (instancetype)init {
    return [AudioSessionController sharedAudioSessionController];
}

+ (AudioSessionController *)sharedAudioSessionController {
    static AudioSessionController *sharedPlayer = nil;
    @synchronized(self) {
        if (!sharedPlayer) {
            sharedPlayer = [[self alloc] init_common];
        }
    }
    return sharedPlayer;
}

- (instancetype)init_common {
    self = [super init];
    if (self) {
        [self startObservingNotifications];
    }
    return self;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
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

#pragma mark - Public Methods

- (void)setupAudioSession {
    AVAudioSession *sharedSession = [AVAudioSession sharedInstance];
    [sharedSession setCategory:AVAudioSessionCategoryPlayAndRecord error:nil];
    BOOL success = [sharedSession setActive:YES withOptions:AVAudioSessionSetActiveOptionNotifyOthersOnDeactivation error:nil];
    if (success) {
        [self setAudioSessionOutputToSpeakersIfCurrentlySetToReciever];
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:kUserDefaultsKeySessionIsActive];
    } else {
        [[NSUserDefaults standardUserDefaults] setBool:NO forKey:kUserDefaultsKeySessionIsActive];
    }
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void)setAudioSessionOutputToSpeakersIfCurrentlySetToReciever {
    AVAudioSessionRouteDescription* route = [[AVAudioSession sharedInstance] currentRoute];
    for (AVAudioSessionPortDescription* desc in [route outputs]) {
        if ([[desc portType] isEqualToString:AVAudioSessionPortBuiltInReceiver]) {
            [[AVAudioSession sharedInstance] overrideOutputAudioPort:AVAudioSessionPortOverrideSpeaker error:nil];
        }
    }
}

- (BOOL)hasMicrophonePermissionBeenGranted {
    return [[AVAudioSession sharedInstance] recordPermission] == AVAudioSessionRecordPermissionGranted;
}

- (BOOL)hasMicrophonePermissionBeenDetermined {
    return [[AVAudioSession sharedInstance] recordPermission] != AVAudioSessionRecordPermissionUndetermined;
}

- (void)requestMicrophonePermissionWithCompletion:(void(^)())completion {
    completion();
//    [[AVAudioSession sharedInstance] requestRecordPermission:^(BOOL granted) {
//        completion();
//    }];
}

@end
