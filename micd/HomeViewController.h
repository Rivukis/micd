//
//  HomeViewController.h
//  micd
//
//  Created by Timothy Hise on 2/7/15.
//  Copyright (c) 2015 CleverKnot. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FramesController.h"

@class Recording;
@class DisplayLinkController;


@protocol MovementDelegate <NSObject>

- (void)moveWithTranslation:(CGPoint)translation;
- (void)moveToPositionState:(PositionState)state;
- (void)cancelMoveAnimations;

@end


@protocol AddNewRecordingDelegate <NSObject>

- (void)addNewRecording:(Recording *)recording;

@end


@interface HomeViewController : UIViewController <FramesBasedOnStateProtocol>

@property (weak, nonatomic) id<MovementDelegate> movementDelegate;
@property (weak, nonatomic) id<AddNewRecordingDelegate> addNewRecordingDelegate;

- (void)popAnimationCompleted;
- (void)animateGearsSpinning;

@end