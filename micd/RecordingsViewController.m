#import "RecordingsViewController.h"
#import "UIColor+Palette.h"
#import "DataSourceController.h"
#import "Recording.h"
#import "WireTapStyleKit.h"
#import "RecordingCell.h"
#import "RecordingsSection.h"
#import "FakesForProject.h"
#import "SCWaveformView.h"
#import "RecordingCellModel.h"
#import "DisplayLinkController.h"
#import "RecordingsView.h"

@interface RecordingsViewController () <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIImageView *tableBottomBorder;

@property (weak, nonatomic) IBOutlet UIView *playbackView;
@property (weak, nonatomic) IBOutlet UILabel *playbackTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *currentPlaybackTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalPlaybackTimeLabel;

@property (weak, nonatomic) IBOutlet UIButton *playButton;
@property (weak, nonatomic) IBOutlet UIButton *rewindButton;
@property (weak, nonatomic) IBOutlet UIButton *forwardButton;
@property (weak, nonatomic) IBOutlet UIButton *editButton;
@property (weak, nonatomic) IBOutlet UIButton *shareButton;

@property (strong, nonatomic) PlayerController *playerController;
@property (weak, nonatomic) IBOutlet UIView *waveformContainerView;
@property (strong, nonatomic) SCWaveformView *waveformView;
@property (strong, nonatomic) UIImageView *progressTimeIndicatorView;

@property (strong, nonatomic) Recording *playbackRecording;
@property (strong, nonatomic) DataSourceController *dataSource;
@property (strong, nonatomic) NSArray *sections;

@property (assign, nonatomic) BOOL didGetOriginalHeight;
@property (assign, nonatomic) CGFloat originalHeight;
@property (assign, nonatomic) BOOL didGetOriginalTableViewHeight;
@property (assign, nonatomic) CGFloat originalTableViewHeight;

@property (strong, nonatomic) DisplayLinkController *displayLinkController;

@property (assign, nonatomic) BOOL isFirstTimeLayingOutSubviews;

@property (assign, nonatomic) BOOL audioWasPlaying_gestureStateBegan;

@property (strong, nonatomic) RecordingCellModel *focusedCellModel;


@end

