#import "Constants.h"

// Recording shit
NSString *const kRecorderPrimaryAudioFile = @"RecorderPrimaryAudioFile.m4a";
NSString *const kRecorderSavedAudioFileName = @"RecorderSavedAudioFileName.m4a";
NSString *const kRecorderConcatenatedAudioFileName = @"RecorderConcatenatedAudioFileName.m4a";
NSString *const kRecorderFormatTypeAsString = @".m4a";

// Notification shit
NSString *const kNotificationKeyRecordPressedFromWatch = @"NotificationKeyRecordPressedFromWatch";
NSString *const kNotificationKeyApplicationDidBecomeActive = @"kNotificationKeyApplicationDidBecomeActive";
NSString *const kNotificationKeyApplicationWillResignActive = @"NotificationKeyApplicationWillResignActive";
NSString *const kNotificationKeyRecordingPressedFromWatch = @"NotificationKeyRecordingPressedFromWatch";

// UserDefaults shit
NSString *const kUserDefaultsKeyCurrentVersion = @"UserDefaultsKeyCurrentVersion";
NSString *const kUserDefaultsKeyMainColor = @"UserDefaultsKeyMainColor";
NSString *const kUserDefaultsKeyStartRecordingOnAppDidBecomeActive = @"UserDefaultsKeyStartRecordingOnAppDidBecomeActive";
NSString *const kUserDefaultsKeyRecordingsSavePlaybackPosition = @"UserDefaultsKeyRecordingsSavePlaybackPosition";
NSString *const kUserDefaultsKeyAutoStartRecordingAfterMaximumReached = @"UserDefaultsKeyAutoStartRecordingAfterMaximumReached";
NSString *const kUserDefaultsKeyMaxRecordingLength = @"UserDefaultsKeyMaxRecordingLength";
NSString *const kUserDefaultsKeyLoveMicdQuestionAnswered = @"UserDefaultsKeyLoveMicdQuestionAnswered";
NSString *const kUserDefaultsKeySessionIsActive = @"UserDefaultsKeySessionIsActive";

// WatchKit shit
NSInteger const kWatchExtNumberOfRecordingsShown = 20;
NSString *const kWatchExtKeyMessageType = @"WatchExtKeyMessageType";
NSString *const kWatchExtKeyIsRecording = @"WatchExtKeyIsRecording";
NSString *const kWatchExtKeyRecordingsList = @"WatchExtKeyRecordingsList";
NSString *const kWatchExtKeyPlayRecordingWithUUIDString = @"WatchExtKeyPlayRecordingWithUUIDString";
NSString *const kWatchExtKeyRecordingPermissionIsGranted = @"WatchExtKeyRecordingPermissionIsGranted";

NSString *const kWatchExtMessageTypeGetRecorderInfo = @"WatchExtMessageTypeGetRecorderInfo";
NSString *const kWatchExtMessageTypeRecordButtonPressed = @"WatchExtMessageTypeRecordButtonPressed";
NSString *const kWatchExtMessageTypeGetRecordingsList = @"WatchExtMessageTypeGetRecordingsList";
NSString *const kWatchExtMessageTypeRecordingPressed = @"WatchExtMessageTypeRecordingPressed";

NSString *const kWatchExtRecordingDictKeyTitle = @"WatchExtRecordingDictKeyTitle";
NSString *const kWatchExtRecordingDictKeyUUID = @"WatchExtRecordingDictKeyUUID";
NSString *const kWatchExtRecordingDictKeyIsLoaded = @"WatchExtRecordingDictKeyIsLoaded";
NSString *const kWatchExtRecordingDictKeyDate = @"WatchExtRecordingDictKeyDate";
NSString *const kWatchExtRecordingDictKeyLength = @"WatchExtRecordingDictKeyLength";

// User Info shit
NSString *const kUserInfoKeyStateToLoadOnAppBecomesActive = @"UserInfoKeyStateToLoadOnAppBecomesActive";
NSString *const kUserInfoKeyRecordingToPlayUUIDString = @"UserInfoKeyRecordingToPlayUUIDString";

@implementation Constants

+ (NSString *)documentsDirectory {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    return paths.lastObject;
}

@end
