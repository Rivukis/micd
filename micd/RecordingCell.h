#import <UIKit/UIKit.h>

@class RecordingCell;
@class RecordingCellModel;

@protocol RecordingCellDelegate <NSObject>

- (void)cellDidBecomeFirstResponer:(RecordingCell *)cell;

@end

@interface RecordingCell : UITableViewCell

@property (nonatomic, strong, readonly) RecordingCellModel *cellModel;
@property (nonatomic, weak) id<RecordingCellDelegate> delegate;

- (void)bindToModel:(RecordingCellModel *)cellModel;

@end
