//
//  CKConstants.h
//  Recorder
//
//  Created by Brian Radebaugh on 12/5/14.
//  Copyright (c) 2014 CleverKnot. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString *const kRecorderPrimaryAudioFile = @"RecorderPrimaryAudioFile.m4a";
static NSString *const kRecorderSavedAudioFileName = @"RecorderSavedAudioFileName.m4a";
static NSString *const kRecorderConcatenatedAudioFileName = @"RecorderConcatenatedAudioFileName.m4a";
static NSString *const kRecorderFormatTypeAsString = @".m4a";

static NSString *const kAppWillResignActiveNotification = @"AppWillResignActiveNotification";

static NSString *const kMainColorUserDefaultsKey = @"MainColorUserDefaultsKey";

@interface Constants : NSObject

+ (NSString *)documentsDirectory;

@end
