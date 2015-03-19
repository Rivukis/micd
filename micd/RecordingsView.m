//
//  RecordingsView.m
//  micd
//
//  Created by Timothy Hise on 3/15/15.
//  Copyright (c) 2015 CleverKnot. All rights reserved.
//

#import "RecordingsView.h"

@implementation RecordingsView

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    
    if (![super pointInside:point withEvent:event]) {
        return NO;
    }
    
    CGPoint convertedPointForPlaybackContainerView = [self.playbackContainerView convertPoint:point fromView:self];
    BOOL isInsidePlaybackContainerView = [self.playbackContainerView pointInside:convertedPointForPlaybackContainerView withEvent:event];
    
    CGPoint convertedPointForProgessTimeIndicatorView = [self.progressTimeIndicatorView convertPoint:point fromView:self];
    BOOL isInsideProgressTimeIndicatorView = [self.progressTimeIndicatorView pointInside:convertedPointForProgessTimeIndicatorView withEvent:event];
        
    if (isInsidePlaybackContainerView && !isInsideProgressTimeIndicatorView) {
        return NO;
    }
    
    return YES;
}

@end
