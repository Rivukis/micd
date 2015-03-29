#import "RecordingsViewController.h"
#import "UIColor+Palette.h"
#import "DataSourceController.h"
#import "Recording.h"
#import "WireTapStyleKit.h"
#import "MicdStyleKit.h"
#import "RecordingCell.h"
#import "RecordingsSection.h"
#import "FakesForProject.h"
//#import "SCWaveformView.h"
#import "ProgressBarView.h"
#import "RecordingCellModel.h"
#import "DisplayLinkController.h"
#import "RecordingsView.h"
#import "ViewAnimator.h"
#import "NSObject+Blocks.h"
#import "PresentingAnimationController.h"
#import "DismissingAnimationController.h"
#import "Constants.h"
#import "Factory.h"

@interface RecordingsViewController () <UITableViewDataSource, UITableViewDelegate, PlayerControllerDelegate, UIGestureRecognizerDelegate, RecordingCellModelDelegate, RecordingCellDelegate>

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
//@property (strong, nonatomic) SCWaveformView *waveformView;
@property (strong, nonatomic) UIImageView *progressTimeIndicatorView;
//@property (strong, nonatomic) ProgressBarView *progressBar;
@property (weak, nonatomic) IBOutlet UIView *progressBar;
@property (weak, nonatomic) IBOutlet UIImageView *progressBarBorder;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *progressBarWidth;

@property (strong, nonatomic) Recording *playbackRecording;
@property (strong, nonatomic) DataSourceController *dataSource;
@property (strong, nonatomic) NSMutableArray *sections;

//@property (assign, nonatomic) BOOL didGetOriginalHeight;
//@property (assign, nonatomic) CGFloat originalHeight;
//@property (assign, nonatomic) BOOL didGetOriginalTableViewHeight;
//@property (assign, nonatomic) CGFloat originalTableViewHeight;

@property (strong, nonatomic) DisplayLinkController *displayLinkController;

@property (assign, nonatomic) BOOL isFirstTimeLayingOutSubviews;

@property (assign, nonatomic) BOOL audioWasPlaying_gestureStateBegan;

@property (strong, nonatomic) NSIndexPath *focusedCellIndexPath;
@property (strong, nonatomic) RecordingCell *editingCell;
@property (strong, nonatomic, readonly) RecordingCellModel *focusedCellModel;

@property (strong, nonatomic) UIVisualEffectView *blurView;

@end

