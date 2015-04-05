#import <Foundation/Foundation.h>

@protocol RecordingCellModelDelegate;

@interface Factory : NSObject

+ (NSArray *)arrayOfSectionsForRecordings:(NSArray *)recordings ascending:(BOOL)ascending cellModelDelegate:(id<RecordingCellModelDelegate>)cellModelDelegate;
+ (NSArray *)arrayOfRecordingsForWatch;

@end
