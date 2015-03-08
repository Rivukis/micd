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


+ (NSArray *)arrayOfSectionsForRecordings:(NSArray *)recordings ascending:(BOOL)ascending {
    NSDateComponents *nowDateComponents = [[NSCalendar currentCalendar] components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay
                                                                      fromDate:[NSDate date]];
    
    NSSortDescriptor* sortByDate = [NSSortDescriptor sortDescriptorWithKey:@"date" ascending:ascending];
    NSMutableArray *sortedRecordings = [NSMutableArray arrayWithArray:recordings];
    [sortedRecordings sortUsingDescriptors:@[sortByDate]];
    
    NSMutableArray *assemblingSections = [NSMutableArray array];
    
    for (Recording *recording in sortedRecordings) {
        RecordingsSection *lastAddedMonthSection = assemblingSections.lastObject;
        
        BOOL recordingIsThisYear = (recording.dateComponents.year == nowDateComponents.year);
        BOOL recordingIsThisMonth = (recording.dateComponents.month == nowDateComponents.month && recordingIsThisYear);
        BOOL recordingIsThisDay = (recording.dateComponents.day == nowDateComponents.day && recordingIsThisMonth);
        
        BOOL sectionAndRecordingIsThisDayMatches = lastAddedMonthSection.isThisDay == recordingIsThisDay;
        BOOL sectionAndRecordingYearMatches = lastAddedMonthSection.dateComponents.year == recording.dateComponents.year;
        BOOL sectionAndRecordingMonthMatches = lastAddedMonthSection.dateComponents.month == recording.dateComponents.month;
        
        if (lastAddedMonthSection == nil || !sectionAndRecordingIsThisDayMatches || !sectionAndRecordingMonthMatches || !sectionAndRecordingYearMatches) {
            lastAddedMonthSection = [[RecordingsSection alloc] initWithYear:recording.dateComponents.year month:recording.dateComponents.month];
            lastAddedMonthSection.isThisDay = recordingIsThisDay;
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

