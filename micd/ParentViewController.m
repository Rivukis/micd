#import "ParentViewController.h"
#import "RecordingsViewController.h"
#import "HomeViewController.h"
#import "FramesController.h"
#import "WireTapStyleKit.h"
#import "UIColor+Palette.h"
#import "DataSourceController.h"
#import "Recording.h"
#import "ViewAnimator.h"

@interface ParentViewController () <FramesBasedOnStateProtocol, MovementDelegate, AddNewRecordingDelegate, PlayerControlsDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *micdBackgroundView;
@property (strong, nonatomic) RecordingsViewController *recordingsViewController;
@property (strong, nonatomic) HomeViewController *homeViewController;
@property (strong, nonatomic) DataSourceController *dataSource;

@property (weak, nonatomic) IBOutlet UIButton *rewindButton;
@property (weak, nonatomic) IBOutlet UIButton *forwardButton;
@property (weak, nonatomic) IBOutlet UIButton *playPauseButton;
@property (weak, nonatomic) IBOutlet UISlider *volumeSlider;

@property (assign, nonatomic) BOOL didSetInitialFrames;

@property (strong, nonatomic) ViewAnimator *viewAnimator;

@end

@implementation ParentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dataSource = [DataSourceController sharedDataSource];
    
    self.micdBackgroundView.image = [WireTapStyleKit imageOfMicdBackground];
    self.view.backgroundColor = [UIColor blackColor];
    self.rewindButton.backgroundColor = [UIColor clearColor];
    self.forwardButton.backgroundColor = [UIColor clearColor];
    self.playPauseButton.backgroundColor = [UIColor clearColor];
    
    self.homeViewController = [self.storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([HomeViewController class])];
    [self addChildViewController:self.homeViewController];
    [self.view addSubview:self.homeViewController.view];
    [self.homeViewController didMoveToParentViewController:self];
    self.homeViewController.movementDelegate = self;
    self.homeViewController.addNewRecordingDelegate = self;
    
    self.recordingsViewController = [self.storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([RecordingsViewController class])];
    [self addChildViewController:self.recordingsViewController];
    [self.view addSubview:self.recordingsViewController.view];
    [self.recordingsViewController didMoveToParentViewController:self];
    self.recordingsViewController.playerControlsDelegate = self;
    
    [self.rewindButton setBackgroundImage:[WireTapStyleKit imageOfReverseDoubleArrow] forState:UIControlStateNormal];
    [self.forwardButton setBackgroundImage:[WireTapStyleKit imageOfForwardDoubleArrowWithAmountForward:@"30"] forState:UIControlStateNormal];
    [self.playPauseButton setBackgroundImage:[WireTapStyleKit imageOfPlayButton] forState:UIControlStateNormal];
    [self.volumeSlider setThumbImage:[WireTapStyleKit imageOfThumbImage] forState:UIControlStateNormal];
    self.volumeSlider.minimumTrackTintColor = [UIColor vibrantBlue];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    if (!self.didSetInitialFrames) {
        [self setInitialStateFrame];
        self.didSetInitialFrames = YES;
    }
}

#pragma mark - Player Controls

- (IBAction)playPauseButtonPressed:(id)sender {
    if (self.recordingsViewController.playerState == PlayerControllerStatePaused) {
        [self.recordingsViewController playPlayback];
    } else {
        [self.recordingsViewController pausePlayback];
    }
}

- (IBAction)rewindButtonPressed:(id)sender {
    [self.recordingsViewController offsetPlaybackByTimeInterval:-15.0f];
}

- (IBAction)fastforwardButtonPressed:(id)sender {
    [self.recordingsViewController offsetPlaybackByTimeInterval:30.0f];
}

#pragma mark - PlayerControlsDelegate

- (void)shouldUpdatePLayPauseButtonForPlayState {
    [self.playPauseButton setBackgroundImage:[WireTapStyleKit imageOfPauseButton] forState:UIControlStateNormal];
}

- (void)shouldUpdatePLayPauseButtonForPauseState {
    [self.playPauseButton setBackgroundImage:[WireTapStyleKit imageOfPlayButton] forState:UIControlStateNormal];
}

#pragma mark - AddNewRecordingDelegate

- (void)addNewRecording:(Recording *)recording {
    [self.dataSource saveRecording:recording];
    [self.recordingsViewController reloadData];
    [self.recordingsViewController scrollToMostRecentRecording];
}

#pragma mark - MovementDelegate

- (void)shouldMoveWithTranslation:(CGPoint)translation {
    [self adjustFrameBasedOnTranslation:translation];
}

- (void)shouldMoveToPositionState:(PositionState)state {
    [self.homeViewController animateGearsSpinning];
    
    for (UIViewController<FramesBasedOnStateProtocol> *viewController in [self childVCs]) {
        CGRect fromFrame = viewController.view.frame;
        CGRect toFrame = [viewController frameForState:state];
        POPSpringAnimation *animation = [ViewAnimator springAnimationFromFrameTo:fromFrame toFrame:toFrame];
        [viewController.view pop_addAnimation:animation forKey:@"state"];
        
        [animation setCompletionBlock:^(POPAnimation *animation, BOOL finished) {
            for (UIViewController *viewController in [self childVCs]) {
                if ([viewController respondsToSelector:@selector(popAnimationCompleted)]) {
                    [(id)viewController popAnimationCompleted];
                }
            }
        }];
    }
}

#pragma mark - FramesBasedOnStateProtocol

- (void)setInitialStateFrame {
    [self.homeViewController setInitialStateFrame];
    [self.recordingsViewController setInitialStateFrame];
}

- (void)adjustFrameBasedOnTranslation:(CGPoint)translation {
    [self.homeViewController adjustFrameBasedOnTranslation:translation];
    [self.recordingsViewController adjustFrameBasedOnTranslation:translation];
}

- (NSArray *)childVCs {
    return @[self.homeViewController, self.recordingsViewController];
}

@end

