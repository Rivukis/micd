#import "ParentViewController.h"
#import "RecordingsViewController.h"
#import "HomeViewController.h"
#import "FramesController.h"
#import "WireTapStyleKit.h"
#import "UIColor+Palette.h"
#import "DataSourceController.h"
#import "Recording.h"
#import "ViewAnimator.h"
#import "Constants.h"

@interface ParentViewController () <FramesBasedOnStateProtocol, MovementDelegate, AddNewRecordingDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *micdBackgroundView;
@property (strong, nonatomic) RecordingsViewController *recordingsViewController;
@property (strong, nonatomic) HomeViewController *homeViewController;
@property (strong, nonatomic) DataSourceController *dataSource;

@property (assign, nonatomic) BOOL didSetInitialFrames;

@property (strong, nonatomic) ViewAnimator *viewAnimator;

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
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    if (!self.didSetInitialFrames) {
        [self setInitialStateFrame];
        self.didSetInitialFrames = YES;
    }
}

#pragma mark - AddNewRecordingDelegate

- (void)addNewRecording:(Recording *)recording {
    [self.dataSource saveRecording:recording];
    [self.recordingsViewController reloadDataForNewRecording:YES];
    [self.recordingsViewController scrollToAndReadyPlayerWithMostRecentRecording];
}

#pragma mark - MovementDelegate

- (void)shouldMoveWithTranslation:(CGPoint)translation {
    [self adjustFrameBasedOnTranslation:translation];
}

- (void)shouldMoveToPositionState:(PositionState)state {
    [self.homeViewController animateGearsSpinning];
    
    for (UIViewController<FramesBasedOnStateProtocol> *childViewController in [self primaryChildViewControllers]) {
        CGRect fromFrame = childViewController.view.frame;
        CGRect toFrame = [childViewController frameForState:state];
        POPSpringAnimation *animation = [ViewAnimator springAnimationFromFrameTo:fromFrame toFrame:toFrame];
        [childViewController.view pop_addAnimation:animation forKey:@"state"];
        
        if (state == PositionStateRecordings) {
            [self.recordingsViewController showPlayerButtons];
        } else {
            [self.recordingsViewController hidePlayerButtons];
        }
        
        [animation setCompletionBlock:^(POPAnimation *animation, BOOL finished) {
            
            for (UIViewController *viewController in [self primaryChildViewControllers]) {
                if ([viewController respondsToSelector:@selector(popAnimationCompleted)]) {
                    [(id)viewController popAnimationCompleted];
                }
            }
        }];
    }
}

- (void)shouldCancelMoveAnimations {
    for (UIViewController<FramesBasedOnStateProtocol> *viewController in [self primaryChildViewControllers]) {
        [viewController.view pop_removeAnimationForKey:@"state"];
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

- (NSArray *)primaryChildViewControllers {
    return @[self.homeViewController, self.recordingsViewController];
}

@end

