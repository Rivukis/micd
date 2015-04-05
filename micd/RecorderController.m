//
//  NEWCKRecorderController.m
//  Recorder
//
//  Created by Brian Radebaugh on 1/7/15.
//  Copyright (c) 2015 CleverKnot. All rights reserved.
//

#import "RecorderController.h"
#import <AVFoundation/AVFoundation.h>
#import "Recording.h"
#import "Constants.h"

@interface RecorderController () <AVAudioRecorderDelegate>

@property (nonatomic, assign, readwrite) RecorderControllerState recordingState;

@property (nonatomic, strong) AVAudioSession *audioSession;
@property (nonatomic, strong) AVAudioRecorder *audioRecorder;
@property (nonatomic, strong) NSFileManager *fileManager;

@property (nonatomic, strong) NSDate *currentRecordingStartDate;
@property (nonatomic, assign) NSTimeInterval currentRecordingLength; // will not be up-to-date while recording

@property (strong, nonatomic) NSString *primaryFilePath;
@property (strong, nonatomic) NSString *savedFilePath;
@property (strong, nonatomic) NSString *concatenatedFilePath;

@property (nonatomic, copy) void(^blockToExecuteAfterConcatenation)(BOOL successful, NSError *error);
//@property (nonatomic, strong) NSMutableArray *blocksToExecuteAfterConcatenation; //of type => void(^)(id value, NSError *error)

@end

BOOL const useEnhancedRecorder = NO;

@implementation RecorderController

- (instancetype)init {
    return [RecorderController sharedRecorder];
}

+ (RecorderController *)sharedRecorder {
    static RecorderController *sharedRecorder = nil;
    @synchronized(self) {
        if (!sharedRecorder) {
            sharedRecorder = [[self alloc] init_common];
        }
    }
    return sharedRecorder;
}

- (instancetype)init_common {
    self = [super init];
    if (self) {
        NSString *documentsDirectory = [Constants documentsDirectory];
        _primaryFilePath = [NSString stringWithFormat:@"%@/%@", documentsDirectory, kRecorderPrimaryAudioFile];
        _savedFilePath = [NSString stringWithFormat:@"%@/%@", documentsDirectory, kRecorderSavedAudioFileName];
        _concatenatedFilePath = [NSString stringWithFormat:@"%@/%@", documentsDirectory, kRecorderConcatenatedAudioFileName];
        
        NSLog(@"%@", _primaryFilePath);
        
        _fileManager = [[NSFileManager alloc] init];
        [_fileManager removeItemAtURL:[NSURL fileURLWithPath:_primaryFilePath] error:nil];
        [_fileManager removeItemAtURL:[NSURL fileURLWithPath:_savedFilePath] error:nil];
        [_fileManager removeItemAtURL:[NSURL fileURLWithPath:_concatenatedFilePath] error:nil];
        
        _audioSession = [AVAudioSession sharedInstance];
        [_audioSession setActive:YES error:nil];
        
        _audioRecorder = [self customRecorder];
        _audioRecorder.delegate = self;
        _recordingState = RecorderControllerStateStopped;
        [_audioRecorder prepareToRecord];
    }
    return self;
}

//----------------- old stuff

//- (instancetype)init {
//    AVAudioSession *session = [AVAudioSession sharedInstance];
//    [session setCategory:AVAudioSessionCategoryPlayAndRecord error:nil];
//    [session setActive:YES withOptions:AVAudioSessionSetActiveOptionNotifyOthersOnDeactivation error:nil];
//    return [self initWithAudioSession:session];
//}
//
//- (instancetype)initWithAudioSession:(AVAudioSession *)session {
//    self = [super init];
//    if (self) {
//        _fileManager = [[NSFileManager alloc] init];
//        
//        NSString *documentsDirectory = [Constants documentsDirectory];
//        _primaryFilePath = [NSString stringWithFormat:@"%@/%@", documentsDirectory, kRecorderPrimaryAudioFile];
//        _savedFilePath = [NSString stringWithFormat:@"%@/%@", documentsDirectory, kRecorderSavedAudioFileName];
//        _concatenatedFilePath = [NSString stringWithFormat:@"%@/%@", documentsDirectory, kRecorderConcatenatedAudioFileName];
//        
//        NSLog(@"%@", _primaryFilePath);
//        
//        [_fileManager removeItemAtURL:[NSURL fileURLWithPath:_primaryFilePath] error:nil];
//        [_fileManager removeItemAtURL:[NSURL fileURLWithPath:_savedFilePath] error:nil];
//        [_fileManager removeItemAtURL:[NSURL fileURLWithPath:_concatenatedFilePath] error:nil];
//        
//        _recordingState = RecorderControllerStateStopped;
//        _audioSession = session;
//        [_audioSession setActive:YES error:nil];
//        _audioRecorder = [self customRecorder];
//        _audioRecorder.delegate = self;
//        [_audioRecorder prepareToRecord];
//        
//    }
//    return self;
//}