@implementation RecordingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dataSource = [DataSourceController sharedDataSource];
    self.playerController = [PlayerController sharedPlayer];
    self.playerController.delegate = self;
    
    self.isFirstTimeLayingOutSubviews = YES;
    
    [self.tableView setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.scrollsToTop = YES;
    self.tableView.scrollIndicatorInsets = UIEdgeInsetsMake(45, 0, 0, 0);
    self.tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    //    [self.tableView addObserver:self forKeyPath:@"contentSize" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:NULL];
    
    self.currentPlaybackTimeLabel.textColor = [UIColor vibrantLightBlueText];
    self.playbackTitleLabel.textColor = [UIColor vibrantLightBlueText];
    self.totalPlaybackTimeLabel.textColor = [UIColor vibrantLightBlueText];
    
    self.playButton.backgroundColor = [UIColor clearColor];
    self.playButton.hidden = YES;
    self.rewindButton.backgroundColor = [UIColor clearColor];
    self.rewindButton.hidden = YES;
    self.forwardButton.backgroundColor = [UIColor clearColor];
    self.forwardButton.hidden = YES;
    [self.playButton setBackgroundImage:[WireTapStyleKit imageOfPlayButton] forState:UIControlStateNormal];
    [self.rewindButton setBackgroundImage:[WireTapStyleKit imageOfReverseDoubleArrow] forState:UIControlStateNormal];
    [self.forwardButton setBackgroundImage:[WireTapStyleKit imageOfForwardDoubleArrowWithAmountForward:@"30"] forState:UIControlStateNormal];
    
    [self.editButton setTitle:@"" forState:UIControlStateNormal];
    [self.editButton setBackgroundImage:[WireTapStyleKit imageOfEditCircle] forState:UIControlStateNormal];
    [self.shareButton setTitle:@"" forState:UIControlStateNormal];
    [self.shareButton setBackgroundImage:[WireTapStyleKit imageOfShareButton] forState:UIControlStateNormal];
    // gonna hide and disable these buttons until were ready to use them
    self.shareButton.hidden = YES;
    self.editButton.hidden = YES;
    self.shareButton.userInteractionEnabled = NO;
    self.editButton.userInteractionEnabled = NO;
    
    self.displayLinkController = [[DisplayLinkController alloc] initWithTarget:self selector:@selector(handleDisplayLinkAnimation:)];
    [self.displayLinkController addDisplayLinkToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];

    UILongPressGestureRecognizer *titleTapDetector = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(detectTitleTapped:)];
    titleTapDetector.minimumPressDuration = 0.0001;
    titleTapDetector.delegate = self;
    [self.playbackTitleLabel addGestureRecognizer:titleTapDetector];
    self.playbackTitleLabel.userInteractionEnabled = YES;
    
    CGRect frame = CGRectMake(self.progressBarBorder.frame.origin.x-22.0f, self.progressBarBorder.frame.origin.y-15, 44.0f, self.progressBarBorder.frame.size.height+30);
    self.progressTimeIndicatorView = [[UIImageView alloc] initWithFrame:frame];
    self.progressTimeIndicatorView.userInteractionEnabled = YES;
    
    self.sections = [[Factory arrayOfSectionsForRecordings:self.dataSource.recordings ascending:NO cellModelDelegate:self] mutableCopy];
    [self reloadDataWithNewRecording:nil];
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];

    self.tableBottomBorder.backgroundColor = [UIColor vibrantBlue];
    
//    if (!self.didGetOriginalHeight) {
//        self.didGetOriginalHeight = YES;
//        self.originalHeight = self.view.frame.size.height;
//    }
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    if (self.isFirstTimeLayingOutSubviews) {
        [self.playbackView addSubview:self.progressTimeIndicatorView];
        [self scrollToAndReadyPlayerWithMostRecentRecording];
        
        ((RecordingsView *)self.view).playerControlElements = @[self.progressTimeIndicatorView, self.playButton, self.rewindButton, self.forwardButton, self.shareButton, self.editButton, self.playbackTitleLabel];
        ((RecordingsView *)self.view).playbackContainerView = self.playbackView;
        
        RecordingCellModel *mostRecentRecordingCellModel = [self mostRecentRecordingCellModel];
        [self readyPlayerWithRecording:mostRecentRecordingCellModel.recording];
        
        UILongPressGestureRecognizer *gesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleWaveFormPanning:)];
        gesture.minimumPressDuration = 0.001f;
        [self.progressTimeIndicatorView addGestureRecognizer:gesture];
        self.isFirstTimeLayingOutSubviews = NO;
        
//        self.progressBarImageView.image = [MicdStyleKit imageOfProgressBarWithFrame:self.progressBarImageView.frame progressWidth:0];
        self.progressBarBorder.image = [MicdStyleKit imageOfProgressBar];
        self.progressBar.backgroundColor = [UIColor vibrantBlue];
        self.progressBarWidth.constant = 0;
    }
}

