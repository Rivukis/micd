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
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *labelsViewToTopSuperViewConstraint;

@property (weak, nonatomic) IBOutlet UILabel *recordingDateLabel;
@property (weak, nonatomic) IBOutlet UILabel *recordingTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *recordingLengthLabel;

@end

@implementation RecordingCell

-(void)layoutSubviews {
    self.backgroundColor = [UIColor blackColor];
    self.layer.masksToBounds = YES;
    
    self.leftBackgroundImageView.contentMode = UIViewContentModeScaleAspectFit;
    self.leftBackgroundImageView.image = [WireTapStyleKit imageOfLeftRecordingCellBackground];
    
    self.rightBackgroundImageView.contentMode = UIViewContentModeScaleAspectFit;
    self.rightBackgroundImageView.image = [WireTapStyleKit imageOfRightRecordingCellBackground];
    
    self.leftSlidingBackgroundImageView.image = [WireTapStyleKit imageOfLeftRecordingCellDropdown];
    self.rightSlidingBackgroundImageView.image = [WireTapStyleKit imageOfRightRecordingCellDropdown];
    
    self.recordingDateLabel.text = @"Oct 24 2015";
    self.recordingTimeLabel.text = @"12:45PM";
    self.recordingLengthLabel.text = @"4m 35s";
}

- (void)setPreAnimationConstraintsBasedOnExpansion:(BOOL)expanded {
    [self setLabelsViewToBottomSuperViewConstraintBasedOnExpansion:expanded];
}

- (void)setPostAnimationConstraintsBasedOnExpansion:(BOOL)expanded {
    [self setSlidingBackgroundViewFrameExpanded:expanded];
}

- (void)setLabelsViewToBottomSuperViewConstraintBasedOnExpansion:(BOOL)expanded {
    self.labelsViewToTopSuperViewConstraint.constant = 57.0f;
}

- (void)setSlidingBackgroundViewFrameExpanded:(BOOL)expanded {
    self.leftSlidingBackgroundImageViewYConstraint.constant = [self slidingBackgroundViewFrameBasedOnExpansion:expanded];
}

- (float)slidingBackgroundViewFrameBasedOnExpansion:(BOOL)expanded {
    if (expanded) {
        return 0.0f;
    } else {
        return -120.0f;
    }
}

@end
