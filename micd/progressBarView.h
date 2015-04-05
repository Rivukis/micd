#import <UIKit/UIKit.h>

@interface ProgressBarView : UIView

@property (nonatomic) CGFloat percent;

- (instancetype)initWithFrame:(CGRect)frame percentComplete:(CGFloat)percent;

@end