@implementation RecordingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dataSource = [DataSourceController sharedDataSource];
    self.playerController = [PlayerController sharedPlayer];
    
    self.isFirstTimeLayingOutSubviews = YES;
    
    [self.tableView setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.scrollsToTop = YES;
    self.tableView.scrollIndicatorInsets = UIEdgeInsetsMake(45, 0, 0, 0);
    
    self.currentPlaybackTimeLabel.textColor = [UIColor vibrantLightBlueText];
    self.playbackTitleLabel.textColor = [UIColor vibrantLightBlueText];
    self.totalPlaybackTimeLabel.textColor = [UIColor vibrantLightBlueText];
    
    [self.rewindButton setBackgroundImage:[WireTapStyleKit imageOfReverseDoubleArrow] forState:UIControlStateNormal];
    [self.forwardButton setBackgroundImage:[WireTapStyleKit imageOfForwardDoubleArrowWithAmountForward:@"30"] forState:UIControlStateNormal];
    [self.playButton setBackgroundImage:[WireTapStyleKit imageOfPlayButton] forState:UIControlStateNormal];
    self.rewindButton.backgroundColor = [UIColor clearColor];
    self.forwardButton.backgroundColor = [UIColor clearColor];
    self.playButton.backgroundColor = [UIColor clearColor];
    
    [self.editButton setTitle:@"" forState:UIControlStateNormal];
    [self.shareButton setTitle:@"" forState:UIControlStateNormal];
    [self.editButton setBackgroundImage:[WireTapStyleKit imageOfEditCircle] forState:UIControlStateNormal];
    [self.shareButton setBackgroundImage:[WireTapStyleKit imageOfShareButton] forState:UIControlStateNormal];
    
//    [self.tableView addObserver:self forKeyPath:@"contentSize" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:NULL];
    self.tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    self.displayLinkController = [[DisplayLinkController alloc] initWithTarget:self selector:@selector(handleDisplayLinkAnimation:)];
    [self.displayLinkController addDisplayLinkToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
    
    [self reloadData];
    
    if ([self mostRecentRecording]) {
        self.tableBottomBorder.hidden = NO;
        self.playbackView.hidden = NO;
    }
}

- (void)reloadData {
    self.sections = [RecordingsSection arrayOfSectionsForRecordings:self.dataSource.recordings ascending:NO];
    [self.tableView reloadData];
    if (self.tableBottomBorder.hidden == YES && self.dataSource.recordings.count) {
        self.tableBottomBorder.hidden = NO;
        self.playbackView.hidden = NO;
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
        self.waveformView.normalColor = [UIColor darkGrayColor];
        self.waveformView.progressColor = [UIColor vibrantBlue];
        self.waveformView.precision = 0.20;
        self.waveformView.lineWidthRatio = 0.6;
        self.waveformView.channelStartIndex = 0;
        self.waveformView.channelEndIndex = 0;
        
        CGRect frame = CGRectMake(self.waveformContainerView.frame.origin.x-22.0f, self.waveformContainerView.frame.origin.y, 44.0f, self.waveformView.frame.size.height);
        self.progressTimeIndicatorView = [[UIImageView alloc] initWithFrame:frame];
        [self.progressTimeIndicatorView setImage:[WireTapStyleKit imageOfProgressTimeIndicatorView]];
        self.progressTimeIndicatorView.userInteractionEnabled = YES;
        [self.playbackView addSubview:self.progressTimeIndicatorView];
        ((RecordingsView *)self.view).playerControlElements = @[self.progressTimeIndicatorView, self.playButton, self.rewindButton, self.forwardButton, self.shareButton, self.editButton];
        ((RecordingsView *)self.view).playbackContainerView = self.playbackView;
        
        [self readyPlayerWithRecording:[self mostRecentRecording]];
        
        UILongPressGestureRecognizer *gesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleWaveFormPanning:)];
        gesture.minimumPressDuration = 0.001f;
        [self.progressTimeIndicatorView addGestureRecognizer:gesture];
    }
    
    if (self.isFirstTimeLayingOutSubviews) {
        [self scrollToAndReadyPlayerWithMostRecentRecording];
        self.isFirstTimeLayingOutSubviews = NO;
    }
}

- (void)scrollToAndReadyPlayerWithMostRecentRecording {
    RecordingsSection *firstSection = self.sections.firstObject;
    if (firstSection) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
        [self.tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionNone animated:NO];
        RecordingCellModel *mostRecentCellModel = [firstSection cellModelAtIndex:0];
        self.focusedCellModel = mostRecentCellModel;
        
        [self readyPlayerWithRecording:self.focusedCellModel.recording];
        self.focusedCellModel.state = CellStatePaused;
    }
}

- (Recording *)mostRecentRecording {
    RecordingsSection *firstRecordingsSection = self.sections.lastObject;
    RecordingCellModel *lastAddedRecordingModel = [firstRecordingsSection cellModelAtIndex:0];
    return lastAddedRecordingModel.recording;
}

#pragma mark - FramesBasedOnStateProtocol

- (void)handleDisplayLinkAnimation:(CADisplayLink *)displayLink {
    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
        self.currentPlaybackTimeLabel.text = self.playerController.displayableCurrentTime;
        
        if (self.playerController.secondsCompleted == 0.0f) {
            Recording *recording = self.playerController.loadedRecording;
            self.waveformView.asset = recording.avAsset;
            self.waveformView.progressTime = CMTimeMakeWithSeconds(0, 1);
        } else {
            self.waveformView.progressTime = CMTimeMakeWithSeconds(self.playerController.secondsCompleted, 60);
        }
        
        CGFloat progressTimeCenterX = self.playerController.percentageCompleted * self.waveformContainerView.frame.size.width;
        self.progressTimeIndicatorView.center = CGPointMake(progressTimeCenterX+self.waveformContainerView.frame.origin.x, self.waveformContainerView.center.y);
    }];
}

