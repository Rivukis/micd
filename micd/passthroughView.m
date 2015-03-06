//
//  passthroughView.m
//  micd
//
//  Created by Timothy Hise on 3/4/15.
//  Copyright (c) 2015 CleverKnot. All rights reserved.
//

#import "passthroughView.h"
#import "UIImage+ColorAtPixel.h"

@implementation passthroughView

-(BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    for (UIView *view in self.subviews) {
        if (!view.hidden && view.alpha > 0 && view.userInteractionEnabled && [view pointInside:[self convertPoint:point toView:view] withEvent:event]) {
            return YES;
        }
    }
    return NO;
}

@end
