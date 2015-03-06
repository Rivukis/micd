//
//  RecordingsSection.m
//  micd
//
//  Created by Timothy Hise on 2/27/15.
//  Copyright (c) 2015 CleverKnot. All rights reserved.
//

#import "RecordingsSection.h"
#import "Recording.h"
#import "RecordingCellModel.h"

@interface RecordingsSection ()

@property (nonatomic, strong) NSDateComponents *dateComponents;
@property (nonatomic, strong) NSMutableArray *cellModels;
@property (nonatomic, assign) BOOL isThisDay;
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

+ (NSArray *)arrayOfSectionsForRecordings:(NSArray *)recordings {
    NSDateComponents *nowComponents = [[NSCalendar currentCalendar] components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay
                                                                      fromDate:[NSDate date]];
    
    NSSortDescriptor* sortByDate = [NSSortDescriptor sortDescriptorWithKey:@"date" ascending:NO];
    NSMutableArray *sortedRecordings = [NSMutableArray arrayWithArray:recordings];
    [sortedRecordings sortUsingDescriptors:[NSArray arrayWithObject:sortByDate]];
    
    NSMutableArray *assemblingSections = [NSMutableArray array];
    
    for (Recording *recording in sortedRecordings) {
        if (recording.dateComponents.year == nowComponents.year && recording.dateComponents.month == nowComponents.month && recording.dateComponents.day == nowComponents.day) {
            RecordingsSection *todaySection = assemblingSections.firstObject;
            if (todaySection == nil) {
                todaySection = [[RecordingsSection alloc] initWithYear:recording.dateComponents.year
                                                                 month:recording.dateComponents.month];
                todaySection.isThisDay = YES;
                [assemblingSections addObject:todaySection];
            }
            RecordingCellModel *cellModel = [[RecordingCellModel alloc] initWithRecording:recording];
            [todaySection.cellModels addObject:cellModel];
        } else {
            RecordingsSection *lastAddedMonthSection = assemblingSections.lastObject;
            if (lastAddedMonthSection.isThisDay || lastAddedMonthSection.dateComponents.year != recording.dateComponents.year || lastAddedMonthSection.dateComponents.month != recording.dateComponents.month) {
                lastAddedMonthSection = [[RecordingsSection alloc] initWithYear:recording.dateComponents.year
                                                                          month:recording.dateComponents.month];
                
                if (recording.dateComponents.year == nowComponents.year) {
                    if (recording.dateComponents.month == nowComponents.month) {
                        lastAddedMonthSection.isThisMonth = YES;
                    } else {
                        lastAddedMonthSection.isThisYear = YES;
                    }
                }
                
                [assemblingSections addObject:lastAddedMonthSection];
            }
            RecordingCellModel *cellModel = [[RecordingCellModel alloc] initWithRecording:recording];
            [lastAddedMonthSection.cellModels addObject:cellModel];
        }
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
    if (self.isThisDay) {
        return @"Today";
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

- (NSString *)description {
    return [NSString stringWithFormat:@"%@ - isThisDay:%i isThisMonth:%i \n%@", self.dateAsString, self.isThisDay, self.isThisMonth, self.cellModels];
}

@end
