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

- (void)reloadDataWithNewRecording:(Recording *)recording;
- (void)playPlaybackShouldAnimatePlayButton:(BOOL)shouldAnimatePlayButton;
- (void)pausePlaybackShouldAnimatePauseButton:(BOOL)shouldAnimatePauseButton;
- (void)offsetPlaybackByTimeInterval:(NSTimeInterval)timeInterval;
- (void)showPlayerButtons;
- (void)hidePlayerButtons;

- (void)scrollToAndReadyPlayerWithMostRecentRecording;

@end
