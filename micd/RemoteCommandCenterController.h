#import <Foundation/Foundation.h>
#import <MediaPlayer/MediaPlayer.h>

typedef NS_ENUM(NSInteger, RemoteCommandCenterControllerState) {
    RemoteCommandCenterControllerStatePlaying = 1,
    RemoteCommandCenterControllerStateRecording
};

@protocol RemoteCommandCenterControllerDelegate <NSObject>

- (MPRemoteCommandHandlerStatus)playCommand;
- (MPRemoteCommandHandlerStatus)pauseCommand;
- (MPRemoteCommandHandlerStatus)stopCommand;
- (MPRemoteCommandHandlerStatus)togglePlayPauseCommand;

- (MPRemoteCommandHandlerStatus)previousTrackCommand;
- (MPRemoteCommandHandlerStatus)nextTrackCommand;

- (MPRemoteCommandHandlerStatus)skipBackwardCommand;
- (MPRemoteCommandHandlerStatus)skipForwardCommand;

@end

@interface RemoteCommandCenterController : NSObject

@property (nonatomic, weak) id<RemoteCommandCenterControllerDelegate> delegate;

+ (RemoteCommandCenterController *)sharedRCCController;
- (instancetype)init NS_UNAVAILABLE;

- (void)showRemoteTitle:(NSString *)title createdDate:(NSString *)date duration:(NSNumber *)duration elapsedTime:(NSNumber *)elapsedTime forstate:(RemoteCommandCenterControllerState)state;
- (void)showRemoteElapsedPlaybackTime:(NSNumber *)time;

@end
