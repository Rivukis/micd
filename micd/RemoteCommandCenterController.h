#import <Foundation/Foundation.h>
#import <MediaPlayer/MediaPlayer.h>

@protocol RemoteCommandCenterControllerDelegate <NSObject>

- (MPRemoteCommandHandlerStatus)playCommand;
- (MPRemoteCommandHandlerStatus)pauseCommand;
- (MPRemoteCommandHandlerStatus)stopCommand;
- (MPRemoteCommandHandlerStatus)togglePlayPauseCommand;

- (MPRemoteCommandHandlerStatus)skipBackwardCommand;
- (MPRemoteCommandHandlerStatus)skipForwardCommand;

@end

@interface RemoteCommandCenterController : NSObject

@property (nonatomic, weak) id<RemoteCommandCenterControllerDelegate> delegate;

+ (RemoteCommandCenterController *)sharedRCCController;
- (void)configureMediaPlayer;

- (void)showRemoteTitle:(NSString *)title createdDate:(NSString *)date duration:(NSNumber *)duration elapsedTime:(NSNumber *)elapsedTime;
- (void)showRemoteElapsedPlaybackTime:(NSNumber *)time;

@end