#pragma mark - Recording Methods

- (void)startRecording {
    // TODO: handle error when setting session to active
    if (self.recordingState == RecorderControllerStateStopped) {
        self.currentRecordingStartDate = [NSDate date];
    }
    
    if (self.recordingState == RecorderControllerStatePaused || self.recordingState == RecorderControllerStateStopped) {
        [self.audioSession setActive:YES error:nil];
        [self.audioRecorder record];
        self.recordingState = RecorderControllerStateRecording;
    }
}

- (void)pauseRecording {
    if (useEnhancedRecorder) {
        if (self.audioRecorder.isRecording) {
            self.recordingState = RecorderControllerStatePausing;
            [self.audioRecorder stop];
        }
    } else {
        if (self.recordingState == RecorderControllerStateRecording) {
            [self.audioRecorder pause];
            self.recordingState = RecorderControllerStatePaused;
        }
    }
    
}

- (void)retrieveRecordingThenDelete:(BOOL)shouldDelete completion:(void(^)(Recording *recording, NSError *error))completion {
    // TODO: refactor
    
//    if (self.audioRecorder.isRecording || self.recordingState == CKRecorderControllerStatePaused) {
//        self.recordingState = CKRecorderControllerStateStopping;
//        __weak __typeof(self) weakSelf = self;
//        self.blockToExecuteAfterConcatenation = ^void(BOOL successful, NSError *error) {
//            if (successful) {
//                completion([weakSelf generateRecording], error);
//            } else {
//                completion(nil, error);
//            }
//            
//            if (shouldDelete) {
//                [weakSelf deleteRecording];
//            }
//        };
//        [self.audioRecorder stop];
//    }
    
    
    
    
    
    
    if (self.audioRecorder.isRecording && self.recordingState != RecorderControllerStatePausing && self.recordingState != RecorderControllerStateStopping) {
        self.recordingState = RecorderControllerStatePausing;
        __weak __typeof(self) weakSelf = self;
        self.blockToExecuteAfterConcatenation = ^void(BOOL successful, NSError *error) {
            if (successful) {
                completion([weakSelf generateRecording], error);
            } else {
                completion(nil, error);
            }
            
            if (shouldDelete) {
                [weakSelf deleteRecording];
            }
        };
        [self.audioRecorder stop];
        
    } else if (self.recordingState == RecorderControllerStatePaused) {
        if (useEnhancedRecorder) {
            completion([self generateRecording], nil);
            if (shouldDelete) {
                [self deleteRecording];
            }
        } else {
            self.recordingState = RecorderControllerStateStopping;
            __weak __typeof(self) weakSelf = self;
            self.blockToExecuteAfterConcatenation = ^void(BOOL successful, NSError *error) {
                if (successful) {
                    completion([weakSelf generateRecording], error);
                } else {
                    completion(nil, error);
                }
                
                if (shouldDelete) {
                    [weakSelf deleteRecording];
                }
            };
            [self.audioRecorder stop];
        }
        
    } else {
        NSString *localizedDescription = @"Recorder will not respond to this method when in recording state: ";
        if (self.recordingState == RecorderControllerStatePausing) {
            localizedDescription = [localizedDescription stringByAppendingString:@"CKRecorderControllerStatePausing"];
        } else if (self.recordingState == RecorderControllerStateStopped) {
            localizedDescription = [localizedDescription stringByAppendingString:@"CKRecorderControllerStateStopped"];
        } else if (self.recordingState == RecorderControllerStateRecording) {
            localizedDescription = [localizedDescription stringByAppendingString:@"CKRecorderControllerStateRecording"];
        }
        
        NSError *error = [NSError errorWithDomain:@"com.cleverknot.www" code:0 userInfo:@{NSLocalizedDescriptionKey : localizedDescription}];
        completion(nil, error);
    }
}

