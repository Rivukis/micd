//
//  RecordingsViewController.m
//  micd
//
//  Created by Timothy Hise on 2/7/15.
//  Copyright (c) 2015 CleverKnot. All rights reserved.
//

#import "RecordingsViewController.h"
#import "UIColor+Palette.h"
#import "DataSourceController.h"
#import "Recording.h"
#import "PlayerController.h"
#import "WireTapStyleKit.h"
#import "RecordingCell.h"
#import "RecordingsSection.h"
#import "FakesForProject.h"
#import "SCWaveformView.h"
#import "RecordingCellModel.h"

@interface RecordingsViewController () <UITableViewDataSource, UITableViewDelegate, AVAudioPlayerDelegate>

@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIView *waveformContainerView;
@property (weak, nonatomic) IBOutlet UIImageView *tableBottomBorder;
@property (weak, nonatomic) IBOutlet UILabel *playbackTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *currentPlaybackTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalPlaybackTimeLabel;

@property (strong, nonatomic) DataSourceController *dataSource;
@property (strong, nonatomic) PlayerController *playerController;
@property (strong, nonatomic) Recording *playbackRecording;
@property (strong, nonatomic) SCWaveformView *waveformView;
@property (strong, nonatomic) NSArray *sections;

@property (assign, nonatomic) BOOL didGetOriginalHeight;
@property (assign, nonatomic) CGFloat originalHeight;
@property (assign, nonatomic) BOOL didGetOriginalTableViewHeight;
@property (assign, nonatomic) CGFloat originalTableViewHeight;

@property (strong, nonatomic) CADisplayLink *displayLink;

@property (assign, nonatomic) BOOL isFirstTimeLayingOutSubviews;

@property (assign, nonatomic) BOOL audioWasPlaying_gestureStateBegan;

@end

@implementation RecordingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dataSource = [DataSourceController sharedDataSource];
    self.playerController = [PlayerController sharedPlayer];
    self.playerController.audioPlayerDelegate = self;
    
    self.isFirstTimeLayingOutSubviews = YES;
    
    [self.tableView setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.scrollsToTop = YES;
    
    self.currentPlaybackTimeLabel.textColor = [UIColor vibrantBlueText];
    self.playbackTitleLabel.textColor = [UIColor vibrantBlueText];
    self.totalPlaybackTimeLabel.textColor = [UIColor vibrantBlueText];
    
//    [self.tableView addObserver:self forKeyPath:@"contentSize" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:NULL];
    self.tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    self.displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(handleDisplayLinkAnimation:)];
    [self.displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
    self.displayLink.paused = YES;
    
    [self reloadData];
    
    self.playerState = PlayerStatePaused;
    
    if ([self mostRecentRecording]) {
        self.tableBottomBorder.hidden = NO;
        self.playbackTitleLabel.hidden = NO;
        self.currentPlaybackTimeLabel.hidden = NO;
        self.totalPlaybackTimeLabel.hidden = NO;
    }
}

- (void)reloadData {
    self.sections = [RecordingsSection arrayOfSectionsForRecordings:self.dataSource.recordings ascending:NO];
    [self.tableView reloadData];
    if (self.tableBottomBorder.hidden == YES && self.dataSource.recordings.count) {
        self.tableBottomBorder.hidden = NO;
        self.playbackTitleLabel.hidden = NO;
        self.currentPlaybackTimeLabel.hidden = NO;
        self.totalPlaybackTimeLabel.hidden = NO;
        [self readyPlayerWithRecording:[self mostRecentRecording]];
    }
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];

    self.tableBottomBorder.backgroundColor = [UIColor vibrantBlue];
    
    if (!self.didGetOriginalHeight) {
        self.didGetOriginalHeight = YES;
        self.originalHeight = self.view.frame.size.height;
    }
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    if (!self.didGetOriginalTableViewHeight) {
        self.didGetOriginalTableViewHeight = YES;
        self.originalTableViewHeight = self.tableView.frame.size.height;
    }
    
    if (!self.waveformView) {
        self.waveformView = [[SCWaveformView alloc] init];
        self.waveformView.frame = self.waveformContainerView.bounds;
        [self.waveformContainerView addSubview:self.waveformView];
        self.waveformContainerView.layer.masksToBounds = YES;
        self.waveformContainerView.backgroundColor = [UIColor clearColor];
        self.waveformView.progressColor = [UIColor vibrantBlue];
        self.waveformView.precision = 0.20;
        self.waveformView.lineWidthRatio = 0.6;
        self.waveformView.channelStartIndex = 0;
        self.waveformView.channelEndIndex = 0;
        
        UILongPressGestureRecognizer *gesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleWaveFormPanning:)];
        gesture.minimumPressDuration = 0.001f;
        [self.waveformContainerView addGestureRecognizer:gesture];
    }
    
    if (self.isFirstTimeLayingOutSubviews) {
        [self scrollToMostRecentRecording];
        self.isFirstTimeLayingOutSubviews = NO;
    }
}

