#import <Foundation/Foundation.h>

@class RecordingCellModel;
@protocol RecordingCellModelDelegate;

@interface RecordingsSection : NSObject

@property (nonatomic, readonly) NSInteger numberOfCellModels;

+ (NSArray *)arrayOfSectionsForRecordings:(NSArray *)recordings ascending:(BOOL)ascending;

- (RecordingCellModel *)cellModelAtIndex:(NSInteger)index;
- (NSString *)dateAsString;

@end
