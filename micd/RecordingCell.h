//
//  RecordingCell.h
//  micd
//
//  Created by Timothy Hise on 2/15/15.
//  Copyright (c) 2015 CleverKnot. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RecordingCellModel;

@interface RecordingCell : UITableViewCell

@property (nonatomic, strong, readonly) RecordingCellModel *cellModel;

- (void)bindToModel:(RecordingCellModel *)cellModel;
- (void)changeViewForCellBeingEdited;

@end