- (void)reloadDataWithNewRecording:(Recording *)recording {
    self.progressBarWidth.constant = 0;
    
    if (self.focusedCellIndexPath) {
        [self.focusedCellModel setCellState:CellStateDefault];
        self.focusedCellIndexPath = nil;
    }
    RecordingsSection *firstSection = self.sections.firstObject;
    BOOL firstSectionIsToday = firstSection.isToday;
    if (recording != nil) {
        if (firstSectionIsToday) {
            [firstSection addToTodaySectionNewRecording:recording withCellModelDelegate:self];
            [self.tableView insertRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:0 inSection:0]] withRowAnimation:UITableViewRowAnimationAutomatic];
        } else {
            RecordingsSection *todaySection = [[Factory arrayOfSectionsForRecordings:@[recording]
                                                                           ascending:NO
                                                                   cellModelDelegate:self] firstObject];
            [self.sections insertObject:todaySection atIndex:0];
            [self.tableView insertSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationAutomatic];
        }
    } else {
        [self.tableView reloadData];
    }
    if (self.playbackView.hidden == YES && self.dataSource.recordings.count) {
        self.tableBottomBorder.hidden = NO;
        self.playbackView.hidden = NO;
    }
    if (recording != nil) {
        [self scrollToAndReadyPlayerWithMostRecentRecording];
    }
}

- (void)scrollToAndReadyPlayerWithMostRecentRecording {
    if (self.sections.count == 0) return;
    
    self.focusedCellIndexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView scrollToRowAtIndexPath:self.focusedCellIndexPath atScrollPosition:UITableViewScrollPositionNone animated:NO];
    [self readyPlayerWithRecording:self.focusedCellModel.recording];
    [self.focusedCellModel setCellState:CellStatePaused];
}

- (RecordingCellModel *)mostRecentRecordingCellModel {
    RecordingCellModel *mostRecentCellModel = nil;
    RecordingsSection *firstSection = self.sections.firstObject;
    if (firstSection) {
        mostRecentCellModel = [firstSection cellModelAtIndex:0];
    }
    return mostRecentCellModel;
}

- (RecordingCellModel *)cellModelAtIndexPath:(NSIndexPath *)indexPath {
    if (self.sections.count == 0) return nil;
    
    RecordingsSection *section = self.sections[self.focusedCellIndexPath.section];
    RecordingCellModel *cellModel = [section cellModelAtIndex:self.focusedCellIndexPath.row];
    return cellModel;
}

- (RecordingCellModel *)focusedCellModel {
    if (self.focusedCellIndexPath) {
        return [self cellModelAtIndexPath:self.focusedCellIndexPath];
    }
    return nil;
}

#pragma mark - RecordingCellDelegate

- (void)cellDidBecomeFirstResponer:(RecordingCell *)cell {
    self.editingCell = cell;
}

#pragma mark - RecordingCellModelDelegate

- (void)cellModel:(RecordingCellModel *)cellModel shouldChangeRecordingTitle:(NSString *)title {
    if (title.length > 0 && ![cellModel.recording.title isEqualToString:title]) {
        cellModel.recording.title = title;
        [self.dataSource saveData];
        if (cellModel == self.focusedCellModel) {
            [self setplaybackTitleLabelText:title];
        }
    }
}

#pragma mark - FramesBasedOnStateProtocol

- (void)handleDisplayLinkAnimation:(CADisplayLink *)displayLink {
    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
        self.currentPlaybackTimeLabel.text = self.playerController.displayableCurrentTime;
        
        self.progressBarWidth.constant = self.playerController.percentageCompleted * self.progressBarBorder.frame.size.width;
        
        CGFloat progressTimeCenterX = self.playerController.percentageCompleted * self.progressBarBorder.frame.size.width;
        self.progressTimeIndicatorView.center = CGPointMake(progressTimeCenterX+self.progressBarBorder.frame.origin.x, self.progressBarBorder.center.y);
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
        [self playPlaybackShouldAnimatePlayButton:YES];
    } else {
        [self pausePlaybackShouldAnimatePauseButton:YES];
    }
}

- (void)playPlaybackShouldAnimatePlayButton:(BOOL)shouldAnimatePlayButton {
    [self.playerController playAudio];
    [self.playButton setBackgroundImage:[WireTapStyleKit imageOfPauseButton] forState:UIControlStateNormal];
    [self.focusedCellModel setCellState:CellStatePlaying];
    [self.displayLinkController addSubscriberWithKey:@"waveform"];
    if (shouldAnimatePlayButton) {
        [self addButtonBounceAnimationToView:self.playButton];
    }
}

