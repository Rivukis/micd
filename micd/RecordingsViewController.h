//
//  RecordingsViewController.h
//  micd
//
//  Created by Timothy Hise on 2/7/15.
//  Copyright (c) 2015 CleverKnot. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FramesController.h"
#import "PlayerController.h"

@protocol PlayerControlsDelegate <NSObject>

- (void)shouldUpdatePLayPauseButtonForPlayState;
- (void)shouldUpdatePLayPauseButtonForPauseState;

@end

@interface RecordingsViewController : UIViewController <FramesBasedOnStateProtocol>

@property (weak, nonatomic) id<PlayerControlsDelegate> playerControlsDelegate;
@property (nonatomic, readonly) PlayerControllerState playerState;

- (void)reloadData;

- (void)playPlayback;
- (void)pausePlayback;
- (void)offsetPlaybackByTimeInterval:(NSTimeInterval)timeInterval;

- (void)scrollToMostRecentRecording;

@end
