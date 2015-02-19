#import "ParentViewController.h"
#import "RecordingsViewController.h"
#import "HomeViewController.h"
#import "FramesController.h"
#import "WireTapStyleKit.h"
#import "UIColor+Palette.h"
#import "DataSourceController.h"
#import "Recording.h"

@interface ParentViewController () <FramesBasedOnStateProtocol, MovementDelegate, AddNewRecordingDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *micdBackgroundView;
@property (strong, nonatomic) RecordingsViewController *recordingsViewController;
@property (strong, nonatomic) HomeViewController *homeViewController;
@property (strong, nonatomic) DataSourceController *dataSource;
@end

@implementation ParentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dataSource = [DataSourceController sharedInstance];
    
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
    
    self.micdBackgroundView.image = [WireTapStyleKit imageOfMicdBackground];
}

-(void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    [self setInitialStateFrame];
}

#pragma mark - AddNewRecordingDelegate

- (void)addNewRecording:(Recording *)recording {
    [self.dataSource addNewRecording:recording];
    [self.recordingsViewController reloadData];
}

#pragma mark - MovementDelegate

- (void)shouldMoveWithTranslation:(CGPoint)translation {
    [self adjustFrameBasedOnTranslation:translation];
}

- (void)shouldMoveToPositionState:(HomeViewContollerPositionState)state {
    [UIView animateWithDuration:1
                          delay:0
         usingSpringWithDamping:.7
          initialSpringVelocity:1
                        options:(UIViewAnimationOptionAllowUserInteraction)
                     animations: ^{
                         [self setFrameBasedOnState:state];
                     } completion:^(BOOL finished) {
                         self.homeViewController.displayLink.paused = YES;
//                         [self.homeViewController.displayLink removeFromRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
                     }];
}

#pragma mark - FramesBasedOnStateProtocol

- (void)setInitialStateFrame {
    [self.homeViewController setInitialStateFrame];
    [self.recordingsViewController setInitialStateFrame];
}

- (void)setFrameBasedOnState:(HomeViewContollerPositionState)state {
    [self.homeViewController setFrameBasedOnState:state];
    [self.recordingsViewController setFrameBasedOnState:state];
}

- (void)adjustFrameBasedOnTranslation:(CGPoint)translation {
    // TODO: customize origin per child view
    [self.homeViewController adjustFrameBasedOnTranslation:translation];
    [self.recordingsViewController adjustFrameBasedOnTranslation:translation];
}

@end

