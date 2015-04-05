//
//  PopoverViewController.h
//  micd
//
//  Created by Tim on 4/4/15.
//  Copyright (c) 2015 CleverKnot. All rights reserved.
//

#import <UIKit/UIKit.h>
@class PopoverViewController;

@protocol PopoverDelegate <NSObject>

- (void)showMailComposer:(PopoverViewController *)popoverViewController;
- (void)finishedPoppingOver:(PopoverViewController *)popoverViewController;

@end

@interface PopoverViewController : UIViewController

@property (nonatomic) BOOL didSayYes;
@property (nonatomic, weak) id<PopoverDelegate> delegate;

@end
