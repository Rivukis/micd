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
        NSLog(@"not even");
        return NO;
    }
    
    CGPoint convertedPointForPlaybackContainerView = [self.playbackContainerView convertPoint:point fromView:self];
    BOOL isInsidePlaybackContainerView = [self.playbackContainerView pointInside:convertedPointForPlaybackContainerView withEvent:event];
    
    if (!isInsidePlaybackContainerView) {
        return YES;
    }
    
    for (UIView *playerControl in self.playerControlElements) {
        CGPoint convertedPointForPlayerControl = [playerControl convertPoint:point fromView:self];
        BOOL isInsidePlayerControl = [playerControl pointInside:convertedPointForPlayerControl withEvent:event];
        
        if (isInsidePlaybackContainerView && isInsidePlayerControl) {
            NSLog(@"hit button");
            return YES;
        }
    }
    NSLog(@"allow pan");
    return NO;
}

@end
