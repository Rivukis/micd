//
//  RecordingCell.h
//  micd
//
//  Created by Timothy Hise on 2/15/15.
//  Copyright (c) 2015 CleverKnot. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RecordingCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *date;

- (void)setPreAnimationConstraintsBasedOnExpansion:(BOOL)expanded;
- (void)setPostAnimationConstraintsBasedOnExpansion:(BOOL)expanded;

@end
