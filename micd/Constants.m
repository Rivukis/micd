#import "Constants.h"

// Recording shit
NSString *const kRecorderPrimaryAudioFile = @"RecorderPrimaryAudioFile.m4a";
NSString *const kRecorderSavedAudioFileName = @"RecorderSavedAudioFileName.m4a";
NSString *const kRecorderConcatenatedAudioFileName = @"RecorderConcatenatedAudioFileName.m4a";
NSString *const kRecorderFormatTypeAsString = @".m4a";

// Notification shit
NSString *const kNotificationKeyDidFinishedRecordingFromWatch = @"NotificationKeyDidFinishedRecordingFromWatch";
NSString *const kNotificationKeyApplicationDidBecomeActive = @"kNotificationKeyApplicationDidBecomeActive";

// UserDefaults shit
NSString *const kUserDefaultsKeyCurrentVersion = @"UserDefaultsKeyCurrentVersion";
NSString *const kUserDefaultsKeyStartRecordingOnAppDidBecomeActive = @"UserDefaultsKeyStartRecordingOnAppDidBecomeActive";
NSString *const kUserDefaultsKeyRecordingsSavePlaybackPosition = @"UserDefaultsKeyRecordingsSavePlaybackPosition";
NSString *const kUserDefaultsKeyMainColor = @"UserDefaultsKeyMainColor";

// WatchKit shit
NSString *const kWatchExtKeyMessageType = @"WatchExtKeyMessageType";
NSString *const kWatchExtKeyMessageTypeWillActivate = @"WatchExtKeyMessageTypeWillActivate";
NSString *const kWatchExtKeyMessageTypeRecordButtonPressed = @"WatchExtKeyMessageTypeRecordButtonPressed";
NSString *const kWatchExtKeyIsRecording = @"kWatchExtKeyIsRecording";

// User Info shit
NSString *const kUserInfoKeyStateToLoadOnAppBecomesActive = @"UserInfoKeyStateToLoadOnAppBecomesActive";

@implementation Constants

+ (NSString *)documentsDirectory {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    return paths.lastObject;
}

@end