- (void)pausePlaybackShouldAnimatePauseButton:(BOOL)shouldAnimatePauseButton {
    [self pausePlaybackShouldAnimate:NO];
    [self.playButton setBackgroundImage:[WireTapStyleKit imageOfPlayButton] forState:UIControlStateNormal];
    [self.focusedCellModel setCellState:CellStatePaused];
    if (shouldAnimatePauseButton) {
        [self addButtonBounceAnimationToView:self.playButton];
    }
}

- (IBAction)rewindButtonPressed:(id)sender {
    [self offsetPlaybackByTimeInterval:-15.0f];
    [self addButtonBounceAnimationToView:self.rewindButton];
}

- (IBAction)fastforwardButtonPressed:(id)sender {
    [self offsetPlaybackByTimeInterval:30.0f];
    [self addButtonBounceAnimationToView:self.forwardButton];
}

- (IBAction)shareButtonPressed:(id)sender {
    [self addButtonBounceAnimationToView:self.shareButton];
}

- (IBAction)editButtonPressed:(id)sender {
    [self addButtonBounceAnimationToView:self.editButton];
}

- (void)showPlayerButtons {
    if (self.playButton.hidden == YES) {
        [self performBlock:^{
            [self showAndAddSpringAnimationToButton:self.playButton];
        } afterDelay:.2];
        
        [self performBlock:^{
            [self showAndAddSpringAnimationToButton:self.rewindButton];
        } afterDelay:.25];
        
        [self performBlock:^{
            [self showAndAddSpringAnimationToButton:self.forwardButton];
        } afterDelay:.25];
    }
}

- (void)hidePlayerButtons {
    self.playButton.hidden = YES;
    self.rewindButton.hidden = YES;
    self.forwardButton.hidden = YES;
}

- (void)addButtonBounceAnimationToView:(UIView *)view {
//    [view pop_removeAnimationForKey:@"buttonBounce"];
    view.transform = CGAffineTransformIdentity;
    POPSpringAnimation *buttonPressedAnimation = [ViewAnimator springAnimationBounce];
    [view pop_addAnimation:buttonPressedAnimation forKey:@"buttonBounce"];
}

- (void)showAndAddSpringAnimationToButton:(UIButton *)button {
    button.hidden = NO;
    button.transform = CGAffineTransformIdentity;
    POPSpringAnimation *showButtonAnimation = [ViewAnimator springAnimationGrowFromNothing];
    [button pop_addAnimation:showButtonAnimation forKey:@"showButton"];
}

- (void)detectTitleTapped:(UILongPressGestureRecognizer *)gestureRecognizer {
    [self.tableView scrollToRowAtIndexPath:self.focusedCellIndexPath atScrollPosition:UITableViewScrollPositionMiddle animated:YES];
}

#pragma mark - PlayerController Methods

- (PlayerControllerState)playerState {
    return self.playerController.playerState;
}

- (void)readyPlayerWithRecording:(Recording *)recording {
    if (recording) {
        [self setplaybackTitleLabelText:recording.title];
        self.totalPlaybackTimeLabel.text = recording.lengthToDiplay;
        self.currentPlaybackTimeLabel.text = self.playerController.displayableCurrentTime;
        self.playbackRecording = recording;
        [self.playerController loadRecording:recording];
        
//        CMTime recordingDuration = CMTimeMakeWithSeconds(recording.lengthAsTimeInterval, 10000);
//        CMTimeRange displayedTimeRange = CMTimeRangeMake(kCMTimeZero, recordingDuration);
//        self.waveformView.timeRange = displayedTimeRange;
//        self.waveformView.progressTime = CMTimeMakeWithSeconds(0, 1);
        
//        __weak __typeof(self) welf = self;
//        NSOperationQueue *queue = [[NSOperationQueue alloc] init];
//        NSOperation *operation = [NSBlockOperation blockOperationWithBlock:^{
//            welf.waveformView.asset = recording.avAsset;
//        }];
//        [queue addOperation:operation];
        
        self.tableBottomBorder.hidden = NO;
        self.playbackView.hidden = NO;
    } else {
        self.tableBottomBorder.hidden = YES;
        self.playbackView.hidden = YES;
    }
}

