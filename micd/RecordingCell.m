//
//  RecordingCell.m
//  micd
//
//  Created by Timothy Hise on 2/15/15.
//  Copyright (c) 2015 CleverKnot. All rights reserved.
//

#import "RecordingCell.h"
#import "WireTapStyleKit.h"

@interface RecordingCell ()

@property (weak, nonatomic) IBOutlet UIImageView *leftBackgroundImageView;
@property (weak, nonatomic) IBOutlet UIImageView *rightBackgroundImageView;

@property (weak, nonatomic) IBOutlet UIImageView *leftSlidingBackgroundImageView;
@property (weak, nonatomic) IBOutlet UIImageView *rightSlidingBackgroundImageView;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leftSlidingBackgroundImageViewYConstraint;

@end

@implementation RecordingCell

-(void)layoutSubviews {
    self.backgroundColor = [UIColor blackColor];
    self.leftBackgroundImageView.contentMode = UIViewContentModeScaleAspectFit;
    self.leftBackgroundImageView.image = [WireTapStyleKit imageOfLeftRecordingCellBackground];
    
    self.rightBackgroundImageView.contentMode = UIViewContentModeScaleAspectFit;
    self.rightBackgroundImageView.image = [WireTapStyleKit imageOfRightRecordingCellBackground];
    
    self.leftSlidingBackgroundImageView.image = [WireTapStyleKit imageOfLeftRecordingCellDropdown];
    self.rightSlidingBackgroundImageView.image = [WireTapStyleKit imageOfRightRecordingCellDropdown];
    self.layer.masksToBounds = YES;
}

- (void)setSlidingBackgroundViewFrameExpanded:(BOOL)expanded {
    if (expanded) {
        self.leftSlidingBackgroundImageViewYConstraint.constant = 0.0f;
    } else {
        self.leftSlidingBackgroundImageViewYConstraint.constant = -120.0f;
    }
}

@end
