//
//  RecordingCell.m
//  micd
//
//  Created by Timothy Hise on 2/15/15.
//  Copyright (c) 2015 CleverKnot. All rights reserved.
//

#import "RecordingCell.h"
#import "WireTapStyleKit.h"

@implementation RecordingCell

-(void)layoutSubviews {
    self.backgroundColor = [UIColor clearColor];
    self.backgroundImageView.contentMode = UIViewContentModeScaleAspectFit;
    self.backgroundImageView.image = [WireTapStyleKit imageOfSingleRecordingCell];
}

@end