- (void)setInitialStateFrame {
    CGRect screenSize = [[UIScreen mainScreen] bounds];
    self.view.frame = CGRectMake(0,
                                 (self.view.window.frame.size.height * 1.068f) * -1,
                                 self.view.window.frame.size.width,
                                 screenSize.size.height);
}

- (CGRect)frameForState:(PositionState)state {
    CGRect futureFrame = self.view.frame;
    switch (state) {
        case PositionStateHome:
            futureFrame.origin.y = (self.view.window.frame.size.height * -1.068f);
            break;
        case PositionStateRecordings:
            futureFrame.origin.y = 0;
            break;
        case PositionStateSettings:
            futureFrame.origin.y = (self.view.window.frame.size.height * -1.068f * 2);
            break;
        default:
            break;
    }
    return futureFrame;
}

- (void)adjustFrameBasedOnTranslation:(CGPoint)translation {
    CGRect frame = self.view.frame;
    frame.origin.y += translation.y;
    self.view.frame = frame;
}

#pragma mark - Player Buttons

- (IBAction)playPauseButtonPressed:(id)sender {
    if (self.playerState == PlayerControllerStatePaused) {
        [self playPlayback];
    } else {
        [self pausePlayback];
    }
}

- (IBAction)rewindButtonPressed:(id)sender {
    [self offsetPlaybackByTimeInterval:-15.0f];
}

- (IBAction)fastforwardButtonPressed:(id)sender {
    [self offsetPlaybackByTimeInterval:30.0f];
}

#pragma mark - PlayerController Methods

- (PlayerControllerState)playerState {
    return self.playerController.playerState;
}

- (void)readyPlayerWithRecording:(Recording *)recording {
    [self.playerController loadRecording:recording];
    self.playbackTitleLabel.text = recording.title;
    self.totalPlaybackTimeLabel.text = recording.lengthToDiplay;
    
    if (recording) {
        self.currentPlaybackTimeLabel.text = self.playerController.displayableCurrentTime;
        self.playbackRecording = recording;
        
        self.waveformContainerView.hidden = NO;
        self.waveformView.asset = recording.avAsset;
        CMTime recordingDuration = CMTimeMakeWithSeconds(recording.lengthAsTimeInterval, 10000);
        CMTimeRange displayedTimeRange = CMTimeRangeMake(kCMTimeZero, recordingDuration);
        self.waveformView.timeRange = displayedTimeRange;
        self.waveformView.normalColor = [UIColor grayColor];
        self.waveformView.progressTime = CMTimeMakeWithSeconds(0, 1);
    } else {
        self.waveformContainerView.hidden = YES;
        self.currentPlaybackTimeLabel.text = @"";
        self.tableBottomBorder.hidden = YES;
    }
}

- (void)playPlayback {
    //TODO: put player state into the player controller
    
    [self.playerController playAudio];
    [self.displayLinkController addSubscriberWithKey:@"waveform"];
}

- (void)pausePlayback {
    [self pausePlaybackWhilePanning:NO];
}

- (void)pausePlaybackWhilePanning:(BOOL)isPanning {
    [self.playerController pauseAudio];

    if (isPanning) {
        [self.displayLinkController addSubscriberWithKey:@"waveform"];
    } else {
        [self.displayLinkController removeSubscriberWithKey:@"waveform"];
    }
}

- (void)offsetPlaybackByTimeInterval:(NSTimeInterval)timeInterval {
    [self.playerController setPlaybackTimeInterval:self.playerController.secondsCompleted + timeInterval];
    [self handleDisplayLinkAnimation:nil];
}

