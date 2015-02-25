//
//  RecordingCell.h
//  micd
//
//  Created by Timothy Hise on 2/15/15.
//  Copyright (c) 2015 CleverKnot. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Recording;

typedef NS_ENUM(NSUInteger, CellState) {
    CellStateCollapsed,
    CellStateEditing,
    CellStatePlaying,
};

@interface RecordingCell : UITableViewCell

@property (assign, nonatomic) CellState state;

- (void)setValuesForRecording:(Recording *)recording;

@end
