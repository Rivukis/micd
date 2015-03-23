//
//  renameRecordingViewController.h
//  micd
//
//  Created by Timothy Hise on 3/22/15.
//  Copyright (c) 2015 CleverKnot. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol RenameRecordingsViewDelegate <NSObject>

- (void)didFinishRenaming;

@end

@interface RenameRecordingViewController : UIViewController

@property (weak, nonatomic) id<RenameRecordingsViewDelegate> renameRecordingsViewDelegate;

@end
