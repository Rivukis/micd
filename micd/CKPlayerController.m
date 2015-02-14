//
//  CKPlayerController.m
//  Recorder
//
//  Created by Brian Radebaugh on 12/31/14.
//  Copyright (c) 2014 CleverKnot. All rights reserved.
//

#import "CKPlayerController.h"
#import <AVFoundation/AVFoundation.h>
#import "CKRecording.h"

@interface CKPlayerController () <AVAudioPlayerDelegate>

@property (nonatomic, strong) AVAudioSession *audioSession;
@property (nonatomic, strong) AVAudioPlayer *audioPlayer;

@end

@implementation CKPlayerController

- (instancetype)init {
    AVAudioSession *session = [AVAudioSession sharedInstance];
    [session setCategory:AVAudioSessionCategoryPlayAndRecord error:nil];
    [session setActive:YES withOptions:AVAudioSessionSetActiveOptionNotifyOthersOnDeactivation error:nil];
    return [self initWithAudioSession:session];
}

- (instancetype)initWithAudioSession:(AVAudioSession *)session {
    self = [super init];
    if (self) {
        _audioSession = session;
    }
    return self;
}

#pragma mark - API Methods

- (BOOL)loadRecording:(CKRecording *)recording error:(NSError *__autoreleasing *)error {
    NSError *playerError = nil;
    self.audioPlayer = [[AVAudioPlayer alloc] initWithData:recording.data error:&playerError];
    
    BOOL successful = (self.audioPlayer != nil);
    if (!successful) *error = playerError;
    return successful;
}

- (BOOL)setPlaybackTimeInterval:(NSTimeInterval)timeInterval error:(NSError *__autoreleasing *)error {
    NSError *timeIntervalError = nil;
    
    if (timeInterval == NSNotFound) {
        timeIntervalError = [NSError errorWithDomain:@"com.CleverKnot.www" code:0 userInfo:@{NSLocalizedDescriptionKey : @"timeInterval Parameter equals NSNotFound"}];
    }
    
    if (!timeIntervalError && (timeInterval < 0 || timeInterval >= self.audioPlayer.duration)) {
        NSString *localizedDesc = [NSString stringWithFormat:@"timeInterval (%f) is not valid for audio duration (%f)", timeInterval, self.audioPlayer.duration];
        timeIntervalError = [NSError errorWithDomain:@"com.CleverKnot.www" code:1 userInfo:@{NSLocalizedDescriptionKey : localizedDesc}];
    }
    
    BOOL successful = timeIntervalError == nil;
    if (successful) self.audioPlayer.currentTime = timeInterval;
        else *error = timeIntervalError;
    return successful;
}

- (BOOL)playAudioWithError:(NSError *__autoreleasing *)error {
    NSError *playAudioError = nil;
    
    if (!self.audioPlayer) {
        playAudioError = [NSError errorWithDomain:@"com.CleverKnot.www" code:1 userInfo:@{NSLocalizedDescriptionKey : @"Audio Player is nil"}];
    }
    
    if (!playAudioError && self.audioPlayer.isPlaying) {
        playAudioError = [NSError errorWithDomain:@"com.CleverKnot.www" code:0 userInfo:@{NSLocalizedDescriptionKey : @"Audio Player is already playing"}];
    }
    
    BOOL successful = playAudioError == nil;
    if (successful) [self.audioPlayer play];
        else *error = playAudioError;
    return successful;
}

- (BOOL)pauseAudioWithError:(NSError *__autoreleasing *)error {
    NSError *pauseAudioError = nil;
    
    if (!self.audioPlayer) {
        pauseAudioError = [NSError errorWithDomain:@"com.CleverKnot.www" code:1 userInfo:@{NSLocalizedDescriptionKey : @"Audio Player is nil"}];
    }
    
    if (!pauseAudioError && !self.audioPlayer.isPlaying) {
        pauseAudioError = [NSError errorWithDomain:@"com.CleverKnot.www" code:0 userInfo:@{NSLocalizedDescriptionKey : @"Audio Player is already paused or stopped"}];
    }
    
    BOOL successful = pauseAudioError == nil;
    if (successful) [self.audioPlayer pause];
        else *error = pauseAudioError;
    return successful;
}

- (BOOL)stopAudioWithError:(NSError *__autoreleasing *)error {
    NSError *stopAudioError = nil;
    
    // TODO: finish method
    if (!self.audioPlayer) {
        stopAudioError = [NSError errorWithDomain:@"com.CleverKnot.www" code:0 userInfo:@{NSLocalizedDescriptionKey : @"Audio Player is nil"}];
    }

    BOOL successful = (stopAudioError == nil);
    if (successful) {
        if (self.audioPlayer.isPlaying) {
            [self.audioPlayer stop];
        } else {
            self.audioPlayer.currentTime = 0;
        }
    } else *error = stopAudioError;
    return successful;
}

- (double)percentageCompleted {
    if (self.audioPlayer.duration <= 0) {
        return 0.0f;
    }
    
    return self.audioPlayer.currentTime / self.audioPlayer.duration;
}

- (NSTimeInterval)secondsCompleted {
    return self.audioPlayer.currentTime;
}

- (NSTimeInterval)duration {
    return self.audioPlayer.duration;
}

#pragma mark - AVAudioPlayer Delegate

- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag {
    player.currentTime = 0;
    NSLog(@"finished preview");
}

- (void)audioPlayerDecodeErrorDidOccur:(AVAudioPlayer *)player error:(NSError *)error {
    // TODO: handle error
    NSLog(@"error playing audio file: %@", error.localizedDescription);
}

#pragma mark - Custom Setters

- (void)setAudioPlayer:(AVAudioPlayer *)player {
    _audioPlayer = player;
    _audioPlayer.delegate = self;
    [_audioPlayer prepareToPlay];
}

@end
