#import "Recording.h"
#import "Constants.h"
#import <AVFoundation/AVFoundation.h>

@interface Recording () <NSCoding>

@property (nonatomic, strong, readwrite) NSArray *tags;
//@property (nonatomic, copy, readwrite) NSData *data;
@property (nonatomic, strong, readwrite) NSUUID *uuid;

@end

@implementation Recording

- (instancetype)init {
    [self doesNotRecognizeSelector:_cmd];
    abort();
}

- (instancetype)initWithData:(NSData *)data date:(NSDate *)recordedDate length:(NSTimeInterval)length title:(NSString *)title {
    self = [super init];
    if (self) {
        _date = recordedDate;
        _lengthAsTimeInterval = length;
        _title = title ? title : @"";
        _uuid = [[NSUUID alloc] init];
        
        [data writeToFile:[self urlString] atomically:YES];
    }
    return self;
}

- (instancetype)initWithData:(NSData *)data date:(NSDate *)startDate length:(NSTimeInterval)length {
    return [self initWithData:data date:startDate length:length title:nil];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        // uuid, title, date, tags, length as time interval
        _uuid = [aDecoder decodeObjectForKey:@"uuid"];
        _title = [aDecoder decodeObjectForKey:@"title"];
        _date = [aDecoder decodeObjectForKey:@"date"];
        _tags = [aDecoder decodeObjectForKey:@"tags"];
        _lengthAsTimeInterval = [aDecoder decodeDoubleForKey:@"length"];
        _currentPlaybackPosistion = [aDecoder decodeDoubleForKey:@"currentPlaybackPosistion"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:_uuid forKey:@"uuid"];
    [aCoder encodeObject:_title forKey:@"title"];
    [aCoder encodeObject:_date forKey:@"date"];
    [aCoder encodeObject:_tags forKey:@"tags"];
    [aCoder encodeDouble:_lengthAsTimeInterval forKey:@"length"];
    [aCoder encodeDouble:_currentPlaybackPosistion forKey:@"currentPlaybackPosistion"];
}

- (NSData *)data {
    return [NSData dataWithContentsOfFile:self.urlString];
}

- (void)setCurrentPlaybackPosistion:(NSTimeInterval)currentPlaybackPosistion {
    if (currentPlaybackPosistion >= self.lengthAsTimeInterval || currentPlaybackPosistion < 0.0f) {
        _currentPlaybackPosistion = 0.0f;
    } else {
        _currentPlaybackPosistion = currentPlaybackPosistion;
    }
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

- (NSString *)dateForAppleWatch {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"M/d/yy"];
    return [dateFormatter stringFromDate:self.date];
}

- (NSString *)dateAsString {
    NSString *englishNumeral;    
    switch (self.dateComponents.day) {
        case 1:
        case 21:
        case 31:
            englishNumeral = @"st";
            break;
        case 2:
        case 22:
            englishNumeral = @"nd";
            break;
        case 3:
        case 23:
            englishNumeral = @"rd";
            break;
        default:
            englishNumeral = @"th";
            break;
    }
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MMMM d"];
    NSDateFormatter *timeFormatter = [[NSDateFormatter alloc] init];
    [timeFormatter setDateFormat:@"h:mm a"];
    return [NSString stringWithFormat:@"%@%@ at %@", [dateFormatter stringFromDate:self.date], englishNumeral, [timeFormatter stringFromDate:self.date]];
}

#pragma mark - url methods

- (NSURL *)url {
    NSURL *fromFilePath = [NSURL fileURLWithPath:self.urlString];
    return fromFilePath;
}

- (NSString *)urlString {
    return [NSString stringWithFormat:@"%@/%@%@", [Constants documentsDirectory], self.uuid.UUIDString, kRecorderFormatTypeAsString];
}

- (AVAsset *)avAsset {
    return [AVURLAsset assetWithURL:[self url]];
}

#pragma mark - UIActivityItem

- (Recording *)activityViewControllerPlaceholderItem:(UIActivityViewController *)activityViewController {
    Recording *placeholderRecording = [[Recording alloc] initWithData:nil date:self.date length:self.lengthAsTimeInterval title:self.title];
    
    return placeholderRecording;
}

- (Recording *)activityViewController:(UIActivityViewController *)activityViewController itemForActivityType:(NSString *)activityType {
    return self;
}

@end
