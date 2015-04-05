#import "SettingsView.h"

@implementation SettingsView

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    
    if (![super pointInside:point withEvent:event]) {
        //not the view we are concerned with
        return NO;
    }
    
    for (UIView *element in self.interactiveElements) {
        CGPoint convertedPointForElement = [element convertPoint:point fromView:self];
        BOOL isInsideElement = [element pointInside:convertedPointForElement withEvent:event];
        
        if (isInsideElement && element.userInteractionEnabled) {
            //hit button
            return YES;
        }
    }
    //allow pan
    return NO;
}

@end
