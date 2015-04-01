#import <Foundation/Foundation.h>
#import <MediaPlayer/MediaPlayer.h>

typedef NS_ENUM(NSInteger, RemoteCommandCenterControllerState) {
    RemoteCommandCenterControllerStatePlaying,
    RemoteCommandCenterControllerStateRecording
};

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

- (void)showRemoteTitle:(NSString *)title createdDate:(NSString *)date duration:(NSNumber *)duration elapsedTime:(NSNumber *)elapsedTime forstate:(RemoteCommandCenterControllerState)state;
- (void)showRemoteElapsedPlaybackTime:(NSNumber *)time;

@end
