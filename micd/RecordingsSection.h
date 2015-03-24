#import <Foundation/Foundation.h>

@class RecordingCellModel;
@protocol RecordingCellModelDelegate;

@interface RecordingsSection : NSObject

@property (nonatomic, readonly) NSInteger numberOfCellModels;

+ (NSArray *)arrayOfSectionsForRecordings:(NSArray *)recordings ascending:(BOOL)ascending cellModelDelegate:(id<RecordingCellModelDelegate>)cellModelDelegate;
- (RecordingCellModel *)cellModelAtIndex:(NSInteger)index;
- (BOOL)isToday;
- (NSString *)dateAsString;

@end
