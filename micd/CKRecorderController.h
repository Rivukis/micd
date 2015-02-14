//
//  NEWCKRecorderController.h
//  Recorder
//
//  Created by Brian Radebaugh on 1/7/15.
//  Copyright (c) 2015 CleverKnot. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AVAudioSession;
@class CKRecording;

typedef NS_ENUM(NSInteger, CKRecorderControllerState) {
    CKRecorderControllerStateStopped = 1,
    CKRecorderControllerStateRecording,
    CKRecorderControllerStatePaused,
    CKRecorderControllerStatePausing,
    CKRecorderControllerStateStopping // only used when enhancedRecorder flag is set to NO
};

@interface CKRecorderController : NSObject

- (instancetype)initWithAudioSession:(AVAudioSession *)session;
    // default init calls this init method with shared audio session

@property (nonatomic, assign, readonly) CKRecorderControllerState recordingState;

- (void)startRecording;
    // does nothing if already recording
- (void)pauseRecording;
    // does nothing if already paused
- (void)retrieveRecordingThenDelete:(BOOL)shouldDelete completion:(void(^)(CKRecording *recording, NSError *error))completion;
    // will stop if necessary
- (void)deleteRecording;
    // will stop if necessary

@end