- (void)deleteRecording {
    [self.fileManager removeItemAtURL:[NSURL fileURLWithPath:self.savedFilePath] error:nil];
    self.recordingState = RecorderControllerStateStopped;
}

- (Recording *)generateRecording {
    // TODO: setup feature flag
    NSData *data;
    if (useEnhancedRecorder) {
        data = [NSData dataWithContentsOfFile:self.savedFilePath];
    } else {
        data = [NSData dataWithContentsOfFile:self.primaryFilePath];
    }
    
    AVAudioPlayer *player = [[AVAudioPlayer alloc] initWithData:data error:nil];
    NSTimeInterval duration = player.duration;
    player = nil;
    Recording *recording = [[Recording alloc] initWithData:data date:self.currentRecordingStartDate length:duration];
    return recording;
}

- (float)averagePowerForChannelZero {
    [self.audioRecorder updateMeters];
    return [self.audioRecorder averagePowerForChannel:0];
}

#pragma mark - AVAudioRecorder Methods

- (AVAudioRecorder *)customRecorder {
    NSURL *outputFileURL = [NSURL URLWithString:self.primaryFilePath];
    NSMutableDictionary *recorderSettings = [NSMutableDictionary dictionary];
    [recorderSettings setValue:[NSNumber numberWithInt:kAudioFormatMPEG4AAC] forKey:AVFormatIDKey];
    [recorderSettings setValue:[NSNumber numberWithFloat:44100.0] forKey:AVSampleRateKey];
    [recorderSettings setValue:[NSNumber numberWithInt: 2] forKey:AVNumberOfChannelsKey];
    [recorderSettings setValue:[NSNumber numberWithInteger:AVAudioQualityMax] forKey:AVEncoderAudioQualityKey];
    NSError *recorderError;
    AVAudioRecorder *recorder = [[AVAudioRecorder alloc] initWithURL:outputFileURL settings:recorderSettings error:&recorderError];
    
    if (recorderError) {
        // TODO: handle error
        NSLog(@"failed to create AVAudioRecorder: %@", recorderError.localizedDescription);
        return nil;
    }
    
    recorder.meteringEnabled = YES;
    
    return recorder;
}

- (void)audioRecorderDidFinishRecording:(AVAudioRecorder *)recorder successfully:(BOOL)flag {
    if (useEnhancedRecorder) {
        [self concatenateSecondaryAndPrimaryAudioFiles];
    } else {
        self.recordingState = RecorderControllerStatePaused;
        self.blockToExecuteAfterConcatenation(flag, nil);
    }
    [self.audioRecorder prepareToRecord];
}

- (void)audioRecorderEncodeErrorDidOccur:(AVAudioRecorder *)recorder error:(NSError *)error {
    // TODO: handle error
    NSLog(@"AVAudioRecorder encoding failed: %@", error.localizedDescription);
}

#pragma mark - Audio File Manipulation

