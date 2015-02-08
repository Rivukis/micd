#import "HomeScreenView.h"
#import "WireTapStyleKit.h"
#import "UIColor+Palette.h"

@implementation HomeScreenView

-(void)drawRect:(CGRect)rect {
    [WireTapStyleKit drawHomeViewWithColor:[UIColor vibrantBlue]];
}

@end
