//
//  RecordingCell.m
//  micd
//
//  Created by Timothy Hise on 2/15/15.
//  Copyright (c) 2015 CleverKnot. All rights reserved.
//

#import "RecordingCell.h"
#import "WireTapStyleKit.h"
#import "UIColor+Palette.h"
#import "Recording.h"

@interface RecordingCell ()

@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *length;
@property (weak, nonatomic) IBOutlet UIButton *editButton;

@end

@implementation RecordingCell

-(void)layoutSubviews {
    [super layoutSubviews];
    
    self.backgroundColor = [UIColor blackColor];
    self.editButton.backgroundColor = [UIColor blackColor];
    self.title.textColor = [UIColor vibrantBlueText];
    self.length.textColor = [UIColor vibrantBlueText];
    self.layer.masksToBounds = YES;
    self.separatorInset = UIEdgeInsetsZero;
}

- (void)setValuesForRecording:(Recording *)recording {
    
    self.title.text = recording.title;

//    NSString *length;
//    if (recording.length.hours) {
//        length = [NSString stringWithFormat:@"%ld:%ld:%ld", (long)recording.length.hours, (long)recording.length.minutes, (long)recording.length.seconds];
//    } else if (recording.length.minutes) {
//        length = [NSString stringWithFormat:@"%ld:%ld", (long)recording.length.minutes, (long)recording.length.seconds];
//    } else {
//        length = [NSString stringWithFormat:@"%ld", (long)recording.length.seconds];
//    }
//    self.length.text = length;
    
    self.length.text = [recording lengthToDiplay];
    
    switch (self.state) {
        case CellStateCollapsed:
            [self.editButton setBackgroundImage:[WireTapStyleKit imageOfEditCircle] forState:UIControlStateNormal];
            break;
        case CellStateEditing:
            [self.editButton setBackgroundImage:[WireTapStyleKit imageOfEditCircle] forState:UIControlStateNormal];
            break;
        case CellStatePlaying:
            [self.editButton setBackgroundImage:[WireTapStyleKit imageOfEditCircle] forState:UIControlStateNormal];
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
