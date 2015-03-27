//
//  CKConstants.h
//  Recorder
//
//  Created by Brian Radebaugh on 12/5/14.
//  Copyright (c) 2014 CleverKnot. All rights reserved.
//

#import <Foundation/Foundation.h>

// Recording shit
static NSString *const kRecorderPrimaryAudioFile = @"RecorderPrimaryAudioFile.m4a";
static NSString *const kRecorderSavedAudioFileName = @"RecorderSavedAudioFileName.m4a";
static NSString *const kRecorderConcatenatedAudioFileName = @"RecorderConcatenatedAudioFileName.m4a";
static NSString *const kRecorderFormatTypeAsString = @".m4a";

// Notification shit
static NSString *const kNotificationKeyDidFinishedRecordingFromWatch = @"NotificationKeyDidFinishedRecordingFromWatch";
static NSString *const kNotificationKeyApplicationDidBecomeActive = @"kNotificationKeyApplicationDidBecomeActive";
//static NSString *const kNotificationKeyDidPassMidnight = @"kNotificationKeyDidPassMidnight";

// UserDefaults shit
static NSString *const kUserDefaultsKeyMainColor = @"UserDefaultsKeyMainColor";
static NSString *const kUserDefaultsKeyWillResignActiveDate = @"UserDefaultsKeyWillResignActiveDate";
static NSString *const kUserDefaultsKeyCurrentState = @"UserDefaultsKeyCurrentState";

// WatchKit shit
static NSString *const kWatchExtKeyMessageType = @"WatchExtKeyMessageType";
static NSString *const kWatchExtKeyMessageTypeWillActivate = @"WatchExtKeyMessageTypeWillActivate";
static NSString *const kWatchExtKeyMessageTypeRecordButtonPressed = @"WatchExtKeyMessageTypeRecordButtonPressed";
static NSString *const kWatchExtKeyIsRecording = @"kWatchExtKeyIsRecording";

// User Info shit
static NSString *const kUserInfoKeyStateToLoadOnAppBecomesActive = @"UserInfoKeyStateToLoadOnAppBecomesActive";


@interface Constants : NSObject

+ (NSString *)documentsDirectory;

@end
