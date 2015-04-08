//
//  ActivityItemProvider.h
//  micd
//
//  Created by Timothy Hise on 4/7/15.
//  Copyright (c) 2015 CleverKnot. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Recording;

@interface ActivityItemProvider : UIActivityItemProvider

- (instancetype)initWithPlaceholderString:(NSString *)placeholderString andRecording:(Recording *)recording;
- (id)item;

@end
