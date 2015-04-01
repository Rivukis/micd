#import "RemoteCommandCenterController.h"

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
    
//    if (self.state == RemoteCommandCenterControllerStatePlaying) {
//        if (title.length == 0) {
//            title = date;
//            date = @"";
//        }
//    }
    
    self.nowPlayingInfoTitle = title;
    self.nowPlayingInfoDate = date;
    self.nowPlayingInfoDuration = duration;
    self.nowPlayingInfoElapsedTime = (elapsedTime <= duration) ? elapsedTime : @0;
    
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
    
    [[MPNowPlayingInfoCenter defaultCenter] setNowPlayingInfo:[trackInfo copy]];
}

- (NSString *)nowPlayingInfoTitle {
    return _nowPlayingInfoTitle ?: @"";
}

- (NSString *)nowPlayingInfoDate {
    return _nowPlayingInfoDate ?: @"";
}

- (NSNumber *)nowPlayingInfoElapsedTime {
    return _nowPlayingInfoElapsedTime ?: @0;
}

- (NSNumber *)nowPlayingInfoDuration {
    return _nowPlayingInfoDuration ?: @0;
}

#pragma mark - MPRemoteCommandCenter Methods

- (void)configureMediaPlayerForRecording {
    [self removeAllTargets];
}

- (void)configureMediaPlayerForPlaying {
    // In case the target actions are already registered we don't want them firing twice
    [self removeAllTargets];
    
    [self setupPlaybackCommands];
    [self setupSkipCommands];
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

- (void)setupSkipCommands {
    self.remoteCommandCenter.skipBackwardCommand.enabled = YES;
    self.remoteCommandCenter.skipBackwardCommand.preferredIntervals = @[@15];
    [self.remoteCommandCenter.skipBackwardCommand addTarget:self action:@selector(skipBackward)];
    
    self.remoteCommandCenter.skipForwardCommand.enabled = YES;
    self.remoteCommandCenter.skipForwardCommand.preferredIntervals = @[@30];
    [self.remoteCommandCenter.skipForwardCommand addTarget:self action:@selector(skipForward)];
}

- (void)removeAllTargets {
    [self.remoteCommandCenter.playCommand removeTarget:self action:@selector(play)];
    [self.remoteCommandCenter.pauseCommand removeTarget:self action:@selector(pause)];
    [self.remoteCommandCenter.stopCommand removeTarget:self action:@selector(stop)];
    [self.remoteCommandCenter.togglePlayPauseCommand removeTarget:self action:@selector(togglePlayPause)];
    
    [self.remoteCommandCenter.skipBackwardCommand removeTarget:self action:@selector(skipBackward)];
    [self.remoteCommandCenter.skipForwardCommand removeTarget:self action:@selector(skipForward)];
}

#pragma mark - Remote Command Messages

- (MPRemoteCommandHandlerStatus)play {
    return [self.delegate playCommand];
}

- (MPRemoteCommandHandlerStatus)pause {
    return [self.delegate pauseCommand];
}

- (MPRemoteCommandHandlerStatus)stop {
    return [self.delegate stopCommand];
}

- (MPRemoteCommandHandlerStatus)togglePlayPause {
    return [self.delegate togglePlayPauseCommand];
}

- (MPRemoteCommandHandlerStatus)skipBackward {
    return [self.delegate skipBackwardCommand];
}

- (MPRemoteCommandHandlerStatus)skipForward {
    return [self.delegate skipForwardCommand];
}

@end
