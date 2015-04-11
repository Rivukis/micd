#import <Foundation/Foundation.h>

// Recording shit
extern NSString *const kRecorderPrimaryAudioFile;
extern NSString *const kRecorderSavedAudioFileName;
extern NSString *const kRecorderConcatenatedAudioFileName;
extern NSString *const kRecorderFormatTypeAsString;

// Notification shit
extern NSString *const kNotificationKeyRecordPressedFromWatch;
extern NSString *const kNotificationKeyApplicationDidBecomeActive;
extern NSString *const kNotificationKeyApplicationWillResignActive;
extern NSString *const kNotificationKeyRecordingPressedFromWatch;

// UserDefaults shit
extern NSString *const kUserDefaultsKeyCurrentVersion;
extern NSString *const kUserDefaultsKeyMainColor;
extern NSString *const kUserDefaultsKeyStartRecordingOnAppDidBecomeActive;
extern NSString *const kUserDefaultsKeyRecordingsSavePlaybackPosition;
extern NSString *const kUserDefaultsKeyAutoStartRecordingAfterMaximumReached;
extern NSString *const kUserDefaultsKeyMaxRecordingLength;
extern NSString *const kUserDefaultsKeyLoveMicdQuestionAnswered;
extern NSString *const kUserDefaultsKeySessionIsActive;

// WatchKit shit
extern NSInteger const kWatchExtNumberOfRecordingsShown;
extern NSString *const kWatchExtKeyMessageType;
extern NSString *const kWatchExtKeyIsRecording;
extern NSString *const kWatchExtKeyRecordingsList;
extern NSString *const kWatchExtKeyPlayRecordingWithUUIDString;

extern NSString *const kWatchExtMessageTypeGetRecorderInfo;
extern NSString *const kWatchExtMessageTypeRecordButtonPressed;
extern NSString *const kWatchExtMessageTypeGetRecordingsList;
extern NSString *const kWatchExtMessageTypeRecordingPressed;

extern NSString *const kWatchExtRecordingDictKeyTitle;
extern NSString *const kWatchExtRecordingDictKeyUUID;
extern NSString *const kWatchExtRecordingDictKeyIsLoaded;
extern NSString *const kWatchExtRecordingDictKeyDate;
extern NSString *const kWatchExtRecordingDictKeyLength;

// User Info shit
extern NSString *const kUserInfoKeyStateToLoadOnAppBecomesActive;
extern NSString *const kUserInfoKeyRecordingToPlayUUIDString;

@interface Constants : NSObject

+ (NSString *)documentsDirectory;

@end
