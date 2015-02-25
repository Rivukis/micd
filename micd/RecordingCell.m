//
//  RecordingCell.m
//  micd
//
//  Created by Timothy Hise on 2/15/15.
//  Copyright (c) 2015 CleverKnot. All rights reserved.
//

#import "RecordingCell.h"
#import "WireTapStyleKit.h"
#import "Recording.h"

@interface RecordingCell ()

@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *recordingLengthLabel;
@property (weak, nonatomic) IBOutlet UIButton *editButton;

@property (weak, nonatomic) IBOutlet UILabel *recordingDateLabel;
@property (weak, nonatomic) IBOutlet UILabel *recordingTimeLabel;

@end

@implementation RecordingCell

-(void)layoutSubviews {
    [super layoutSubviews];
    
    self.backgroundColor = [UIColor blackColor];
    self.editButton.backgroundColor = [UIColor blackColor];
    self.layer.masksToBounds = YES;
}

- (void)setValuesForRecording:(Recording *)recording {
    self.recordingDateLabel.text = @"Oct 24 2015";
    self.recordingTimeLabel.text = @"12:45PM";
    self.recordingLengthLabel.text = @"4m 35s";
    
    switch (self.state) {
        case CellStateCollapsed:
            [self.editButton setBackgroundImage:[WireTapStyleKit imageOfEditCircle] forState:UIControlStateNormal];
            self.recordingDateLabel.hidden = YES;
            self.recordingTimeLabel.hidden = YES;
            break;
        case CellStateEditing:
            [self.editButton setBackgroundImage:[WireTapStyleKit imageOfEditCircle] forState:UIControlStateNormal];
            self.recordingDateLabel.hidden = NO;
            self.recordingTimeLabel.hidden = NO;
            break;
        case CellStatePlaying:
            [self.editButton setBackgroundImage:[WireTapStyleKit imageOfEditCircle] forState:UIControlStateNormal];
            self.recordingDateLabel.hidden = YES;
            self.recordingTimeLabel.hidden = YES;
            break;
    }
}

- (IBAction)editButtonPressed:(UIButton *)sender {
    if (self.state == CellStateEditing) {
        self.state = CellStateCollapsed;
    } else {
        self.state = CellStateEditing;
    }
}

@end
