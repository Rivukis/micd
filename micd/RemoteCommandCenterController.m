#import "RemoteCommandCenterController.h"

static const BOOL useSkipButtons = NO;

@interface RemoteCommandCenterController ()

@property (nonatomic, strong) MPRemoteCommandCenter *remoteCommandCenter;

@property (nonatomic, strong) NSString *nowPlayingInfoTitle;
@property (nonatomic, strong) NSString *nowPlayingInfoDate;
@property (nonatomic, strong) NSNumber *nowPlayingInfoElapsedTime;
@property (nonatomic, strong) NSNumber *nowPlayingInfoDuration;

@property (nonatomic, assign) RemoteCommandCenterControllerState state;

@end

@implementation RemoteCommandCenterController

+ (RemoteCommandCenterController *)sharedRCCController {
    static RemoteCommandCenterController *sharedDataSource = nil;
    @synchronized(self) {
        if (!sharedDataSource) {
            sharedDataSource = [[self alloc] init_common];
        }
    }
    return sharedDataSource;
}

- (instancetype)init_common {
    self = [super init];
    if (self) {
        _remoteCommandCenter = [MPRemoteCommandCenter sharedCommandCenter];
    }
    return self;
}

- (void)dealloc {
    [self removeAllTargets];
}

#pragma mark - MPNowPlayingInfoCenter Public Methods

- (void)showRemoteTitle:(NSString *)title createdDate:(NSString *)date duration:(NSNumber *)duration elapsedTime:(NSNumber *)elapsedTime forstate:(RemoteCommandCenterControllerState)state {
    self.state = state;
    
    self.nowPlayingInfoTitle = title;
    self.nowPlayingInfoDate = date;
    self.nowPlayingInfoDuration = duration;
    self.nowPlayingInfoElapsedTime = (elapsedTime.doubleValue <= duration.doubleValue) ? elapsedTime : [NSNumber numberWithDouble:0.f];
    
    [self updateNowPlayingInfo];
}

- (void)showRemoteElapsedPlaybackTime:(NSNumber *)time {
    if (self.nowPlayingInfoElapsedTime.integerValue != time.integerValue) {
        self.nowPlayingInfoElapsedTime = time;
        [self updateNowPlayingInfo];
    }
}

- (void)setState:(RemoteCommandCenterControllerState)state {
    if (_state != state) {
        if (state == RemoteCommandCenterControllerStatePlaying) {
            [self configureMediaPlayerForPlaying];
        } else {
            [self configureMediaPlayerForRecording];
        }
        _state = state;
    }
}

#pragma mark - MPNowPlayingInfoCenter Private Methods

- (void)updateNowPlayingInfo {
    NSMutableDictionary *trackInfo = [NSMutableDictionary dictionary];
    
    [trackInfo setObject:@(MPMediaTypeAnyAudio) forKey:MPMediaItemPropertyMediaType];
    if (self.nowPlayingInfoTitle) [trackInfo setObject:self.nowPlayingInfoTitle forKey:MPMediaItemPropertyTitle];
    if (self.nowPlayingInfoDate) [trackInfo setObject:self.nowPlayingInfoDate forKey:MPMediaItemPropertyArtist];
    if (self.nowPlayingInfoElapsedTime) [trackInfo setObject:self.nowPlayingInfoElapsedTime forKey:MPNowPlayingInfoPropertyElapsedPlaybackTime];
    if (self.nowPlayingInfoDuration) [trackInfo setObject:self.nowPlayingInfoDuration forKey:MPMediaItemPropertyPlaybackDuration];
    
    //    UIImage *image = [UIImage imageNamed:@"album_art"];
    //    MPMediaItemArtwork *artwork = [[MPMediaItemArtwork alloc] initWithImage:image];
    //    [trackInfo setObject:artwork forKey:MPMediaItemPropertyArtwork];
    
    [[MPNowPlayingInfoCenter defaultCenter] setNowPlayingInfo:[trackInfo copy]];
}

#pragma mark - MPRemoteCommandCenter Methods

- (void)configureMediaPlayerForPlaying {
    // In case the target actions are already registered we don't want them firing twice
    [self removeAllTargets];
    
    [self setupPlaybackCommands];
    [self setupChangingTracksCommands];
    [self setupSkipCommands];
}

- (void)configureMediaPlayerForRecording {
    [self removeAllTargets];
    
    [self setupPauseCommandForRecording];
}

- (void)setupPlaybackCommands {
    self.remoteCommandCenter.playCommand.enabled = YES;
    [self.remoteCommandCenter.playCommand addTarget:self action:@selector(play)];

    self.remoteCommandCenter.pauseCommand.enabled = YES;
    [self.remoteCommandCenter.pauseCommand addTarget:self action:@selector(pause)];
    
    self.remoteCommandCenter.stopCommand.enabled = YES;
    [self.remoteCommandCenter.stopCommand addTarget:self action:@selector(stop)];
    
    self.remoteCommandCenter.togglePlayPauseCommand.enabled = YES;
    [self.remoteCommandCenter.togglePlayPauseCommand addTarget:self action:@selector(togglePlayPause)];
}

