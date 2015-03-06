//
//  CKRecording.h
//  Recorder
//
//  Created by Brian Radebaugh on 12/5/14.
//  Copyright (c) 2014 CleverKnot. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CGBase.h>

@class AVAsset;

struct Length {
    NSInteger hours;
    NSInteger minutes;
    NSInteger seconds;
    NSInteger centiseconds;
};

@interface Recording : NSObject

@property (nonatomic, strong, readonly) NSUUID *uuid;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong, readonly) NSArray *tags;

@property (nonatomic, copy, readonly) NSData *data;
@property (nonatomic, weak, readonly) AVAsset *avAsset;

@property (nonatomic, strong, readonly) NSDate *date;
@property (nonatomic, strong, readonly) NSDateComponents *dateComponents;
@property (nonatomic, strong) NSString *dateAsFullString;
@property (nonatomic, strong) NSString *dateAsString;

@property (nonatomic, assign, readonly) NSTimeInterval lengthAsTimeInterval;
@property (nonatomic, assign, readonly) struct Length length;
@property (nonatomic, weak, readonly) NSString *lengthToDiplay;

- (instancetype)initWithData:(NSData *)data date:(NSDate *)startDate length:(NSTimeInterval)length name:(NSString *)name;
- (instancetype)initWithData:(NSData *)data date:(NSDate *)startDate length:(NSTimeInterval)length;

//TODO: make init method for keyedunarchiver and pass in all archived data (including UUID)

- (BOOL)addTag:(NSString *)tag;
- (BOOL)removeTag:(NSString *)tag;

@end