- (void)setplaybackTitleLabelText:(NSString *)title {
    if (title.length > 0) {
        self.playbackTitleLabel.text = title;
    } else {
        self.playbackTitleLabel.text = self.focusedCellModel.recording.dateAsString;
    }
}

- (void)pausePlaybackShouldAnimate:(BOOL)isPanning {
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
            [self pausePlaybackShouldAnimate:NO];
        case UIGestureRecognizerStateChanged: {
            CGPoint translation = [gesture locationInView:self.progressBarBorder];
            float translationToWidthPercentage = translation.x / self.progressBarBorder.bounds.size.width;
            NSTimeInterval secondsToTouchedLocation = translationToWidthPercentage * self.playerController.loadedRecording.lengthAsTimeInterval;
            [self.playerController setPlaybackTimeInterval:secondsToTouchedLocation];
            
            CGFloat progressTimeCenterX = translation.x;
            if (translation.x < 0) {
                progressTimeCenterX = 0;
            } else if (translation.x > self.progressBarBorder.frame.size.width) {
                progressTimeCenterX = self.progressBarBorder.frame.size.width;
            }
            
            self.progressBarWidth.constant = self.playerController.percentageCompleted * self.progressBarBorder.frame.size.width;

            self.progressTimeIndicatorView.center = CGPointMake(progressTimeCenterX+self.progressBarBorder.frame.origin.x, self.progressBarBorder.center.y);
            
            self.currentPlaybackTimeLabel.text = self.playerController.displayableCurrentTime;
        }
            break;
        case UIGestureRecognizerStateEnded: {
            
            BOOL endOfRecordingReached = self.playerController.secondsCompleted == self.playerController.loadedRecording.lengthAsTimeInterval;
            if (self.audioWasPlaying_gestureStateBegan && endOfRecordingReached) {
                [self pausePlaybackShouldAnimatePauseButton:YES];
            } else if (self.audioWasPlaying_gestureStateBegan && !endOfRecordingReached) {
                [self playPlaybackShouldAnimatePlayButton:NO];
            } else if (!self.audioWasPlaying_gestureStateBegan && endOfRecordingReached) {
                [self pausePlaybackShouldAnimatePauseButton:NO];
            }
            
            [self handleDisplayLinkAnimation:nil];
        }
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
    [self.focusedCellModel setCellState:CellStatePaused];
    
    [self.displayLinkController removeSubscriberWithKey:@"waveform"];
//    self.waveformView.progressTime = CMTimeMakeWithSeconds(self.playbackRecording.lengthAsTimeInterval, 60);
    [self pausePlaybackShouldAnimatePauseButton:YES];
//    [self.waveformView setNeedsLayout];
}

- (NSIndexPath *)indexPathToSelectAfterDeletingIndexPath:(NSIndexPath *)indexPath sectionWasDeleted:(BOOL)isSectionDeleted {
    if (self.sections.count == 0) {
        return nil;
    } else {
        return [NSIndexPath indexPathForRow:0 inSection:0];
    }
    
    // NEEDS REWORK!!!!!
//    NSInteger nextSelectedSection;
//    NSInteger nextSelectedRow;
//    
//    if (isSectionDeleted) {
//        BOOL isSectionAfterDeletedSection = indexPath.section <= self.sections.count - 1;
//        
//        if (isSectionAfterDeletedSection) {
//            // select first object of next section
//            nextSelectedSection = indexPath.section;
//            nextSelectedRow = 0;
//        } else {
//            // else select last object of previous section
//            nextSelectedSection = indexPath.section - 1;
//            RecordingsSection *previousSection = self.sections[nextSelectedSection];
//            nextSelectedRow = previousSection.numberOfCellModels - 1;
//        }
//    } else {
//        RecordingsSection *currentSection = self.sections[indexPath.section];
//        
//        BOOL isCellAboveInCurrentSection = indexPath.row != 0;
//        
//        if (isCellAboveInCurrentSection) {
//            // select cell above deleted cell
//        }
//        
//        
//        
//        
//        
//        
//        
//        BOOL isRowAfterDeletedRow = indexPath.row >= currentSection.numberOfCellModels;
//        
//        if (isRowAfterDeletedRow) {
//            // select next cell
//            nextSelectedSection = indexPath.section;
//            nextSelectedRow = indexPath.row;
//        } else {
//            BOOL isSectionAfterCurrentSection = indexPath.section >= self.sections.count - 1;
//            
//            if (isSectionAfterCurrentSection) {
//                // else select first cell of next section
//                nextSelectedSection = indexPath.section + 1;
//                nextSelectedRow = 0;
//            } else {
//                // else select previous cell
//                nextSelectedSection = indexPath.section;
//                nextSelectedRow = indexPath.row - 1;
//            }
//        }
//    }
//    
//    return [NSIndexPath indexPathForRow:nextSelectedRow inSection:nextSelectedSection];
}

