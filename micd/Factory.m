#import "Factory.h"
#import "Constants.h"
#import "RecordingsSection.h"
#import "RecordingCellModel.h"
#import "Recording.h"
#import "DataSourceController.h"

@interface RecordingsSection (Private)
@property (nonatomic, strong) NSMutableArray *cellModels;
@property (nonatomic, strong) NSDateComponents *dateComponents;
@property (nonatomic, assign) NSInteger daysAgo;
@property (nonatomic, assign) BOOL isThisMonth;
@property (nonatomic, assign) BOOL isThisYear;
@end

@implementation Factory

+ (NSArray *)arrayOfSectionsForRecordings:(NSArray *)recordings ascending:(BOOL)ascending cellModelDelegate:(id<RecordingCellModelDelegate>)cellModelDelegate {
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
            lastAddedMonthSection = [[RecordingsSection alloc] initWithRecordingCellModels:@[]
                                                                                      Year:recording.dateComponents.year
                                                                                     month:recording.dateComponents.month
                                                                                   daysAgo:recordingDaysAgo
                                                                                isThisYear:recordingIsThisYear
                                                                               isThisMonth:recordingIsThisMonth];
            
            [assemblingSections addObject:lastAddedMonthSection];
        }
        
        RecordingCellModel *cellModel = [[RecordingCellModel alloc] initWithRecording:recording delegate:cellModelDelegate];
        [lastAddedMonthSection.cellModels addObject:cellModel];
    }
    
    return [assemblingSections copy];
}

+ (NSArray *)arrayOfRecordingsForWatch {
    NSMutableArray *recordingsListForWatch = [NSMutableArray array];
    DataSourceController *dataSourceController = [DataSourceController sharedDataSource];
    NSInteger numberOfRecordingsToSend = dataSourceController.numberOfRecordings <= kWatchExtNumberOfRecordingsShown
    ? dataSourceController.numberOfRecordings
    : kWatchExtNumberOfRecordingsShown;
    
    for (NSInteger i = 0; i < numberOfRecordingsToSend; i++) {
        Recording *recording = dataSourceController.recordings[i];
        NSString *uuidString = recording.uuid.UUIDString;
        NSString *recordingTitle;
        
        if (recording.title.length > 0) {
            recordingTitle = recording.title;
        } else {
            recordingTitle = recording.dateAsString;
        }
        
        [recordingsListForWatch addObject:@{kWatchExtKeyRecordingsListKeyName: recordingTitle,
                                            kWatchExtKeyRecordingsListKeyUUID: uuidString,
                                            kWatchExtKeyRecordingsListIsPlaying: @(NO)}];
    }
    
    return [recordingsListForWatch copy];
}

@end
