#import <Foundation/Foundation.h>
#import <MediaPlayer/MediaPlayer.h>

@protocol RemoteCommandCenterControllerDelegate <NSObject>

- (MPRemoteCommandHandlerStatus)pauseCommand;
- (MPRemoteCommandHandlerStatus)playCommand;
- (MPRemoteCommandHandlerStatus)stopCommand;
- (MPRemoteCommandHandlerStatus)togglePlayPauseCommand;

- (MPRemoteCommandHandlerStatus)nextTrackCommand;
- (MPRemoteCommandHandlerStatus)previousTrackCommand;

@end

@interface RemoteCommandCenterController : NSObject

- (instancetype)initWithDelegate:(id)delegate;
- (void)setupMediaPlayer;

@end
