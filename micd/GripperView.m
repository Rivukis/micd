#import "GripperView.h"
#import "WireTapStyleKit.h"
#import "UIColor+Palette.h"

@implementation GripperView

- (void)drawRect:(CGRect)rect {
    [WireTapStyleKit drawGripCircleWithColor:[UIColor vibrantBlue]];
}

@end
