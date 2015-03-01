//
//  CKRecording.m
//  Recorder
//
//  Created by Brian Radebaugh on 12/5/14.
//  Copyright (c) 2014 CleverKnot. All rights reserved.
//

#import "Recording.h"
#import "Constants.h"

@interface Recording ()

@property (nonatomic, strong, readwrite) NSString *title;
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
    }
    return self;
}

- (instancetype)initWithData:(NSData *)data date:(NSDate *)startDate length:(NSTimeInterval)length {
    return [self initWithData:data date:startDate length:length name:nil];
}

- (BOOL)setRecordingTitle:(NSString *)title {
    if (title.length == 0) {
        return NO;
    }
    self.title = title;
    return YES;
}

- (NSString *)dateAsFullString {
    if (!_dateAsFullString) {
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateStyle:NSDateFormatterFullStyle];
        _dateAsFullString = [dateFormatter stringFromDate:self.date];
    }
    
    return _dateAsFullString;
}

- (NSString *)dateAsShortString {
    if (!_dateAsShortString) {
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
        _dateAsShortString = [dateFormatter stringFromDate:self.date];
    }
    
    return _dateAsShortString;
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

//- (NSURL *)url {
//    return [NSURL URLWithString:self.urlString];
//    
//}
//
//- (NSString *)urlString {
//    return [NSString stringWithFormat:@"%@/%@%@", [CKConstants documentsDirectory], self.uuid.UUIDString, kRecorderFormatTypeAsString];
//}

@end
