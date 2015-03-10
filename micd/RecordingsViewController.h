//
//  RecordingsViewController.h
//  micd
//
//  Created by Timothy Hise on 2/7/15.
//  Copyright (c) 2015 CleverKnot. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FramesController.h"

typedef NS_ENUM(NSUInteger, PlayerState) {
    PlayerStatePlaying,
    PlayerStatePaused
};

@protocol PlayerControlsDelegate <NSObject>

- (void)shouldUpdatePlayPauseButtonForState:(PlayerState)state;

@end

@interface RecordingsViewController : UIViewController <FramesBasedOnStateProtocol>

@property (weak, nonatomic) id<PlayerControlsDelegate> playerControlsDelegate;
@property (nonatomic) PlayerState playerState;

- (void)reloadData;

- (void)playPlayback;
- (void)pausePlayback;
- (void)offsetPlaybackByTimeInterval:(NSTimeInterval)timeInterval;

- (void)scrollToAndReadyPlayerWithMostRecentRecording;

@end
