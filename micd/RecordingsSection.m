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

- (instancetype)initWithYear:(NSInteger)year month:(NSInteger)month {
    self = [super init];
    if (self) {
        _cellModels = [NSMutableArray array];
        _dateComponents = [[NSDateComponents alloc] init];
        _dateComponents.year = year ?: 1970;
        _dateComponents.month = month ?: 1;
    }
    return self;
}


+ (NSArray *)arrayOfSectionsForRecordings:(NSArray *)recordings ascending:(BOOL)ascending {
    NSDateComponents *nowDateComponents = [[NSCalendar currentCalendar] components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay
                                                                      fromDate:[NSDate date]];
    
    NSSortDescriptor* sortByDate = [NSSortDescriptor sortDescriptorWithKey:@"date" ascending:ascending];
    NSMutableArray *sortedRecordings = [NSMutableArray arrayWithArray:recordings];
    [sortedRecordings sortUsingDescriptors:@[sortByDate]];
    
    NSMutableArray *assemblingSections = [NSMutableArray array];
    
    for (Recording *recording in sortedRecordings) {
        RecordingsSection *lastAddedMonthSection = assemblingSections.lastObject;
        
        NSDateComponents *beginningOfTodayComponents = nowDateComponents;
        beginningOfTodayComponents.hour = 0;
        beginningOfTodayComponents.minute = 0;
        beginningOfTodayComponents.second = 0;
        NSDate *beginningOfToday = [[NSCalendar currentCalendar] dateFromComponents:beginningOfTodayComponents];
        NSDate *beginningOf6DaysAgo = [beginningOfToday dateByAddingTimeInterval:-60*60*24*6];
        
        BOOL recordingIsThisYear = (recording.dateComponents.year == nowDateComponents.year);
        BOOL recordingIsThisMonth = (recording.dateComponents.month == nowDateComponents.month && recordingIsThisYear);
        BOOL recordingIsWithin6DaysAgo = [recording.date compare:beginningOf6DaysAgo] == NSOrderedDescending;
        
        NSInteger recordingDaysAgo = NSNotFound;
        
        if (recordingIsWithin6DaysAgo) {
            for (NSInteger daysAgo = 6; daysAgo >= 0; daysAgo--) {
                /*
                 would think that it should just be daysAgo and not daysAgo-1 but everything is shifted up a day otherwise (compare: acts weird)
                 when getting a dates components enter 252 on components parameter to get year, month, day, hour, minute, second
                 */
                NSDate *beginningOfDay = [beginningOfToday dateByAddingTimeInterval:-60*60*24*(daysAgo-1)];
                if ([recording.date compare:beginningOfDay] == NSOrderedAscending) {
                    recordingDaysAgo = daysAgo;
                    break;
                }
            }
        }
        
        BOOL sectionAndRecordingYearMatches = lastAddedMonthSection.dateComponents.year == recording.dateComponents.year;
        BOOL sectionAndRecordingMonthMatches = lastAddedMonthSection.dateComponents.month == recording.dateComponents.month;
        BOOL sectionAndRecordingDayAgoMatches = lastAddedMonthSection.daysAgo == recordingDaysAgo;
        BOOL shouldCreateNewSection = lastAddedMonthSection == nil
                                      || !sectionAndRecordingDayAgoMatches
                                      || !sectionAndRecordingMonthMatches
                                      || !sectionAndRecordingYearMatches;
        
        if (shouldCreateNewSection) {
            lastAddedMonthSection = [[RecordingsSection alloc] initWithYear:recording.dateComponents.year month:recording.dateComponents.month];
            lastAddedMonthSection.daysAgo = recordingDaysAgo;
            lastAddedMonthSection.isThisMonth = recordingIsThisMonth;
            lastAddedMonthSection.isThisYear = recordingIsThisYear;
            
            [assemblingSections addObject:lastAddedMonthSection];
        }
        
        RecordingCellModel *cellModel = [[RecordingCellModel alloc] initWithRecording:recording];
        [lastAddedMonthSection.cellModels addObject:cellModel];
    }
    
    return [assemblingSections copy];
}

- (RecordingCellModel *)cellModelAtIndex:(NSInteger)index {
    if (self.cellModels.count == 0) return nil;
    
    return self.cellModels[index];
}

- (NSInteger)numberOfCellModels {
    return self.cellModels.count;
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

