//
//  IOSWindowHackImageView.m
//  micd
//
//  Created by Brian Radebaugh on 4/29/15.
//  Copyright (c) 2015 CleverKnot. All rights reserved.
//

#import "IOSWindowHackImageView.h"

@interface IOSWindowHackImageView ()

@property (assign, nonatomic) CGRect realFrame;

@end

@implementation IOSWindowHackImageView

- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];
    if (!CGRectEqualToRect(frame, self.realFrame)) {
        self.realFrame = frame;
    }
}

- (void)didMoveToWindow {
    [super didMoveToWindow];
    if (self.window) {
        dispatch_async(dispatch_get_main_queue(), ^{
            self.frame = self.realFrame;
            [self.delegate destroyAndRecreatMe:self];
        });
    }
}

@end
