#import <Foundation/Foundation.h>

@class RecordingCellModel;
@class Recording;
@protocol RecordingCellModelDelegate;

@interface RecordingsSection : NSObject

@property (nonatomic, readonly) NSInteger numberOfCellModels;

+ (NSArray *)arrayOfSectionsForRecordings:(NSArray *)recordings ascending:(BOOL)ascending cellModelDelegate:(id<RecordingCellModelDelegate>)cellModelDelegate;

+ (instancetype)sectionWithRecording:(Recording *)recording cellModelDelegate:(id<RecordingCellModelDelegate>)cellModelDelegate;
- (void)addToTodaySectionNewRecording:(Recording *)recording withCellModelDelegate:(id<RecordingCellModelDelegate>)delegate;
- (void)deleteRecordingCellModelAtIndex:(NSInteger)index;

- (RecordingCellModel *)cellModelAtIndex:(NSInteger)index;
- (BOOL)isToday;
- (NSString *)dateAsString;


@end
