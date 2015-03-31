#import "RemoteCommandCenterController.h"

@interface RemoteCommandCenterController ()

@property (nonatomic, readonly) MPRemoteCommandCenter *remoteCommandCenter;
@property (nonatomic, weak) id<RemoteCommandCenterControllerDelegate> delegate;
@property (nonatomic, assign) BOOL mediaPlayerHasBeenSetup;

@end

@implementation RemoteCommandCenterController

- (instancetype)initWithDelegate:(id)delegate {
    self = [super init];
    if (self) {
        _delegate = delegate;
        if (!self.mediaPlayerHasBeenSetup) {
            [self setupMediaPlayer];
            self.mediaPlayerHasBeenSetup = YES;
        }
    }
    return self;
}

- (MPRemoteCommandCenter *)remoteCommandCenter {
    return [MPRemoteCommandCenter sharedCommandCenter];
}

- (void)setupMediaPlayer {
    [self setupPlaybackCommands];
    [self setupChangingTracksCommands];
    
//    NSURL *url = [NSURL URLWithString:@"/Users/Rivukis/Library/Developer/CoreSimulator/Devices/781FEA78-63CD-4EA8-9ABA-F36E69FDACC3/data/Containers/Data/Application/06ED118A-7FB6-495A-9A38-80583445BC13/Documents/325C0148-34ED-48A2-A3A5-EFCB3A76B82C.m4a"];
//    MPMoviePlayerController *audioPlayer = [[MPMoviePlayerController alloc] initWithContentURL:url];
//    [audioPlayer play];
    
    [[UIApplication sharedApplication] beginReceivingRemoteControlEvents];
    NSMutableDictionary *trackInfo = [NSMutableDictionary dictionary];
    [trackInfo setObject:@"Current Title" forKey:MPMediaItemPropertyTitle];
    [trackInfo setObject:@"Mr. Author" forKey:MPMediaItemPropertyArtist];
    [trackInfo setObject:@"Who Cares Album" forKey:MPMediaItemPropertyAlbumTitle];
    [trackInfo setObject:@(123) forKey:MPMediaItemPropertyPlaybackDuration];
    [trackInfo setObject:@(120) forKey:MPNowPlayingInfoPropertyElapsedPlaybackTime];
//    UIImage *image = [UIImage imageNamed:@"album_art"];
//    MPMediaItemArtwork *artwork = [[MPMediaItemArtwork alloc] initWithImage:image];
//    [trackInfo setObject:artwork forKey:MPMediaItemPropertyArtwork];
    [[MPNowPlayingInfoCenter defaultCenter] setNowPlayingInfo:trackInfo];
}

- (void)setupPlaybackCommands {
    // pause and maintain position
    self.remoteCommandCenter.pauseCommand.enabled = YES;
    [self.remoteCommandCenter.pauseCommand addTargetWithHandler:^MPRemoteCommandHandlerStatus(MPRemoteCommandEvent *event) {
        // from command center and lock screen
        NSLog(@"pause command");
        return [self.delegate pauseCommand];
    }];
    
    // start playback of current item
    self.remoteCommandCenter.playCommand.enabled = NO;
    [self.remoteCommandCenter.playCommand addTargetWithHandler:^MPRemoteCommandHandlerStatus(MPRemoteCommandEvent *event) {
        // from command center and lock screen
        NSLog(@"play command");
        return [self.delegate playCommand];
    }];
    
    // stop playback of current item
    self.remoteCommandCenter.stopCommand.enabled = YES;
    [self.remoteCommandCenter.stopCommand addTargetWithHandler:^MPRemoteCommandHandlerStatus(MPRemoteCommandEvent *event) {
        // not sure what sends this command
        NSLog(@"stop command");
        return [self.delegate stopCommand];
    }];
    
    // play if paused and pause if playing
    self.remoteCommandCenter.togglePlayPauseCommand.enabled = YES;
    [self.remoteCommandCenter.togglePlayPauseCommand addTargetWithHandler:^MPRemoteCommandHandlerStatus(MPRemoteCommandEvent *event) {
        NSLog(@"toggle play pause command");
        
        // from headphones
        return [self.delegate togglePlayPauseCommand];
    }];
}

- (void)setupChangingTracksCommands {
    self.remoteCommandCenter.skipBackwardCommand.enabled = YES;
    self.remoteCommandCenter.skipBackwardCommand.preferredIntervals = @[@15];
    [self.remoteCommandCenter.skipBackwardCommand addTargetWithHandler:^MPRemoteCommandHandlerStatus(MPRemoteCommandEvent *event) {
        NSLog(@"skip backward command");
        return [self.delegate previousTrackCommand];
    }];
    
    self.remoteCommandCenter.skipForwardCommand.enabled = YES;
    self.remoteCommandCenter.skipForwardCommand.preferredIntervals = @[@30];
    [self.remoteCommandCenter.skipForwardCommand addTargetWithHandler:^MPRemoteCommandHandlerStatus(MPRemoteCommandEvent *event) {
        NSLog(@"skip forward command");
        return [self.delegate nextTrackCommand];
    }];
    
    self.remoteCommandCenter.nextTrackCommand.enabled = YES;
    [self.remoteCommandCenter.nextTrackCommand addTargetWithHandler:^MPRemoteCommandHandlerStatus(MPRemoteCommandEvent *event) {
        NSLog(@"next track command");
        return [self.delegate nextTrackCommand];
    }];
    
    self.remoteCommandCenter.previousTrackCommand.enabled = YES;
    [self.remoteCommandCenter.previousTrackCommand addTargetWithHandler:^MPRemoteCommandHandlerStatus(MPRemoteCommandEvent *event) {
        NSLog(@"previous track command");
        return [self.delegate previousTrackCommand];
    }];
}

- (void)remoteControlReceivedWithEvent:(UIEvent *)theEvent {
    if (theEvent.type == UIEventTypeRemoteControl)
    {
        switch(theEvent.subtype) {
            case UIEventSubtypeRemoteControlTogglePlayPause:
                //Insert code
                
            case UIEventSubtypeRemoteControlPlay:
                //Insert code
                break;
            case UIEventSubtypeRemoteControlPause:
                // Insert code
                break;
            case UIEventSubtypeRemoteControlStop:
                //Insert code.
                break;
            default:
                return;
        }
    }
}

@end
