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

@interface RecordingsViewController : UIViewController <FramesBasedOnStateProtocol>

@property (nonatomic, readonly) PlayerControllerState playerState;

- (void)reloadDataWithNewRecording:(Recording *)recording;
- (void)playPlayback;
- (void)pausePlayback;
- (void)offsetPlaybackByTimeInterval:(NSTimeInterval)timeInterval;
- (void)showPlayerButtons;
- (void)hidePlayerButtons;

- (void)scrollToAndReadyPlayerWithMostRecentRecording;

@end
