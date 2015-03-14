#import <Foundation/Foundation.h>

@class Recording;
@class PlayerController;


typedef NS_ENUM(NSUInteger, PlayerControllerState) {
    PlayerControllerStatePaused = 0,
    PlayerControllerStatePlaying
};


@protocol PlayerControllerDelegate <NSObject>

- (void)playerController:(PlayerController *)playerController didFinishPlayingSuccessfully:(BOOL)successful;

@end


@interface PlayerController : NSObject

@property (weak, nonatomic) id<PlayerControllerDelegate> delegate;
@property (assign, nonatomic) PlayerControllerState playerState;

@property (assign, nonatomic, readonly) NSTimeInterval loadedRecordingDuration;
@property (nonatomic, assign, readonly) NSTimeInterval secondsCompleted;
@property (nonatomic, assign, readonly) NSString *displayableCurrentTime;

@property (nonatomic, readonly) NSTimeInterval loadedRecordingDuration;
@property (strong, nonatomic, readonly) NSUUID *loadedRecordingUUID;

+ (PlayerController *)sharedPlayer;

- (void)loadRecording:(Recording *)recording;
- (void)playAudio;
- (void)pauseAudio;
- (void)setPlaybackTimeInterval:(NSTimeInterval)timeInterval;

@end

