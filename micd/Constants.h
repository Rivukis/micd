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
//extern NSString *const kNotificationKeyControlPlayerFromWatch;

//extern NSString *const kNotificationKeyControlPlayerFromWatchValue;
//extern NSString *const kNotificationKeyControlPlayerFromWatchValuePlay;
//extern NSString *const kNotificationKeyControlPlayerFromWatchValuePause;
//extern NSString *const kNotificationKeyControlPlayerFromWatchValuePrevious;
//extern NSString *const kNotificationKeyControlPlayerFromWatchValueNext;

// UserDefaults shit
extern NSString *const kUserDefaultsKeyCurrentVersion;
extern NSString *const kUserDefaultsKeyMainColor;
extern NSString *const kUserDefaultsKeyStartRecordingOnAppDidBecomeActive;
extern NSString *const kUserDefaultsKeyRecordingsSavePlaybackPosition;

// WatchKit shit
extern NSString *const kWatchExtKeyMessageType;
extern NSString *const kWatchExtKeyMessageTypeGetRecorderInfo;
extern NSString *const kWatchExtKeyMessageTypeRecordButtonPressed;
extern NSString *const kWatchExtKeyMessageTypeGetRecordingsList;
extern NSString *const kWatchExtKeyMessageTypeRecordingPressed;
//extern NSString *const kWatchExtKeyMessageTypePlayButtonPressed;
//extern NSString *const kWatchExtKeyMessageTypePauseButtonPressed;
//extern NSString *const kWatchExtKeyMessageTypePreviousButtonPressed;
//extern NSString *const kWatchExtKeyMessageTypeNextButtonPressed;

extern NSString *const kWatchExtKeyIsRecording;
//extern NSString *const kWatchExtKeyIsPlaying;
extern NSString *const kWatchExtKeyRecordingsList;
extern NSString *const kWatchExtKeyPlayRecordingIndex;

// User Info shit
extern NSString *const kUserInfoKeyStateToLoadOnAppBecomesActive;
extern NSString *const kUserInfoKeyRecordingToPlayIndex;

@interface Constants : NSObject

+ (NSString *)documentsDirectory;

@end
