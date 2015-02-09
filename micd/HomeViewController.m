#import "WireTapStyleKit.h"
#import "UIColor+Palette.h"
#import "HomeViewController.h"

@interface HomeViewController () <UIGestureRecognizerDelegate>

//@property (strong, nonatomic) UIButton *recordButton;
@property (strong, nonatomic) UIPanGestureRecognizer *panGesture;
@property (assign, nonatomic) BOOL isMovingDown;

@property (weak, nonatomic) IBOutlet UIImageView *homeImageView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *homeImageViewVerticalSpaceConstraint;
@property (weak, nonatomic) IBOutlet UIButton *recordButton;


@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
    self.panGesture.delegate = self;
    [self.homeImageView addGestureRecognizer:self.panGesture];
    
    self.homeImageView.image = [WireTapStyleKit imageOfHomeViewWithColor:[UIColor vibrantBlue]];
    
    [self.recordButton setImage:[WireTapStyleKit imageOfRecordButton] forState:UIControlStateNormal];
    self.recordButton.backgroundColor = [UIColor magentaColor];
}

#pragma mark - PanGestureRecognizer

-(void)handlePan:(UIPanGestureRecognizer *)gestureRecognizer {
    switch (gestureRecognizer.state) {
        case UIGestureRecognizerStateBegan: {
            if (self.view.frame.origin.y <= self.view.window.frame.size.height * -0.91f) {
                self.isMovingDown = YES;
            } else {
                self.isMovingDown = NO;
            }
            break;
        }
        case UIGestureRecognizerStateChanged: {
            
            CGPoint translation = [gestureRecognizer translationInView:gestureRecognizer.view];
            [self.movementDelegate shouldMoveWithTranslation:translation];
            [gestureRecognizer setTranslation:CGPointMake(0, 0) inView:gestureRecognizer.view];
            break;
        }
        case UIGestureRecognizerStateEnded: {
            BOOL didMoveEnough;
            if (self.isMovingDown) {
                didMoveEnough = self.view.frame.origin.y <= self.view.window.frame.size.height * -1.6f;
                if (didMoveEnough) {
                    [self.movementDelegate shouldMoveToPositionState:HomeViewContollerPositionStateHome];
                } else {
                    [self.movementDelegate shouldMoveToPositionState:HomeViewContollerPositionStateRecordings];
                }
            } else {
                didMoveEnough = self.view.frame.origin.y >= self.view.window.frame.size.height * -0.63f;
                if (didMoveEnough) {
                    [self.movementDelegate shouldMoveToPositionState:HomeViewContollerPositionStateRecordings];
                } else {
                    [self.movementDelegate shouldMoveToPositionState:HomeViewContollerPositionStateHome];
                }
            }
        }
        default:
            break;
    }
}

#pragma mark - SetFramesProtocol

- (void)setInitialStateFrame {
//    self.view.frame = self.view.window.frame;
}

- (void)setFrameBasedOnState:(HomeViewContollerPositionState)state {
    CGRect frame = self.view.frame;
    switch (state) {
        case HomeViewContollerPositionStateHome:
            frame.origin.y = 0.0f;
            break;
        case HomeViewContollerPositionStateRecordings:
            frame.origin.y = (self.view.window.frame.size.height * 1.068f);
            break;
        case HomeViewContollerPositionStateSettings:
            
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

@end
