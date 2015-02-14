//
//  CKPlayerController.h
//  Recorder
//
//  Created by Brian Radebaugh on 12/31/14.
//  Copyright (c) 2014 CleverKnot. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AVAudioSession;
@class Recording;

@interface PlayerController : NSObject

- (instancetype)initWithAudioSession:(AVAudioSession *)session;
    // default init calls this init method with shared audio session

@property (nonatomic, assign, readonly) double percentageCompleted;
@property (nonatomic, assign, readonly) NSTimeInterval secondsCompleted;
@property (nonatomic, assign, readonly) NSTimeInterval duration;

- (BOOL)loadRecording:(Recording *)recording error:(NSError * __autoreleasing *)error;
- (BOOL)setPlaybackTimeInterval:(NSTimeInterval)timeInterval error:(NSError * __autoreleasing *)error;
- (BOOL)playAudioWithError:(NSError * __autoreleasing *)error;
- (BOOL)pauseAudioWithError:(NSError * __autoreleasing *)error;
- (BOOL)stopAudioWithError:(NSError * __autoreleasing *)error;

@end
