#import <Foundation/Foundation.h>

// Recording shit
extern NSString *const kRecorderPrimaryAudioFile;
extern NSString *const kRecorderSavedAudioFileName;
extern NSString *const kRecorderConcatenatedAudioFileName;
extern NSString *const kRecorderFormatTypeAsString;

// Notification shit
extern NSString *const kNotificationKeyDidFinishedRecordingFromWatch;
extern NSString *const kNotificationKeyApplicationDidBecomeActive;

// UserDefaults shit
extern NSString *const kUserDefaultsKeyCurrentVersion;
extern NSString *const kUserDefaultsKeyMainColor;
extern NSString *const kUserDefaultsKeyStartRecordingOnAppDidBecomeActive;
extern NSString *const kUserDefaultsKeyRecordingsSavePlaybackPosition;

// WatchKit shit
extern NSString *const kWatchExtKeyMessageType;
extern NSString *const kWatchExtKeyMessageTypeWillActivate;
extern NSString *const kWatchExtKeyMessageTypeRecordButtonPressed;
extern NSString *const kWatchExtKeyIsRecording;

// User Info shit
extern NSString *const kUserInfoKeyStateToLoadOnAppBecomesActive;

@interface Constants : NSObject

+ (NSString *)documentsDirectory;

@end
