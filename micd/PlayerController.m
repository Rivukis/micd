#import "PlayerController.h"
#import <AVFoundation/AVFoundation.h>
#import "Recording.h"

@interface PlayerController () <AVAudioPlayerDelegate>

@property (nonatomic, strong) AVAudioSession *audioSession;
@property (nonatomic, strong) AVAudioPlayer *audioPlayer;

@property (strong, nonatomic, readwrite) NSUUID *loadedRecordingUUID;

@end

@implementation PlayerController

- (instancetype)init {
    return [PlayerController sharedPlayer];
}

+ (PlayerController *)sharedPlayer {
    static PlayerController *sharedPlayer = nil;
    @synchronized(self) {
        if (!sharedPlayer) {
            sharedPlayer = [[self alloc] init_common];
        }
    }
    return sharedPlayer;
}

- (instancetype)init_common {
    self = [super init];
    if (self) {
        _audioSession = [AVAudioSession sharedInstance];
        [_audioSession setActive:YES error:nil];
    }
    return self;
}

#pragma mark - API Methods

- (void)loadRecording:(Recording *)recording {
    self.audioPlayer = [[AVAudioPlayer alloc] initWithData:recording.data error:nil];
    self.audioPlayer.delegate = self.audioPlayerDelegate;
    self.loadedRecordingUUID = recording.uuid;
}

- (void)playAudio {
    [self.audioPlayer play];
}

- (void)pauseAudio {
    [self.audioPlayer pause];
}

- (void)setPlaybackTimeInterval:(NSTimeInterval)timeInterval {
    if (timeInterval >= self.audioPlayer.duration) {
        timeInterval = self.audioPlayer.duration - 0.001f;
    }
    if (timeInterval <= 0) {
        timeInterval = 0.001f;
    }
    
    self.audioPlayer.currentTime = timeInterval;
}

#pragma mark - Public Readonly Properties

- (NSTimeInterval)secondsCompleted {
    return self.audioPlayer.currentTime;
}

- (NSString *)displayableCurrentTime {
    NSString *displayableLength;
    NSTimeInterval currentTime = self.audioPlayer.currentTime;
    NSInteger hours = lround(floor(currentTime / 3600.)) % 100;
    NSInteger minutes = lround(floor(currentTime / 60.)) % 60;
    NSInteger seconds = lround(floor(currentTime)) % 60;
    
    if (currentTime >= 3600) {
        displayableLength = [NSString stringWithFormat:@"%ld:%02ld:%02ld", (long)hours, (long)minutes, (long)seconds];
    } else {
        displayableLength = [NSString stringWithFormat:@"%ld:%02ld", (long)minutes, (long)seconds];
    }
    
    return displayableLength;
}

- (NSTimeInterval)loadedRecordingDuration {
    return self.audioPlayer.duration;
}

#pragma mark - Custom Setters

- (void)setAudioPlayer:(AVAudioPlayer *)player {
    _audioPlayer = player;
    [_audioPlayer prepareToPlay];
}

@end
