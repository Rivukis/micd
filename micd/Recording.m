#import "Recording.h"
#import "Constants.h"
#import <AVFoundation/AVFoundation.h>

@interface Recording () <NSCoding>

@property (nonatomic, strong, readwrite) NSArray *tags;
@property (nonatomic, strong, readwrite) NSUUID *uuid;
@property (nonatomic, strong, readwrite) NSDate *date;
@property (nonatomic, assign, readwrite) NSInteger part;
@property (nonatomic, assign, readwrite) NSTimeInterval lengthAsTimeInterval;

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
        _part = 0;
        
        [data writeToFile:[self urlString] atomically:YES];
    }
    return self;
}

- (instancetype)initWithData:(NSData *)data date:(NSDate *)startDate length:(NSTimeInterval)length {
    return [self initWithData:data date:startDate length:length title:nil];
}

static NSString *const kUUIDKey = @"uuid";
static NSString *const kTitleKey = @"title";
static NSString *const kDateKey = @"date";
static NSString *const kPartKey = @"part";
static NSString *const kTagsKey = @"tags";
static NSString *const kLengthKey = @"length";
static NSString *const kOverrideLengthKey = @"overrideLength";
static NSString *const kCurrentPlaybackPositionKey = @"currentPlaybackPosition";

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        // uuid, title, date, tags, length as time interval
        _uuid = [aDecoder decodeObjectForKey:kUUIDKey];
        _title = [aDecoder decodeObjectForKey:kTitleKey];
        _date = [aDecoder decodeObjectForKey:kDateKey];
        _part = [aDecoder decodeIntegerForKey:kPartKey];
        _tags = [aDecoder decodeObjectForKey:kTagsKey];
        _lengthAsTimeInterval = [aDecoder decodeDoubleForKey:kLengthKey];
        _currentPlaybackPosistion = [aDecoder decodeDoubleForKey:kCurrentPlaybackPositionKey];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:_uuid forKey:kUUIDKey];
    [aCoder encodeObject:_title forKey:kTitleKey];
    [aCoder encodeObject:_date forKey:kDateKey];
    [aCoder encodeInteger:_part forKey:kPartKey];
    [aCoder encodeObject:_tags forKey:kTagsKey];
    [aCoder encodeDouble:_lengthAsTimeInterval forKey:kLengthKey];
    [aCoder encodeDouble:_currentPlaybackPosistion forKey:kCurrentPlaybackPositionKey];
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

- (void)setPart:(NSInteger)part withOriginalTrackDate:(NSDate *)date {
    if (part <=0 || date == nil) {
        self.part = 0;
    } else {
        self.part = part;
        self.date = date;
    }
}

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
