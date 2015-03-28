//
//  progressBarView.m
//  micd
//
//  Created by Tim on 3/28/15.
//  Copyright (c) 2015 CleverKnot. All rights reserved.
//

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
    [MicdStyleKit drawProgressBarWithFrame:self.frame progressWidth:self.frame.size.width*self.percent/100];
}


@end
