#import "ProgressBarView.h"
#import "MicdStyleKit.h"

@interface ProgressBarView ()

@end

@implementation ProgressBarView

- (instancetype)initWithFrame:(CGRect)frame percentComplete:(CGFloat)percent
{
    self = [super init];
    if (self) {
        self.frame = frame;
        _percent = percent;
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
//    [MicdStyleKit drawProgressBarWithFrame:self.frame progressWidth:self.frame.size.width*self.percent];
}


@end
