#import <Foundation/Foundation.h>

// Recording shit
extern NSString *const kRecorderPrimaryAudioFile;
extern NSString *const kRecorderSavedAudioFileName;
extern NSString *const kRecorderConcatenatedAudioFileName;
extern NSString *const kRecorderFormatTypeAsString;

// Notification shit
extern NSString *const kNotificationKeyRecordPressedFromWatch;
extern NSString *const kNotificationKeyApplicationDidBecomeActive;
extern NSString *const kNotificationKeyRecordingPressedFromWatch;

// UserDefaults shit
extern NSString *const kUserDefaultsKeyCurrentVersion;
extern NSString *const kUserDefaultsKeyMainColor;
extern NSString *const kUserDefaultsKeyStartRecordingOnAppDidBecomeActive;
extern NSString *const kUserDefaultsKeyRecordingsSavePlaybackPosition;
extern NSString *const kUserDefaultsKeyWatchTableViewInfoIsOutOfSync;

// WatchKit shit
extern NSString *const kWatchExtKeyMessageType;
extern NSString *const kWatchExtKeyMessageTypeGetRecorderInfo;
extern NSString *const kWatchExtKeyMessageTypeRecordButtonPressed;
extern NSString *const kWatchExtKeyMessageTypeGetRecordingsList;
extern NSString *const kWatchExtKeyMessageTypeRecordingPressed;

extern NSInteger const kWatchExtNumberOfRecordingsShown;
extern NSString *const kWatchExtKeyIsRecording;
extern NSString *const kWatchExtKeyRecordingsList;
extern NSString *const kWatchExtKeyRecordingsListKeyName;
extern NSString *const kWatchExtKeyRecordingsListKeyUUID;
extern NSString *const kWatchExtKeyRecordingsListChangedWhileShowingOnWatch;
extern NSString *const kWatchExtKeyPlayRecordingWithUUIDString;

// User Info shit
extern NSString *const kUserInfoKeyStateToLoadOnAppBecomesActive;
extern NSString *const kUserInfoKeyRecordingToPlayUUIDString;

@interface Constants : NSObject

+ (NSString *)documentsDirectory;

@end