#pragma mark - UITableViewDataSource && UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    RecordingsSection *recordingsSection = self.sections[indexPath.section];
    RecordingCellModel *recordingCellModel = [recordingsSection cellModelAtIndex:indexPath.row];
    
    if (self.editingCell) {
        if (self.editingCell.cellModel == recordingCellModel) {
            return;
        } else {
            [self.editingCell resignFirstResponder];
            self.editingCell = nil;
        }
    } else {
        if (self.focusedCellModel == recordingCellModel) {
            if (self.focusedCellModel.state == CellStatePlaying) {
                [self pausePlaybackShouldAnimatePauseButton:YES];
            } else {
                [self playPlaybackShouldAnimatePlayButton:YES];
            }
        } else {
            [self.focusedCellModel setCellState:CellStateDefault];
            self.focusedCellIndexPath = indexPath;
            
            [self readyPlayerWithRecording:self.focusedCellModel.recording];
            [self playPlaybackShouldAnimatePlayButton:YES];
        }
    }
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        RecordingsSection *editingRecordingsSection = self.sections[indexPath.section];
        RecordingCellModel *editingCellModel = [editingRecordingsSection cellModelAtIndex:indexPath.row];
        [self.dataSource deleteRecording:editingCellModel.recording];
        
        BOOL deletingSection = (editingRecordingsSection.numberOfCellModels <= 1);
        if (deletingSection) {
            [self.sections removeObjectAtIndex:indexPath.section];
            [tableView deleteSections:[NSIndexSet indexSetWithIndex:indexPath.section] withRowAnimation:UITableViewRowAnimationAutomatic];
        } else {
            RecordingsSection *section = self.sections[indexPath.section];
            [section deleteRecordingCellModelAtIndex:indexPath.row];
            [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
        }
        
        if ([editingCellModel.recording.uuid.UUIDString isEqualToString:self.playerController.loadedRecording.uuid.UUIDString]) {
            NSIndexPath *nextToLoadIndexPath = [self indexPathToSelectAfterDeletingIndexPath:indexPath sectionWasDeleted:deletingSection];
            self.focusedCellIndexPath = nextToLoadIndexPath;
            [self.focusedCellModel setCellState:CellStatePaused];
            [self readyPlayerWithRecording:self.focusedCellModel.recording];
        }
    }
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewCellEditingStyleDelete;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    RecordingsSection *recordingsSection = self.sections[indexPath.section];
    RecordingCellModel *cellModel = [recordingsSection cellModelAtIndex:indexPath.row];
    return [cellModel heightForState];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    RecordingCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    RecordingsSection *recordingsSection = self.sections[indexPath.section];
    RecordingCellModel *recordingCellModel = [recordingsSection cellModelAtIndex:indexPath.row];
    cell.delegate = self;
    [cell bindToModel:recordingCellModel];
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    RecordingsSection *recordingsSection = self.sections[section];
    return [recordingsSection numberOfCellModels];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
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
