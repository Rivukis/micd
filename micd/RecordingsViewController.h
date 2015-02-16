//
//  RecordingsViewController.h
//  micd
//
//  Created by Timothy Hise on 2/7/15.
//  Copyright (c) 2015 CleverKnot. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FramesController.h"

@interface RecordingsViewController : UIViewController <FramesBasedOnStateProtocol>

- (void)reloadData;

@end
