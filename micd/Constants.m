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
//NSString *const kNotificationKeyControlPlayerFromWatch = @"NotificationKeyControlPlayerFromWatch";

//NSString *const kNotificationKeyControlPlayerFromWatchValue = @"NotificationKeyControlPlayerFromWatchValue";
//NSString *const kNotificationKeyControlPlayerFromWatchValuePlay = @"NotificationKeyControlPlayerFromWatchValuePlay";
//NSString *const kNotificationKeyControlPlayerFromWatchValuePause = @"NotificationKeyControlPlayerFromWatchValuePause";
//NSString *const kNotificationKeyControlPlayerFromWatchValuePrevious = @"NotificationKeyControlPlayerFromWatchValuePrevious";
//NSString *const kNotificationKeyControlPlayerFromWatchValueNext = @"NotificationKeyControlPlayerFromWatchValueNext";

// UserDefaults shit
NSString *const kUserDefaultsKeyCurrentVersion = @"UserDefaultsKeyCurrentVersion";
NSString *const kUserDefaultsKeyStartRecordingOnAppDidBecomeActive = @"UserDefaultsKeyStartRecordingOnAppDidBecomeActive";
NSString *const kUserDefaultsKeyRecordingsSavePlaybackPosition = @"UserDefaultsKeyRecordingsSavePlaybackPosition";
NSString *const kUserDefaultsKeyMainColor = @"UserDefaultsKeyMainColor";

// WatchKit shit
NSString *const kWatchExtKeyMessageType = @"WatchExtKeyMessageType";
NSString *const kWatchExtKeyMessageTypeGetRecorderInfo = @"WatchExtKeyMessageTypeGetRecorderInfo";
NSString *const kWatchExtKeyMessageTypeRecordButtonPressed = @"WatchExtKeyMessageTypeRecordButtonPressed";
NSString *const kWatchExtKeyMessageTypeGetRecordingsList = @"WatchExtKeyMessageTypeGetRecordingsList";
NSString *const kWatchExtKeyMessageTypeRecordingPressed = @"WatchExtKeyMessageTypeRecordingPressed";
//NSString *const kWatchExtKeyMessageTypePlayButtonPressed = @"WatchExtKeyMessageTypePlayButtonPressed";
//NSString *const kWatchExtKeyMessageTypePauseButtonPressed = @"WatchExtKeyMessageTypePauseButtonPressed";
//NSString *const kWatchExtKeyMessageTypePreviousButtonPressed = @"WatchExtKeyMessageTypePreviousButtonPressed";
//NSString *const kWatchExtKeyMessageTypeNextButtonPressed = @"WatchExtKeyMessageTypeNextButtonPressed";

NSString *const kWatchExtKeyIsRecording = @"WatchExtKeyIsRecording";
//NSString *const kWatchExtKeyIsPlaying = @"WatchExtKeyIsPlaying";
NSString *const kWatchExtKeyRecordingsList = @"WatchExtKeyRecordingsList";
NSString *const kWatchExtKeyPlayRecordingIndex = @"WatchExtKeyPlayRecordingIndex";

// User Info shit
NSString *const kUserInfoKeyStateToLoadOnAppBecomesActive = @"UserInfoKeyStateToLoadOnAppBecomesActive";
NSString *const kUserInfoKeyRecordingToPlayIndex = @"UserInfoKeyRecordingToPlayIndex";

@implementation Constants

+ (NSString *)documentsDirectory {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    return paths.lastObject;
}

@end
