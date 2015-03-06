//
//  CKRecording.m
//  Recorder
//
//  Created by Brian Radebaugh on 12/5/14.
//  Copyright (c) 2014 CleverKnot. All rights reserved.
//

#import "Recording.h"
#import "Constants.h"
#import <AVFoundation/AVFoundation.h>

@interface Recording ()

@property (nonatomic, strong, readwrite) NSArray *tags;
@property (nonatomic, copy, readwrite) NSData *data;
@property (nonatomic, strong, readwrite) NSUUID *uuid;

@end

@implementation Recording

- (instancetype)init {
    [self doesNotRecognizeSelector:_cmd];
    abort();
}

- (instancetype)initWithData:(NSData *)data date:(NSDate *)recordedDate length:(NSTimeInterval)length name:(NSString *)name {
    self = [super init];
    if (self) {
        _data = data;
        _date = recordedDate;
        _lengthAsTimeInterval = length;
        _title = name ? name : @"";
        _uuid = [[NSUUID alloc] init];
        
        if (_data) {
            [_data writeToFile:[self urlString] atomically:YES];
        } else {
            // possibly get data from url when data has already been saved
            // _data = [fileManager get data from file]
        }
    }
    return self;
}

- (instancetype)initWithData:(NSData *)data date:(NSDate *)startDate length:(NSTimeInterval)length {
    return [self initWithData:data date:startDate length:length name:nil];
}

- (NSString *)title {
    if (_title.length > 0) {
        return _title;
    } else {
        return self.dateAsString;
    }
}

- (NSString *)dateAsFullString {
    if (!_dateAsFullString) {
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateStyle:NSDateFormatterFullStyle];
        _dateAsFullString = [dateFormatter stringFromDate:self.date];
    }
    
    return _dateAsFullString;
}

- (NSString *)dateAsString {
    if (!_dateAsString) {
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"MMMM d, h:mma"];
        _dateAsString = [dateFormatter stringFromDate:self.date];
    }
    
    return _dateAsString;
}

#pragma mark - tag methods

- (BOOL)addTag:(NSString *)tag {
    
    // account for other unacceptable characters (i.e. punctuation)
    
    NSRange rangeOfSpace = [tag rangeOfString:@" "];
    
    if (rangeOfSpace.location != NSNotFound) {
        return NO;
    }
    
    self.tags = [self.tags arrayByAddingObject:tag];
    return YES;
}

- (BOOL)removeTag:(NSString *)tag {
    if (![self.tags containsObject:tag]) {
        return NO;
    }
    
    NSMutableArray *temp = self.tags.mutableCopy;
    [temp removeObject:tag];
    self.tags = temp.copy;
    return YES;
}

- (NSArray *)tags {
    _tags = (_tags) ?: [NSArray array];
    return _tags;
}

#pragma mark - time and date methods

- (NSDateComponents *)dateComponents {
    
    NSCalendar *calender = [NSCalendar currentCalendar];
    NSInteger componentOptions = NSCalendarUnitYear |
                                 NSCalendarUnitMonth |
                                 NSCalendarUnitDay |
                                 NSCalendarUnitHour |
                                 NSCalendarUnitMinute |
                                 NSCalendarUnitSecond |
                                 NSCalendarUnitNanosecond |
                                 NSCalendarUnitWeekdayOrdinal |
                                 NSCalendarUnitTimeZone;
    return [calender components:componentOptions fromDate:self.date];
}

- (struct Length)length {
    NSInteger lengthInSeconds = trunc(self.lengthAsTimeInterval);
    NSInteger lengthInMinutes = trunc(lengthInSeconds / 60.0f);
    NSInteger lengthInHours = trunc(lengthInMinutes / 60.0f);
    
    struct Length length;
    length.hours = lengthInHours;
    length.minutes = lengthInMinutes - lengthInHours * 60;
    length.seconds = lengthInSeconds - lengthInMinutes * 60;
    length.centiseconds = trunc((self.lengthAsTimeInterval - lengthInSeconds) * 100);
    
    return length;
}

- (NSString *)lengthToDiplay {
    NSString *displayableLength;
    if (self.length.hours) {
        displayableLength = [NSString stringWithFormat:@"%ld:%02ld:%02ld", (long)self.length.hours, (long)self.length.minutes, (long)self.length.seconds];
    } else {
        displayableLength = [NSString stringWithFormat:@"%ld:%02ld", (long)self.length.minutes, (long)self.length.seconds];
    }
    return displayableLength;
}

#pragma mark - url methods

- (NSURL *)url {
    NSURL *fromString = [NSURL URLWithString:self.urlString];
    NSURL *fromFilePath = [NSURL fileURLWithPath:self.urlString];
    return fromFilePath;
}

- (NSString *)urlString {
    return [NSString stringWithFormat:@"%@/%@%@", [Constants documentsDirectory], self.uuid.UUIDString, kRecorderFormatTypeAsString];
}

- (AVAsset *)avAsset {
    return [AVURLAsset assetWithURL:[self url]];
}

@end
