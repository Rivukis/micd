#import "RecordingsSection.h"
#import "Recording.h"
#import "RecordingCellModel.h"

@interface RecordingsSection ()

@property (nonatomic, strong) NSDateComponents *dateComponents;
@property (nonatomic, strong) NSMutableArray *cellModels;
@property (nonatomic, assign) NSInteger daysAgo;
@property (nonatomic, assign) BOOL isThisMonth;
@property (nonatomic, assign) BOOL isThisYear;

@end

@implementation RecordingsSection

- (instancetype)initWithRecordingCellModels:(NSArray *)cellModels Year:(NSInteger)year month:(NSInteger)month daysAgo:(NSInteger)daysAgo isThisYear:(BOOL)isThisYear isThisMonth:(BOOL)isThisMonth {
    self = [super init];
    if (self) {
        _cellModels = [cellModels mutableCopy] ?: [NSMutableArray array];
        _dateComponents = [[NSDateComponents alloc] init];
        _dateComponents.year = year ?: 1970;
        _dateComponents.month = month ?: 1;
        _daysAgo = daysAgo;
        _isThisYear = isThisYear;
        _isThisMonth = isThisMonth;
    }
    return self;
}

- (void)addToTodaySectionNewRecording:(Recording *)recording withCellModelDelegate:(id<RecordingCellModelDelegate>)delegate {
    if (self.isToday) {
        RecordingCellModel *cellModel = [[RecordingCellModel alloc] initWithRecording:recording delegate:delegate];
        [self.cellModels insertObject:cellModel atIndex:0];
    }
}

- (void)deleteRecordingCellModelAtIndex:(NSInteger)index {
    [self.cellModels removeObjectAtIndex:index];
}

- (RecordingCellModel *)cellModelAtIndex:(NSInteger)index {
    if (self.cellModels.count == 0) return nil;
    
    return self.cellModels[index];
}

- (NSInteger)numberOfCellModels {
    return self.cellModels.count;
}

- (BOOL)isToday {
    return self.daysAgo == 0;
}

- (NSString *)dateAsString {
    if (self.daysAgo != NSNotFound) {
        if (self.daysAgo == 0) {
            return @"Today";
        } else if (self.daysAgo == 1) {
            return @"Yesterday";
        } else {
            NSInteger weekDay = [[NSCalendar currentCalendar] component:NSCalendarUnitWeekday
                                                               fromDate:[[NSDate date] dateByAddingTimeInterval:-60*60*24*self.daysAgo]];
            return [self weekDayStringFromInteger:weekDay];
        }
        
    } else if (self.isThisMonth) {
        return @"This Month";
    }
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    if (self.isThisYear) {
        [formatter setDateFormat:@"MMMM"];
    } else {
        [formatter setDateFormat:@"MMMM yyyy"];
    }
    
    NSDate *date = [[NSCalendar currentCalendar] dateFromComponents:self.dateComponents];
    return [formatter stringFromDate:date];
}

- (NSString *)weekDayStringFromInteger:(NSInteger)weekDayInteger {
    switch (weekDayInteger) {
        case 1:     return @"Sunday";
        case 2:     return @"Monday";
        case 3:     return @"Tuesday";
        case 4:     return @"Wednesday";
        case 5:     return @"Thursday";
        case 6:     return @"Friday";
        case 7:     return @"Saturday";
        default:    return @"invalid weekday";
    }
}

- (NSString *)description {
    return [NSString stringWithFormat:@"%@ - daysAgo:%li isThisMonth:%i \n%@", self.dateAsString, self.daysAgo, self.isThisMonth, self.cellModels];
}

@end

