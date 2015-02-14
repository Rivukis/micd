//
//  RecordingsViewController.h
//  micd
//
//  Created by Timothy Hise on 2/7/15.
//  Copyright (c) 2015 CleverKnot. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SetFramesProtocol.h"

@interface RecordingsViewController : UIViewController <SetFramesProtocol>

- (void)reloadData;

@end
