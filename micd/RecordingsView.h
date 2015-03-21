//
//  RecordingsView.h
//  micd
//
//  Created by Timothy Hise on 3/15/15.
//  Copyright (c) 2015 CleverKnot. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RecordingsView : UIView

@property (strong, nonatomic) NSArray *playerControlElements;
@property (weak, nonatomic) UIView *playbackContainerView;

@end