- (void)handleWaveFormPanning:(UILongPressGestureRecognizer *)gesture {
    
    // pauses while panning and plays when touch ends
    switch (gesture.state) {
        case UIGestureRecognizerStateBegan:
            self.audioWasPlaying_gestureStateBegan = self.playerController.playerState == PlayerControllerStatePlaying;
            [self pausePlaybackWhilePanning:YES];
        case UIGestureRecognizerStateChanged: {
            CGPoint translation = [gesture locationInView:self.waveformView];
            float translationToWidthPercentage = translation.x / self.waveformView.bounds.size.width;
            NSTimeInterval secondsToTouchedLocation = translationToWidthPercentage * self.playerController.loadedRecording.lengthAsTimeInterval;
            [self.playerController setPlaybackTimeInterval:secondsToTouchedLocation];
            
            CGFloat progressTimeCenterX = translation.x;
            if (translation.x < 0) {
                progressTimeCenterX = 0;
            } else if (translation.x > self.waveformView.frame.size.width) {
                progressTimeCenterX = self.waveformView.frame.size.width;
            }
            
            self.progressTimeIndicatorView.center = CGPointMake(progressTimeCenterX+self.waveformContainerView.frame.origin.x, self.waveformContainerView.center.y);
        }
            break;
        case UIGestureRecognizerStateEnded:
            if (self.audioWasPlaying_gestureStateBegan && self.playerController.secondsCompleted != self.playerController.loadedRecording.lengthAsTimeInterval) {
                [self playPlayback];
            } else {
                [self pausePlaybackWhilePanning:NO];
            }
            
            [self handleDisplayLinkAnimation:nil];
        default:
            break;
    }
    
    // plays while scrubbing
    // -----handle issue when scrubbing on a track that is not playing (maybe only before or after track has played)
    // -----handle issue where audio ends while scrubbing
    // ---------- on panning state changed if moved less than 1 horizontally (maybe more/less) then pause otherwise play and set playback at current spot (also if really close to end of track then either pause or rely on the play command to restart the playing
//    if (gesture.state == UIGestureRecognizerStateBegan || gesture.state == UIGestureRecognizerStateChanged) {
//        CGPoint translation = [gesture locationInView:self.waveformView];
//        float translationToWidthPercentage = translation.x / self.waveformView.bounds.size.width;
//        NSTimeInterval secondsToTouchedLocation = translationToWidthPercentage * self.playerController.duration;
//        [self setPlaybackTimeTo:secondsToTouchedLocation];
//    }
}

#pragma mark - PlayerControllerDelegate

- (void)playerController:(PlayerController *)playerController didFinishPlayingSuccessfully:(BOOL)successful {
    self.focusedCellModel.state = CellStatePaused;
    
    [self.displayLinkController removeSubscriberWithKey:@"waveform"];
    self.waveformView.progressTime = CMTimeMakeWithSeconds(self.playbackRecording.lengthAsTimeInterval, 60);
    [self.waveformView setNeedsLayout];
}

- (NSIndexPath *)indexPathToSelectAfterDeletingIndexPath:(NSIndexPath *)indexPath sectionWasDeleted:(BOOL)isSectionDeleted {
    if (self.sections.count == 0) {
        return nil;
    }
    
    NSInteger nextSelectedSection;
    NSInteger nextSelectedRow;
    
    if (isSectionDeleted) {
        BOOL isSectionAfterDeletedSection = indexPath.section >= self.sections.count;
        
        if (isSectionAfterDeletedSection) {
            // select first object of next section
            nextSelectedSection = indexPath.section;
            nextSelectedRow = 0;
        } else {
            // else select last object of previous section
            nextSelectedSection = indexPath.section - 1;
            RecordingsSection *previousSection = self.sections[nextSelectedSection];
            nextSelectedRow = previousSection.numberOfCellModels - 1;
        }
    } else {
        RecordingsSection *currentSection = self.sections[indexPath.section];
        BOOL isRowAfterDeletedRow = indexPath.row >= currentSection.numberOfCellModels;
        
        if (isRowAfterDeletedRow) {
            // select next cell
            nextSelectedSection = indexPath.section;
            nextSelectedRow = indexPath.row;
        } else {
            BOOL isSectionAfterCurrentSection = indexPath.section >= self.sections.count - 1;
            
            if (isSectionAfterCurrentSection) {
                // else select first cell of next section
                nextSelectedSection = indexPath.section + 1;
                nextSelectedRow = 0;
            } else {
                // else select previous cell
                nextSelectedSection = indexPath.section;
                nextSelectedRow = indexPath.row - 1;
            }
        }
    }
    
    return [NSIndexPath indexPathForRow:nextSelectedRow inSection:nextSelectedSection];
}