- (void)scrollToMostRecentRecording {
    RecordingsSection *lastSection = self.sections.lastObject;
    if (lastSection) {
        [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:self.sections.count - 1] atScrollPosition:UITableViewScrollPositionTop animated:NO];
    }
}

- (Recording *)mostRecentRecording {
    RecordingsSection *firstRecordingsSection = self.sections.lastObject;
    RecordingCellModel *lastAddedRecordingModel = [firstRecordingsSection cellModelAtIndex:firstRecordingsSection.numberOfCellModels - 1];
    return lastAddedRecordingModel.recording;
}

#pragma mark - FramesBasedOnStateProtocol

- (void)handleDisplayLinkAnimation:(CADisplayLink *)displayLink {
    //    CGRect presentationFrame = [self.contentView.layer.presentationLayer frame];
    
    if (self.playerController.secondsCompleted >= self.playbackRecording.lengthAsTimeInterval || self.playerController.secondsCompleted == 0) {
        self.waveformView.progressTime = CMTimeMakeWithSeconds(self.playbackRecording.lengthAsTimeInterval, 60);
        return;
    }
    self.currentPlaybackTimeLabel.text = self.playerController.displayableCurrentTime;
    self.waveformView.progressTime = CMTimeMakeWithSeconds(self.playerController.secondsCompleted, 60);
}

- (void)setInitialStateFrame {
    CGRect screenSize = [[UIScreen mainScreen] bounds];
    self.view.frame = CGRectMake(0,
                                 (self.view.window.frame.size.height * 1.068f) * -1,
                                 self.view.window.frame.size.width,
                                 screenSize.size.height * 0.82f);
}

- (void)setFrameBasedOnState:(HomeViewContollerPositionState)state {
    CGRect frame = self.view.frame;
    switch (state) {
        case HomeViewContollerPositionStateHome:
            frame.origin.y = (self.view.window.frame.size.height * -1.068f);
            break;
        case HomeViewContollerPositionStateRecordings:
            frame.origin.y = 0;
            break;
        case HomeViewContollerPositionStateSettings:
            frame.origin.y = (self.view.window.frame.size.height * -1.068f * 2);
            break;
        default:
            break;
    }
    self.view.frame = frame;
}

- (void)adjustFrameBasedOnTranslation:(CGPoint)translation {
    CGRect frame = self.view.frame;
    frame.origin.y += translation.y;
    self.view.frame = frame;
}

#pragma mark - PlayerController Methods

- (void)readyPlayerWithRecording:(Recording *)recording {
    if (!recording) return;
    
    self.playbackTitleLabel.text = recording.title;
    self.totalPlaybackTimeLabel.text = recording.lengthToDiplay;
    self.playbackRecording = recording;
    
    self.waveformView.asset = recording.avAsset;
    CMTime recordingDuration = CMTimeMakeWithSeconds(recording.lengthAsTimeInterval, 10000);
    CMTimeRange displayedTimeRange = CMTimeRangeMake(kCMTimeZero, recordingDuration);
    self.waveformView.timeRange = displayedTimeRange;
    self.waveformView.normalColor = [UIColor grayColor];
    self.waveformView.progressTime = CMTimeMakeWithSeconds(0, 1);
    
    [self.playerController loadRecording:recording];
}

- (void)playPlayback {
    //TODO: put player state into the player controller
    
    [self.playerController playAudio];
    
//    if (!error) {
        [self.playerControlsDelegate shouldUpdatePlayPauseButtonForState:PlayerStatePlaying];
        self.playerState = PlayerStatePlaying;
        self.displayLink.paused = NO;
//    }
}

- (void)pausePlayback {
    [self pausePlaybackWhilePanning:NO];
}

- (void)pausePlaybackWhilePanning:(BOOL)isPanning {
    [self.playerController pauseAudio];
    [self.playerControlsDelegate shouldUpdatePlayPauseButtonForState:PlayerStatePaused];
    self.playerState = PlayerStatePaused;
    self.displayLink.paused = !isPanning;
}

- (void)offsetPlaybackByTimeInterval:(NSTimeInterval)timeInterval {
    [self.playerController setPlaybackTimeInterval:self.playerController.secondsCompleted + timeInterval];
    [self handleDisplayLinkAnimation:nil];
}

- (void)handleWaveFormPanning:(UILongPressGestureRecognizer *)gesture {
    
    // pauses while panning and plays when touch ends
    switch (gesture.state) {
        case UIGestureRecognizerStateBegan:
            self.audioWasPlaying_gestureStateBegan = self.playerState == PlayerStatePlaying;
            [self pausePlaybackWhilePanning:YES];
        case UIGestureRecognizerStateChanged: {
            CGPoint translation = [gesture locationInView:self.waveformView];
            float translationToWidthPercentage = translation.x / self.waveformView.bounds.size.width;
            NSTimeInterval secondsToTouchedLocation = translationToWidthPercentage * self.playerController.loadedRecordingDuration;
            [self.playerController setPlaybackTimeInterval:secondsToTouchedLocation];
        }
            break;
        case UIGestureRecognizerStateEnded:
            if (self.audioWasPlaying_gestureStateBegan) {
                [self playPlayback];
            } else {
                [self pausePlaybackWhilePanning:NO];
            }
        default:
            break;
    }
    
    // plays while scrubbing
    // -----handle issue when scrubbing on a track that is not playing (maybe only before or after track has played)
    // -----handle issue where audio ends while scrubbing
//    if (gesture.state == UIGestureRecognizerStateBegan || gesture.state == UIGestureRecognizerStateChanged) {
//        CGPoint translation = [gesture locationInView:self.waveformView];
//        float translationToWidthPercentage = translation.x / self.waveformView.bounds.size.width;
//        NSTimeInterval secondsToTouchedLocation = translationToWidthPercentage * self.playerController.duration;
//        [self setPlaybackTimeTo:secondsToTouchedLocation];
//    }
}

