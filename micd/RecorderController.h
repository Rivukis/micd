#import <Foundation/Foundation.h>

@class Recording;

typedef NS_ENUM(NSInteger, RecorderControllerState) {
    RecorderControllerStateStopped = 1,
    RecorderControllerStateRecording,
    RecorderControllerStatePaused,
    RecorderControllerStatePausing,
    RecorderControllerStateStopping // only used when enhancedRecorder flag is set to NO
};

@interface RecorderController : NSObject

+ (RecorderController *)sharedRecorder;
- (instancetype)init NS_UNAVAILABLE;

@property (nonatomic, assign, readonly) RecorderControllerState recordingState;
@property (nonatomic, readonly) NSString *currentRecordingTimeAsString;

- (void)startRecording;
    // does nothing if already recording
- (void)pauseRecording;
    // does nothing if already paused
- (void)retrieveRecordingThenDelete:(BOOL)shouldDelete completion:(void(^)(Recording *recording, NSError *error))completion;
    // will stop if necessary
- (void)deleteRecording;
    // will stop if necessary

- (float)averagePowerForChannelZero;

@end
