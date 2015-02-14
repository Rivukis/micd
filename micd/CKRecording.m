//
//  CKRecording.m
//  Recorder
//
//  Created by Brian Radebaugh on 12/5/14.
//  Copyright (c) 2014 CleverKnot. All rights reserved.
//

#import "CKRecording.h"
#import "CKConstants.h"

@interface CKRecording ()

@property (nonatomic, strong, readwrite) NSArray *tags;

@property (nonatomic, copy, readwrite) NSData *data;
@property (nonatomic, strong, readwrite) NSUUID *uuid;

@end

@implementation CKRecording

- (instancetype)init {
    [self doesNotRecognizeSelector:_cmd];
    abort();
}

- (instancetype)initWithData:(NSData *)data date:(NSDate *)recordedDate length:(NSTimeInterval)length name:(NSString *)name {
    self = [super init];
    if (self) {
        _data = data;
        _recordedDateAsDate = recordedDate;
        _lengthAsTimeInterval = length;
        _title = name ?: @"";
        _uuid = [[NSUUID alloc] init];
    }
    return self;
}

- (instancetype)initWithData:(NSData *)data date:(NSDate *)startDate length:(NSTimeInterval)length {
    return [self initWithData:data date:startDate length:length name:nil];
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

- (NSDateComponents *)recordedDate {
    
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
    return [calender components:componentOptions fromDate:self.recordedDateAsDate];
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

#pragma mark - url methods

//- (NSURL *)url {
//    return [NSURL URLWithString:self.urlString];
//    
//}
//
//- (NSString *)urlString {
//    return [NSString stringWithFormat:@"%@/%@%@", [CKConstants documentsDirectory], self.uuid.UUIDString, kRecorderFormatTypeAsString];
//}

@end
