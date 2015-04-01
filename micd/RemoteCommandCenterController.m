#import "RemoteCommandCenterController.h"

@interface RemoteCommandCenterController ()

@property (nonatomic, strong) MPRemoteCommandCenter *remoteCommandCenter;

@property (nonatomic, strong) NSString *nowPlayingInfoTitle;
@property (nonatomic, strong) NSString *nowPlayingInfoDate;
@property (nonatomic, strong) NSNumber *nowPlayingInfoElapsedTime;
@property (nonatomic, strong) NSNumber *nowPlayingInfoDuration;

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
        _nowPlayingInfoTitle = @"";
        _nowPlayingInfoDate = @"";
        _nowPlayingInfoElapsedTime = @0;
        _nowPlayingInfoDuration = @0;
    }
    return self;
}

- (void)dealloc {
    [self removeAllTargets];
}

#pragma mark - MPNowPlayingInfoCenter Methods

- (void)showRemoteTitle:(NSString *)title createdDate:(NSString *)date duration:(NSNumber *)duration elapsedTime:(NSNumber *)elapsedTime {
//    if (title.length == 0) {
//        title = date;
//        date = @"";
//    }
    
    self.nowPlayingInfoTitle = title;
    self.nowPlayingInfoDate = date;
    self.nowPlayingInfoDuration = duration;
    self.nowPlayingInfoElapsedTime = (duration.integerValue >= elapsedTime.integerValue) ? elapsedTime : @0;
    
    [self updateNowPlayingInfo];
}

- (void)showRemoteElapsedPlaybackTime:(NSNumber *)time {
    if (self.nowPlayingInfoElapsedTime.integerValue != time.integerValue) {
        NSLog(@"%i", time.intValue);
        self.nowPlayingInfoElapsedTime = time;
        [self updateNowPlayingInfo];
    }
}

- (void)updateNowPlayingInfo {
    NSDictionary *trackInfo = @{MPMediaItemPropertyMediaType: @(MPMediaTypeAnyAudio),
                                MPMediaItemPropertyTitle: self.nowPlayingInfoTitle,
                                MPMediaItemPropertyArtist: self.nowPlayingInfoDate,
                                MPNowPlayingInfoPropertyElapsedPlaybackTime: self.nowPlayingInfoElapsedTime,
                                MPMediaItemPropertyPlaybackDuration: self.nowPlayingInfoDuration};
    
    [[MPNowPlayingInfoCenter defaultCenter] setNowPlayingInfo:trackInfo];
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

- (void)configureMediaPlayer {
    // In case the target actions are already registered we don't want them firing twice
    [self removeAllTargets];
    
    [self setupPlaybackCommands];
    [self setupChangingTracksCommands];
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
    
    [self.remoteCommandCenter.skipForwardCommand removeTarget:self action:@selector(skipForward)];
    [self.remoteCommandCenter.skipBackwardCommand removeTarget:self action:@selector(skipBackward)];
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