#pragma mark - UITableViewDataSource && UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    RecordingsSection *recordingsSection = self.sections[indexPath.section];
    RecordingCellModel *recordingCellModel = [recordingsSection cellModelAtIndex:indexPath.row];
    
    if (self.focusedCellModel == recordingCellModel) {
        if (self.focusedCellModel.state == CellStatePlaying) {
            self.focusedCellModel.state = CellStatePaused;
            [self pausePlayback];
        } else {
            self.focusedCellModel.state = CellStatePlaying;
            [self playPlayback];
        }
    } else {
        self.focusedCellModel.state = CellStateDefault;
        self.focusedCellModel = recordingCellModel;
        
        [self readyPlayerWithRecording:self.focusedCellModel.recording];
        [self playPlayback];
        self.focusedCellModel.state = CellStatePlaying;
    }
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        RecordingsSection *editingRecordingsSection = self.sections[indexPath.section];
        RecordingCellModel *editingCellModel = [editingRecordingsSection cellModelAtIndex:indexPath.row];
        
        BOOL deletingSection = (editingRecordingsSection.numberOfCellModels <= 1);
        
        [self.dataSource deleteRecording:editingCellModel.recording];
        self.sections = [RecordingsSection arrayOfSectionsForRecordings:self.dataSource.recordings ascending:NO];
        
        if (deletingSection) {
            [tableView deleteSections:[NSIndexSet indexSetWithIndex:indexPath.section] withRowAnimation:UITableViewRowAnimationAutomatic];
        } else {
            [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
        }
        
        if ([editingCellModel.recording.uuid.UUIDString isEqualToString:self.playerController.loadedRecording.uuid.UUIDString]) {
            NSIndexPath *nextToLoadIndexPath = [self indexPathToSelectAfterDeletingIndexPath:indexPath sectionWasDeleted:deletingSection];
            if (nextToLoadIndexPath != nil) {
                RecordingsSection *toLoadSection = self.sections[nextToLoadIndexPath.section];
                self.focusedCellModel = [toLoadSection cellModelAtIndex:nextToLoadIndexPath.row];
                
                self.focusedCellModel.state = CellStatePaused;
                [self readyPlayerWithRecording:self.focusedCellModel.recording];
            }
        }
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
    return 44;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    RecordingsSection *recordingsSection = self.sections[section];
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.tableView.frame.size.width, 44.0f)];
    
    UIView *bottomBorderView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 42.0f, tableView.frame.size.width, 2.0f)];
    bottomBorderView.backgroundColor = [UIColor vibrantBlue];
    [headerView addSubview:bottomBorderView];
    
    UILabel *headerTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 17, self.tableView.frame.size.width-7.0f, 20.0f)];
    headerTitleLabel.text = recordingsSection.dateAsString;
    headerTitleLabel.font = [UIFont fontWithName: @"HelveticaNeue-Medium" size:16.0f]; //AvenirNext-Regular
    headerTitleLabel.textAlignment = NSTextAlignmentRight;
    headerTitleLabel.textColor = [UIColor vibrantLightBlue];
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

// ----- use for resizing the tableview -----

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
