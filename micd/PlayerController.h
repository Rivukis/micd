//
//  CKPlayerController.h
//  Recorder
//
//  Created by Brian Radebaugh on 12/31/14.
//  Copyright (c) 2014 CleverKnot. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@class Recording;

@interface PlayerController : NSObject

@property (weak, nonatomic) id<AVAudioPlayerDelegate> audioPlayerDelegate;
@property (assign, nonatomic, readonly) NSTimeInterval loadedRecordingDuration;
@property (nonatomic, assign, readonly) NSTimeInterval secondsCompleted;
@property (nonatomic, assign, readonly) NSString *displayableCurrentTime;

+ (PlayerController *)sharedPlayer;

- (void)loadRecording:(Recording *)recording;
- (void)playAudio;
- (void)pauseAudio;
- (void)setPlaybackTimeInterval:(NSTimeInterval)timeInterval;

@end
