//
//  HomeViewController.h
//  micd
//
//  Created by Timothy Hise on 2/7/15.
//  Copyright (c) 2015 CleverKnot. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SetFramesProtocol.h"

@class Recording;

@protocol MovementDelegate <NSObject>

- (void)shouldMoveWithTranslation:(CGPoint)translation;
- (void)shouldMoveToPositionState:(HomeViewContollerPositionState)state;

@end

@protocol AddNewRecordingDelegate <NSObject>

- (void)addNewRecording:(Recording *)recording;

@end

@interface HomeViewController : UIViewController <SetFramesProtocol>

@property (weak, nonatomic) id<MovementDelegate> movementDelegate;
@property (weak, nonatomic) id<AddNewRecordingDelegate> addNewRecordingDelegate;

@end
