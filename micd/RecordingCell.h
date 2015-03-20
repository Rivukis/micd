#import <UIKit/UIKit.h>

@class RecordingCellModel;

@interface RecordingCell : UITableViewCell

@property (nonatomic, strong, readonly) RecordingCellModel *cellModel;

- (void)bindToModel:(RecordingCellModel *)cellModel;

@end
