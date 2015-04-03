#import "ParentViewController.h"
#import "RecordingsViewController.h"
#import "HomeViewController.h"
#import "SettingsViewController.h"
#import "FramesController.h"
#import "WireTapStyleKit.h"
#import "UIColor+Palette.h"
#import "DataSourceController.h"
#import "Recording.h"
#import "PopViewAnimator.h"
#import "Constants.h"

@interface ParentViewController () <FramesBasedOnStateProtocol, MovementDelegate, AddNewRecordingDelegate, GoToNoRecordingStateDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *micdBackgroundView;
@property (nonatomic) CGRect micdBackgroundOriginalFrame;
@property (strong, nonatomic) RecordingsViewController *recordingsViewController;
@property (strong, nonatomic) HomeViewController *homeViewController;
@property (strong, nonatomic) SettingsViewController *settingsViewController;
@property (strong, nonatomic) DataSourceController *dataSource;

@property (assign, nonatomic) BOOL didSetInitialFrames;

@property (strong, nonatomic) PopViewAnimator *viewAnimator;

@end

@implementation ParentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dataSource = [DataSourceController sharedDataSource];
    
    self.micdBackgroundView.image = [WireTapStyleKit imageOfMicdBackground];
    self.view.backgroundColor = [UIColor blackColor];
    
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
    self.recordingsViewController.noRecordingStateDelegate = self;
    
    self.settingsViewController = [self.storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([SettingsViewController class])];
    [self addChildViewController:self.settingsViewController];
    [self.view addSubview:self.settingsViewController.view];
    [self.settingsViewController didMoveToParentViewController:self];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    if (!self.didSetInitialFrames) {
        [self setInitialStateFrame];
        self.didSetInitialFrames = YES;
    }
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - AddNewRecordingDelegate

- (void)addNewRecording:(Recording *)recording {
    [self.dataSource saveRecording:recording];
    [self.recordingsViewController reloadDataWithNewRecording:recording];
}

#pragma mark - GoToNoRecordingStateDelegate

- (void)goToNoRecordingState {
    [self moveToPositionState:PositionStateHome];
    [self.homeViewController goToNoRecordingState];
}

#pragma mark - MovementDelegate && Movement Helper Methods

- (void)moveWithTranslation:(CGPoint)translation {
    [self adjustFrameBasedOnTranslation:translation];
}

- (void)moveToPositionState:(PositionState)state {
    [self.homeViewController animateGearsSpinning];
    CGRect fromFrame = self.micdBackgroundView.frame;
    CGRect toFrame = [self frameForState:state];
    POPSpringAnimation *animation = [PopViewAnimator springAnimationFromFrameTo:fromFrame toFrame:toFrame];
    [self.micdBackgroundView pop_addAnimation:animation forKey:@"state"];
    
    for (UIViewController<FramesBasedOnStateProtocol> *childViewController in [self primaryViewControllers]) {
        CGRect fromFrame = childViewController.view.frame;
        CGRect toFrame = [childViewController frameForState:state];
        POPSpringAnimation *animation = [PopViewAnimator springAnimationFromFrameTo:fromFrame toFrame:toFrame];
        [childViewController.view pop_addAnimation:animation forKey:@"state"];
        
        if (state == PositionStateRecordings) {
            [self.recordingsViewController showPlayerButtons];
        }
        
        [animation setCompletionBlock:^(POPAnimation *animation, BOOL finished) {
            if ([childViewController respondsToSelector:@selector(popAnimationCompleted)]) {
                [(id)childViewController popAnimationCompleted];
            }
        }];
    }
}

- (void)cancelMoveAnimations {
    for (UIViewController<FramesBasedOnStateProtocol> *viewController in [self primaryViewControllers]) {
        [viewController.view pop_removeAnimationForKey:@"state"];
    }
    [self.micdBackgroundView pop_removeAnimationForKey:@"state"];
}

#pragma mark - FramesBasedOnStateProtocol

- (void)setInitialStateFrame {
    [self.homeViewController setInitialStateFrame];
    [self.recordingsViewController setInitialStateFrame];
    [self.settingsViewController setInitialStateFrame];
    self.micdBackgroundOriginalFrame = self.micdBackgroundView.frame;
}

- (void)adjustFrameBasedOnTranslation:(CGPoint)translation {
    CGRect frame = self.micdBackgroundView.frame;
    frame.origin.y += translation.y * .67;
    self.micdBackgroundView.frame = frame;
    
    [self.homeViewController adjustFrameBasedOnTranslation:translation];
    [self.recordingsViewController adjustFrameBasedOnTranslation:translation];
    [self.settingsViewController adjustFrameBasedOnTranslation:translation];
}

- (CGRect)frameForState:(PositionState)state {
    CGRect futureFrame = self.micdBackgroundView.frame;
    switch (state) {
        case PositionStateHome:
            futureFrame.origin.y = 0;
            break;
        case PositionStateRecordings:
            futureFrame.origin.y = (self.view.window.frame.size.height * 1.068f);
            break;
        case PositionStateSettings:
            futureFrame.origin.y = (self.view.window.frame.size.height * -1.068f);
            break;
        default:
            break;
    }
    
    futureFrame.origin.y *= 0.67f;
    
    return futureFrame;
}

- (NSArray *)primaryViewControllers {
    return @[self.homeViewController, self.recordingsViewController, self.settingsViewController];
}

@end

