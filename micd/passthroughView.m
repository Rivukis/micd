//
//  passthroughView.m
//  micd
//
//  Created by Timothy Hise on 3/4/15.
//  Copyright (c) 2015 CleverKnot. All rights reserved.
//

#import "PassthroughView.h"
#import "UIImage+ColorAtPixel.h"

@implementation PassthroughView

-(BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    for (UIView *view in self.subviews) {
        if (!view.hidden && view.alpha > 0 && view.userInteractionEnabled && [view pointInside:[self convertPoint:point toView:view] withEvent:event]) {
            return YES;
        }
    }
    return NO;
}

//
//-(BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
//    for (UIView *subView in self.subviews) {
//        CGPoint convertedPoint = [subView convertPoint:point fromView:self];
//        BOOL isPointVisible = [self isVisibleAtPoint:convertedPoint];
//        if (!self.hidden && isPointVisible && self.userInteractionEnabled) {
//            return YES;
//        }
//    }
//    return NO;
//}
//
//- (BOOL)isVisibleAtPoint:(CGPoint)point
//{
//    // Correct point to take into account that the image does not have to be the same size
//    // as the button. See https://github.com/ole/OBShapedButton/issues/1
//    CGSize iSize = self.frame.size;
//    CGSize bSize = self.bounds.size;
//    point.x *= (bSize.width != 0) ? (iSize.width / bSize.width) : 1;
//    point.y *= (bSize.height != 0) ? (iSize.height / bSize.height) : 1;
//    
//    CGFloat alpha = self.alpha;
//    
//    return alpha > 0;
//}

@end