- (void)setupChangingTracksCommands {
    self.remoteCommandCenter.previousTrackCommand.enabled = YES;
    [self.remoteCommandCenter.previousTrackCommand addTarget:self action:@selector(previousTrack)];
    
    self.remoteCommandCenter.nextTrackCommand.enabled = YES;
    [self.remoteCommandCenter.nextTrackCommand addTarget:self action:@selector(nextTrack)];
}

- (void)setupSkipCommands {
    if (useSkipButtons) {
        self.remoteCommandCenter.skipBackwardCommand.enabled = YES;
        self.remoteCommandCenter.skipBackwardCommand.preferredIntervals = @[@15];
        [self.remoteCommandCenter.skipBackwardCommand addTarget:self action:@selector(skipBackward)];
        
        self.remoteCommandCenter.skipForwardCommand.enabled = YES;
        self.remoteCommandCenter.skipForwardCommand.preferredIntervals = @[@30];
        [self.remoteCommandCenter.skipForwardCommand addTarget:self action:@selector(skipForward)];
    }
}

- (void)setupPauseCommandForRecording {
    self.remoteCommandCenter.pauseCommand.enabled = YES;
    [self.remoteCommandCenter.pauseCommand addTarget:self action:@selector(pause)];
}

- (void)removeAllTargets {
    [self.remoteCommandCenter.playCommand removeTarget:self action:@selector(play)];
    [self.remoteCommandCenter.pauseCommand removeTarget:self action:@selector(pause)];
    [self.remoteCommandCenter.stopCommand removeTarget:self action:@selector(stop)];
    [self.remoteCommandCenter.togglePlayPauseCommand removeTarget:self action:@selector(togglePlayPause)];
    
    [self.remoteCommandCenter.previousTrackCommand removeTarget:self action:@selector(previousTrack)];
    [self.remoteCommandCenter.nextTrackCommand removeTarget:self action:@selector(nextTrack)];
    
    [self.remoteCommandCenter.skipBackwardCommand removeTarget:self action:@selector(skipBackward)];
    self.remoteCommandCenter.skipBackwardCommand.preferredIntervals = nil;
    [self.remoteCommandCenter.skipForwardCommand removeTarget:self action:@selector(skipForward)];
    self.remoteCommandCenter.skipForwardCommand.preferredIntervals = nil;
}

#pragma mark - Remote Command Messages

- (MPRemoteCommandHandlerStatus)play {
    if ([self.delegate respondsToSelector:@selector(playCommand)]) {
        return [self.delegate playCommand];
    }
    return MPRemoteCommandHandlerStatusCommandFailed;
}

- (MPRemoteCommandHandlerStatus)pause {
    if ([self.delegate respondsToSelector:@selector(pauseCommand)]) {
        return [self.delegate pauseCommand];
    }
    return MPRemoteCommandHandlerStatusCommandFailed;
}

- (MPRemoteCommandHandlerStatus)stop {
    if ([self.delegate respondsToSelector:@selector(stopCommand)]) {
        return [self.delegate stopCommand];
    }
    return MPRemoteCommandHandlerStatusCommandFailed;
}

- (MPRemoteCommandHandlerStatus)togglePlayPause {
    if ([self.delegate respondsToSelector:@selector(togglePlayPauseCommand)]) {
        return [self.delegate togglePlayPauseCommand];
    }
    return MPRemoteCommandHandlerStatusCommandFailed;
}

- (MPRemoteCommandHandlerStatus)previousTrack {
    if ([self.delegate respondsToSelector:@selector(previousTrackCommand)]) {
        return [self.delegate previousTrackCommand];
    }
    return MPRemoteCommandHandlerStatusCommandFailed;
}

- (MPRemoteCommandHandlerStatus)nextTrack {
    if ([self.delegate respondsToSelector:@selector(nextTrackCommand)]) {
        return [self.delegate nextTrackCommand];
    }
    return MPRemoteCommandHandlerStatusCommandFailed;
}

- (MPRemoteCommandHandlerStatus)skipBackward {
    if ([self.delegate respondsToSelector:@selector(skipBackwardCommand)]) {
        return [self.delegate skipBackwardCommand];
    }
    return MPRemoteCommandHandlerStatusCommandFailed;
}

- (MPRemoteCommandHandlerStatus)skipForward {
    if ([self.delegate respondsToSelector:@selector(skipForwardCommand)]) {
        return [self.delegate skipForwardCommand];
    }
    return MPRemoteCommandHandlerStatusCommandFailed;
}

@end
