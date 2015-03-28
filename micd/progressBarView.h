//
//  progressBarView.h
//  micd
//
//  Created by Tim on 3/28/15.
//  Copyright (c) 2015 CleverKnot. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProgressBarView : UIView

@property (nonatomic) CGFloat percent;

- (instancetype)initWithFrame:(CGRect)frame percentComplete:(CGFloat)percent;

@end
