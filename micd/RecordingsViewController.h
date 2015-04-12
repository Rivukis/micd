#import <UIKit/UIKit.h>
#import "FramesController.h"
#import "PlayerController.h"

@protocol DeletedLastRemainingTrackDelegate <NSObject>

- (void)deletedLastRemainingTrack;

@end

@interface RecordingsViewController : UIViewController <FramesBasedOnStateProtocol>

@property (weak, nonatomic) id<DeletedLastRemainingTrackDelegate> deletedLastRemainingTrackDelegate;

- (void)reloadDataWithNewRecording:(Recording *)recording;
- (void)playPlaybackShouldAnimatePlayButton:(BOOL)shouldAnimatePlayButton;
- (void)pausePlaybackShouldAnimatePauseButton:(BOOL)shouldAnimatePauseButton;
- (void)offsetPlaybackByTimeInterval:(NSTimeInterval)timeInterval;
- (void)showPlayerButtons;

- (void)scrollToAndReadyPlayerWithMostRecentRecording;

@end
