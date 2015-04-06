#import "Constants.h"

// Recording shit
NSString *const kRecorderPrimaryAudioFile = @"RecorderPrimaryAudioFile.m4a";
NSString *const kRecorderSavedAudioFileName = @"RecorderSavedAudioFileName.m4a";
NSString *const kRecorderConcatenatedAudioFileName = @"RecorderConcatenatedAudioFileName.m4a";
NSString *const kRecorderFormatTypeAsString = @".m4a";

// Notification shit
NSString *const kNotificationKeyRecordPressedFromWatch = @"NotificationKeyRecordPressedFromWatch";
NSString *const kNotificationKeyApplicationDidBecomeActive = @"kNotificationKeyApplicationDidBecomeActive";
NSString *const kNotificationKeyRecordingPressedFromWatch = @"NotificationKeyRecordingPressedFromWatch";

// UserDefaults shit
NSString *const kUserDefaultsKeyCurrentVersion = @"UserDefaultsKeyCurrentVersion";
NSString *const kUserDefaultsKeyMainColor = @"UserDefaultsKeyMainColor";
NSString *const kUserDefaultsKeyStartRecordingOnAppDidBecomeActive = @"UserDefaultsKeyStartRecordingOnAppDidBecomeActive";
NSString *const kUserDefaultsKeyRecordingsSavePlaybackPosition = @"UserDefaultsKeyRecordingsSavePlaybackPosition";
NSString *const kUserDefaultsKeyAutoStartRecordingAfterMaximumReached = @"UserDefaultsKeyAutoStartRecordingAfterMaximumReached";
NSString *const kUserDefaultsKeyMaxRecordingLength = @"UserDefaultsKeyMaxRecordingLength";
NSString *const kUserDefaultsKeyLoveMicdQuestionAnswered = @"UserDefaultsKeyLoveMicdQuestionAnswered";

// WatchKit shit
NSString *const kWatchExtKeyMessageType = @"WatchExtKeyMessageType";
NSString *const kWatchExtKeyMessageTypeGetRecorderInfo = @"WatchExtKeyMessageTypeGetRecorderInfo";
NSString *const kWatchExtKeyMessageTypeRecordButtonPressed = @"WatchExtKeyMessageTypeRecordButtonPressed";
NSString *const kWatchExtKeyMessageTypeGetRecordingsList = @"WatchExtKeyMessageTypeGetRecordingsList";
NSString *const kWatchExtKeyMessageTypeRecordingPressed = @"WatchExtKeyMessageTypeRecordingPressed";

NSInteger const kWatchExtNumberOfRecordingsShown = 20;
NSString *const kWatchExtKeyIsRecording = @"WatchExtKeyIsRecording";
NSString *const kWatchExtKeyRecordingsList = @"WatchExtKeyRecordingsList";
NSString *const kWatchExtKeyRecordingsListKeyName = @"WatchExtKeyRecordingsListKeyName";
NSString *const kWatchExtKeyRecordingsListKeyUUID = @"WatchExtKeyRecordingsListKeyUUID";
NSString *const kWatchExtKeyRecordingsListIsLoaded = @"WatchExtKeyRecordingsListIsLoaded";
NSString *const kWatchExtKeyPlayRecordingWithUUIDString = @"WatchExtKeyPlayRecordingWithUUIDString";

// User Info shit
NSString *const kUserInfoKeyStateToLoadOnAppBecomesActive = @"UserInfoKeyStateToLoadOnAppBecomesActive";
NSString *const kUserInfoKeyRecordingToPlayUUIDString = @"UserInfoKeyRecordingToPlayUUIDString";

@implementation Constants

+ (NSString *)documentsDirectory {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    return paths.lastObject;
}

@end
