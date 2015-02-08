#import "peakaView.h"
#import "UIColor+Palette.h"
#import "WireTapStyleKit.h"

@implementation peakaView

- (void)drawRect:(CGRect)rect {
    [WireTapStyleKit drawMicdBackgroundWithColor:[UIColor vibrantBlue]];
}

@end
