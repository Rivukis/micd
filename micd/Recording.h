//
//  CKRecording.h
//  Recorder
//
//  Created by Brian Radebaugh on 12/5/14.
//  Copyright (c) 2014 CleverKnot. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CGBase.h>

struct Length {
    NSInteger hours;
    NSInteger minutes;
    NSInteger seconds;
    NSInteger centiseconds;
};

@interface Recording : NSObject

@property (nonatomic, strong, readonly) NSString *title;
@property (nonatomic, strong, readonly) NSArray *tags;

@property (nonatomic, copy, readonly) NSData *data;
@property (nonatomic, strong, readonly) NSDate *recordedDateAsDate;
@property (nonatomic, strong, readonly) NSDateComponents *recordedDate;
@property (nonatomic, assign, readonly) NSTimeInterval lengthAsTimeInterval;
@property (nonatomic, assign, readonly) struct Length length;
@property (nonatomic, strong, readonly) NSUUID *uuid;

// time stamp (moment the recording starts - hour and minute (may include seconds)
// date (to the day only)
// length nstime (possibly make custom timestamp class)
// tags nsarray of nsstrings (no spaces per tag)

- (instancetype)initWithData:(NSData *)data date:(NSDate *)startDate length:(NSTimeInterval)length name:(NSString *)name;
- (instancetype)initWithData:(NSData *)data date:(NSDate *)startDate length:(NSTimeInterval)length;

- (BOOL)setRecordingTitle:(NSString *)title;
- (BOOL)addTag:(NSString *)tag;
- (BOOL)removeTag:(NSString *)tag;

@end
