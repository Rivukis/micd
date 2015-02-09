#import "ParentViewController.h"
#import "GripperView.h"
#import "RecordingsViewController.h"
#import "HomeViewController.h"
#import "SetFramesProtocol.h"
#import "WireTapStyleKit.h"
#import "UIColor+Palette.h"

@interface ParentViewController () <SetFramesProtocol, MovementDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *micdBackgroundView;
@property (strong, nonatomic) RecordingsViewController *recordingsViewController;
@property (strong, nonatomic) HomeViewController *homeViewController;
@end

@implementation ParentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor blackColor];
    
    self.homeViewController = [self.storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([HomeViewController class])];
    [self addChildViewController:self.homeViewController];
    [self.view addSubview:self.homeViewController.view];
    [self.homeViewController didMoveToParentViewController:self];
    self.homeViewController.movementDelegate = self;
    
    self.recordingsViewController = [self.storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([RecordingsViewController class])];
    [self addChildViewController:self.recordingsViewController];
    [self.view addSubview:self.recordingsViewController.view];
    [self.recordingsViewController didMoveToParentViewController:self];
    
    self.micdBackgroundView.image = [WireTapStyleKit imageOfMicdBackgroundWithColor:[UIColor vibrantBlue]];
}

-(void)viewDidLayoutSubviews {
    [self setInitialStateFrame];
}

#pragma mark - MovementDelegate

- (void)shouldMoveWithTranslation:(CGPoint)translation {
    [self adjustFrameBasedOnTranslation:translation];
}

- (void)shouldMoveToPositionState:(HomeViewContollerPositionState)state {
    __typeof(self) __weak weakSelf = self;
    [UIView animateWithDuration:1
                          delay:0
         usingSpringWithDamping:.7
          initialSpringVelocity:1
                        options:(UIViewAnimationOptionAllowUserInteraction)
                     animations: ^{
                         [self setFrameBasedOnState:state];
                     } completion:^(BOOL finished) {
                         NSLog(@"%@", weakSelf);
                     }];
}

#pragma mark - SetFramesProtocol

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

