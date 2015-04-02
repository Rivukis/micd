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

@protocol GoToNoRecordingStateDelegate <NSObject>

- (void)goToNoRecordingState;

@end

@interface RecordingsViewController : UIViewController <FramesBasedOnStateProtocol>

@property (weak, nonatomic) id<GoToNoRecordingStateDelegate> noRecordingStateDelegate;

- (void)reloadDataWithNewRecording:(Recording *)recording;
- (void)playPlaybackShouldAnimatePlayButton:(BOOL)shouldAnimatePlayButton;
- (void)pausePlaybackShouldAnimatePauseButton:(BOOL)shouldAnimatePauseButton;
- (void)offsetPlaybackByTimeInterval:(NSTimeInterval)timeInterval;
- (void)showPlayerButtons;

- (void)scrollToAndReadyPlayerWithMostRecentRecording;

@end
