#import <Foundation/Foundation.h>
#import <CoreGraphics/CGBase.h>

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

@property (strong, nonatomic, readonly) Recording *loadedRecording;
@property (nonatomic, assign, readonly) NSTimeInterval secondsCompleted;
@property (nonatomic, readonly) CGFloat percentageCompleted;
@property (nonatomic, assign, readonly) NSString *displayableCurrentTime;

+ (PlayerController *)sharedPlayer;
- (instancetype)init NS_UNAVAILABLE;

- (void)loadRecording:(Recording *)recording;
- (void)playAudio;
- (void)pauseAudio;
- (void)setPlaybackTimeInterval:(NSTimeInterval)timeInterval;

@end

