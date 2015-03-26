#import "PlayerController.h"
#import <AVFoundation/AVFoundation.h>
#import "Recording.h"

@interface PlayerController () <AVAudioPlayerDelegate>

@property (nonatomic, strong) AVAudioSession *audioSession;
@property (nonatomic, strong) AVAudioPlayer *audioPlayer;

@property (strong, nonatomic, readwrite) Recording *loadedRecording;
@property (nonatomic, assign, readwrite) NSTimeInterval secondsCompleted;

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
    self.secondsCompleted = 0.0f;
    self.playerState = PlayerControllerStatePaused;
    self.audioPlayer = [[AVAudioPlayer alloc] initWithData:recording.data error:nil];
    self.loadedRecording = recording;
    self.audioPlayer.delegate = self;
}

- (void)playAudio {
    if (self.secondsCompleted >= self.loadedRecording.lengthAsTimeInterval) {
        [self setPlaybackTimeInterval:0.f];
    }
    self.playerState = PlayerControllerStatePlaying;
    [self.audioPlayer play];
}

- (void)pauseAudio {
    self.playerState = PlayerControllerStatePaused;
    [self.audioPlayer pause];
}

- (void)setPlaybackTimeInterval:(NSTimeInterval)timeInterval {
    if (timeInterval >= self.audioPlayer.duration) {
        timeInterval = self.audioPlayer.duration - 0.001f;
        self.secondsCompleted = self.loadedRecording.lengthAsTimeInterval;
    } else if (timeInterval <= 0) {
        timeInterval = 0.001f;
        self.secondsCompleted = 0.0f;
    } else {
        self.secondsCompleted = timeInterval;
    }
    
    self.audioPlayer.currentTime = timeInterval;
}

#pragma mark - Public Readonly Properties

- (NSTimeInterval)secondsCompleted {
    if (self.playerState == PlayerControllerStatePlaying) {
        if (self.audioPlayer.currentTime + 0.05 >= self.audioPlayer.duration) {
            _secondsCompleted = self.loadedRecording.lengthAsTimeInterval;
            self.playerState = PlayerControllerStatePaused;
        } else {
            _secondsCompleted = self.audioPlayer.currentTime;
        }
    }
    
    return _secondsCompleted;
}

- (CGFloat)percentageCompleted {
    return self.secondsCompleted/self.loadedRecording.lengthAsTimeInterval;
}

- (NSString *)displayableCurrentTime {
    NSString *displayableLength;
    NSTimeInterval currentTime = self.secondsCompleted;
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

#pragma mark - Custom Setters

- (void)setAudioPlayer:(AVAudioPlayer *)player {
    _audioPlayer = player;
    [_audioPlayer prepareToPlay];
}

#pragma mark - AVAudioPlayerDelegate

- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag {
    self.secondsCompleted = self.loadedRecording.lengthAsTimeInterval;
    self.playerState = PlayerControllerStatePaused;
    [self.delegate playerController:self didFinishPlayingSuccessfully:flag];
}

- (void)audioPlayerDecodeErrorDidOccur:(AVAudioPlayer *)player error:(NSError *)error {
    self.secondsCompleted = 0.0f;
    self.playerState = PlayerControllerStatePaused;
    [self.delegate playerController:self didFinishPlayingSuccessfully:(error == nil)];
}

@end
