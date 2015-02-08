//
//  HomeViewController.h
//  micd
//
//  Created by Timothy Hise on 2/7/15.
//  Copyright (c) 2015 CleverKnot. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SetFramesProtocol.h"

@protocol MovementDelegate <NSObject>

- (void)shouldMoveWithTranslation:(CGPoint)translation;
- (void)shouldMoveToPositionState:(HomeViewContollerPositionState)state;

@end

@interface HomeViewController : UIViewController <SetFramesProtocol>

@property (weak, nonatomic) id<MovementDelegate> movementDelegate;

@end
