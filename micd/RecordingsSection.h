#import <Foundation/Foundation.h>

@class RecordingCellModel;
@class Recording;
@protocol RecordingCellModelDelegate;

@interface RecordingsSection : NSObject

@property (nonatomic, readonly) NSInteger numberOfCellModels;

- (instancetype)initWithRecordingCellModels:(NSArray *)cellModels Year:(NSInteger)year month:(NSInteger)month daysAgo:(NSInteger)daysAgo isThisYear:(BOOL)isThisYear isThisMonth:(BOOL)isThisMonth;

- (void)addToTodaySectionNewRecording:(Recording *)recording withCellModelDelegate:(id<RecordingCellModelDelegate>)delegate;
- (void)deleteRecordingCellModelAtIndex:(NSInteger)index;

- (RecordingCellModel *)cellModelAtIndex:(NSInteger)index;
- (BOOL)isToday;
- (NSString *)dateAsString;

@end