#pragma mark - AVAudioPlayerDelegate

- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag {
    // display link stop
    self.displayLink.paused = YES;
    self.waveformView.progressTime = CMTimeMakeWithSeconds(self.playbackRecording.lengthAsTimeInterval, 60);
    [self.waveformView setNeedsLayout];
    [self.playerControlsDelegate shouldUpdatePlayPauseButtonForState:PlayerStatePaused];
    self.playerState = PlayerStatePaused;
    NSLog(@"did finish playing");
}

- (void)audioPlayerDecodeErrorDidOccur:(AVAudioPlayer *)player error:(NSError *)error {
    // handle error
    NSLog(@"player had decode error: %@", error.localizedDescription);
}

#pragma mark - UITableViewDataSource && UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    RecordingsSection *recordingsSection = self.sections[indexPath.section];
    RecordingCellModel *recordingCellModel = [recordingsSection cellModelAtIndex:indexPath.row];
    
    if (recordingCellModel.state == CellStateDefault) {
//        recordingCellModel.state = CellStatePlaying;
        [self readyPlayerWithRecording:recordingCellModel.recording];
        [self playPlayback];
    }
    
    [tableView beginUpdates];
    [tableView endUpdates];
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        RecordingsSection *recordingSection = self.sections[indexPath.section];
        RecordingCellModel *cellModel = [recordingSection cellModelAtIndex:indexPath.row];
        Recording *recording = cellModel.recording;
        
        [self.dataSource deleteRecording:recording];
        self.sections = [RecordingsSection arrayOfSectionsForRecordings:self.dataSource.recordings ascending:NO];
        if (self.sections.count == 0) {
            [tableView deleteSections:[NSIndexSet indexSetWithIndex:indexPath.section] withRowAnimation:UITableViewRowAnimationAutomatic];
        } else {
            [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
        }
        
        NSLog(@"DELETE");
    }
}

-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleDelete;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    RecordingsSection *recordingsSection = self.sections[indexPath.section];
    RecordingCellModel *cellModel = [recordingsSection cellModelAtIndex:indexPath.row];
    return [cellModel heightForState];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    RecordingCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    RecordingsSection *recordingsSection = self.sections[indexPath.section];
    RecordingCellModel *recordingCellModel = [recordingsSection cellModelAtIndex:indexPath.row];
    [cell bindToModel:recordingCellModel];
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    RecordingsSection *recordingsSection = self.sections[section];
    return [recordingsSection numberOfCellModels];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.sections.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 45;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    RecordingsSection *recordingsSection = self.sections[section];
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.tableView.frame.size.width, 45.0f)];
    
    UIView *bottomBorderView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 44.0f, tableView.frame.size.width, 1.0f)];
    bottomBorderView.backgroundColor = [UIColor vibrantBlueHalfOpacity];
    [headerView addSubview:bottomBorderView];
    
    UILabel *headerTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, self.tableView.frame.size.width-13.0f, 20.0f)];
    headerTitleLabel.text = recordingsSection.dateAsString;
    headerTitleLabel.font = [UIFont fontWithName: @"Damascus" size:16.0f]; //AvenirNext-Regular
    headerTitleLabel.textAlignment = NSTextAlignmentRight;
    headerTitleLabel.textColor = [UIColor vibrantBlueText];
    [headerView addSubview:headerTitleLabel];
    
    headerView.backgroundColor = [UIColor blackColor];
    
    return headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.001f;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.tableView.frame.size.width, 1.0f)];
    UIView *borderView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0, tableView.frame.size.width, 1.0f)];
    borderView.backgroundColor = [UIColor clearColor];
    [footerView addSubview:borderView];
    return footerView;
}

//- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
//    if (!self.didGetOriginalTableViewHeight || !self.didGetOriginalHeight) {
//        return;
//    }
//    
//    if ([keyPath isEqualToString:@"contentSize"]) {
//        CGRect viewFrame = self.view.frame;
//        if (self.tableView.contentSize.height >= self.originalTableViewHeight) {
//            viewFrame.size.height = self.originalHeight;
//        } else {
//            CGFloat differenceInHeight = self.originalTableViewHeight - self.tableView.contentSize.height;
//            viewFrame.size.height = self.originalHeight - differenceInHeight;
//        }
//        self.view.frame = viewFrame;
//    }
//}

@end