- (BOOL)concatenateSecondaryAndPrimaryAudioFiles {
    AVMutableComposition *composition = [[AVMutableComposition alloc] init];
    AVMutableCompositionTrack *compositionAudioTrack = [composition addMutableTrackWithMediaType:AVMediaTypeAudio
                                                                                preferredTrackID:kCMPersistentTrackID_Invalid];
    
    NSURL *primaryURL = [NSURL fileURLWithPath:self.primaryFilePath];
    AVAsset *primaryAsset = [AVURLAsset URLAssetWithURL:primaryURL options:@{}];
    
    NSURL *secondaryURL = [NSURL fileURLWithPath:self.savedFilePath];
    AVAsset *secondaryAsset = [AVURLAsset URLAssetWithURL:secondaryURL options:@{}];
    
    // maybe set secondaryTracks to @[] when nil
    
    CMTimeRange timeRangeInPrimaryAsset = CMTimeRangeMake(kCMTimeZero, [primaryAsset duration]);
    CMTimeRange timeRangeInSecondaryAsset = CMTimeRangeMake(kCMTimeZero, [secondaryAsset duration]);
    AVAssetTrack *primaryAssetTrack = [primaryAsset tracksWithMediaType:AVMediaTypeAudio].firstObject;
    AVAssetTrack *secondaryAssetTrack = [secondaryAsset tracksWithMediaType:AVMediaTypeAudio].firstObject;
    NSTimeInterval primaryAssetLength = CMTimeGetSeconds(primaryAsset.duration);
    NSTimeInterval secondaryAssetLength = CMTimeGetSeconds(secondaryAsset.duration);
    
//    if (![self.fileManager fileExistsAtPath:self.savedFilePath]) {
//        NSData *audioData = [NSData dataWithContentsOfFile:self.primaryFilePath];
//        [audioData writeToFile:self.savedFilePath atomically:YES];
//        [self.fileManager removeItemAtPath:self.concatenatedFilePath error:nil];
//        
//        self.currentRecordingLength = primaryAssetLength;
//        self.recordingState = CKRecorderControllerStatePaused;
//        if (self.blockToExecuteAfterConcatenation) {
//            self.blockToExecuteAfterConcatenation(YES, nil);
//        }
//        return YES;
//    }
    
    NSError *trackInsertionError = nil;
    [compositionAudioTrack insertTimeRange:timeRangeInPrimaryAsset
                                   ofTrack:primaryAssetTrack
                                    atTime:kCMTimeZero
                                     error:&trackInsertionError];
    if (trackInsertionError) {
        NSLog(@"primary track insertion error: %@", trackInsertionError.localizedDescription);
        return NO;
    }
    
    trackInsertionError = nil;
    [compositionAudioTrack insertTimeRange:timeRangeInSecondaryAsset
                                   ofTrack:secondaryAssetTrack
                                    atTime:kCMTimeZero
                                     error:&trackInsertionError];
    if (trackInsertionError) {
        // will have error the first time because the secondary file is empty so secondaryAssetTrack is nil
    }
    
    AVAssetExportSession *exportSession = [AVAssetExportSession exportSessionWithAsset:composition presetName:AVAssetExportPresetAppleM4A];
    if (!exportSession) return NO;
    
    exportSession.outputURL = [NSURL fileURLWithPath:self.concatenatedFilePath];
    exportSession.outputFileType = AVFileTypeAppleM4A;
    
    [exportSession exportAsynchronouslyWithCompletionHandler:^{
        
        if (AVAssetExportSessionStatusCompleted == exportSession.status) {
            NSData *combinedAudioData = [NSData dataWithContentsOfFile:self.concatenatedFilePath];
            [combinedAudioData writeToFile:self.savedFilePath atomically:YES];
            [self.fileManager removeItemAtPath:self.concatenatedFilePath error:nil];
            
            self.currentRecordingLength = primaryAssetLength + secondaryAssetLength;
            self.recordingState = RecorderControllerStatePaused;
            
            if (self.blockToExecuteAfterConcatenation) {
                self.blockToExecuteAfterConcatenation(YES, exportSession.error);
            }
            
        } else if (AVAssetExportSessionStatusFailed == exportSession.status) {
            // a failure may happen because of an event out of your control
            // for example, an interruption like a phone call comming in
            // make sure and handle this case appropriately
            
            // TODO: handle phone calls
            
            // TODO: this also seems to happen when clicking save before the files the stop then concatenate process has been completed (investigate needed)
            
            NSLog(@"AVAssetExportSessionStatusFailed: %@", exportSession.error);
            
            self.recordingState = RecorderControllerStatePaused;
            
            if (self.blockToExecuteAfterConcatenation) {
                self.blockToExecuteAfterConcatenation(NO, exportSession.error);
            }
            
        } else {
            
            // TODO: handle other problems
            NSLog(@"Export Session Status: %ld", (long)exportSession.status);
            
            self.recordingState = RecorderControllerStatePaused;
            
            if (self.blockToExecuteAfterConcatenation) {
                self.blockToExecuteAfterConcatenation(NO, exportSession.error);
            }
        }
        self.recordingState = RecorderControllerStatePaused;
    }];
    
    return YES;
}

@end
