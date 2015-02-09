#import "WireTapStyleKit.h"
#import "UIColor+Palette.h"
#import "HomeViewController.h"

static CGFloat const kCurrentBackgroundImageHeight = 2088.0f;
static CGFloat const kCurrentBackgroundImageWidth = 375.0f;
static CGFloat const kCurrentBackgroundImageInitialYOffsetMultiplier = -0.523f;

@interface HomeViewController () <UIGestureRecognizerDelegate>

@property (assign, nonatomic) BOOL isMovingDown;
@property (strong, nonatomic) UIButton *recordButton;

@property (strong, nonatomic) UIImageView *backgroundImageView;
@property (strong, nonatomic) UIView *recordingsBottomArrow;
@property (strong, nonatomic) UIView *recordingsTopArrow;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self.view.layer setBackgroundColor:[UIColor colorWithPatternImage:[WireTapStyleKit imageOfHomeViewWithColor:[UIColor vibrantBlue]]].CGColor];
    self.backgroundImageView = [[UIImageView alloc] initWithImage:[WireTapStyleKit imageOfHomeViewWithColor:[UIColor vibrantBlue]]];
    [self.view addSubview:self.backgroundImageView];
    
    UIPanGestureRecognizer *panGesture;
    
//    [self.view addGestureRecognizer:self.panGesture];
    
    self.recordingsBottomArrow = [[UIView alloc] init];
    panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
    panGesture.delegate = self;
    [self.recordingsBottomArrow addGestureRecognizer:panGesture];
    [self.view addSubview:self.recordingsBottomArrow];
    self.recordingsBottomArrow.layer.borderColor = [UIColor greenColor].CGColor;
    self.recordingsBottomArrow.layer.borderWidth = 2.0f;
    
    self.recordingsTopArrow = [[UIView alloc] init];
    panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
    panGesture.delegate = self;
    [self.recordingsTopArrow addGestureRecognizer:panGesture];
    [self.view addSubview:self.recordingsTopArrow];
    self.recordingsTopArrow.layer.borderColor = [UIColor redColor].CGColor;
    self.recordingsTopArrow.layer.borderWidth = 2.0f;
    
    self.recordButton = [[UIButton alloc] init];
    [self.recordButton setImage:[WireTapStyleKit imageOfRecordButton] forState:UIControlStateNormal];
    [self.view addSubview:self.recordButton];
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
    CGFloat windowHeight = self.view.window.frame.size.height;
    CGFloat windowWidth = self.view.window.frame.size.width;
    CGFloat gestureSizeConstant = windowWidth * 0.213f;
    CGFloat buttonSizeConstant = windowHeight * 0.384f; // 256
    // width:height     center on x
    CGFloat backgroundImageRatio = kCurrentBackgroundImageWidth/kCurrentBackgroundImageHeight;
    CGFloat backgroundImageHeight = windowHeight * (kCurrentBackgroundImageHeight / 667.0f);
    CGFloat backgroundImageWidth = backgroundImageRatio * backgroundImageHeight;
    
    self.view.frame = CGRectMake((windowWidth - backgroundImageWidth)/2.0f,
                                 backgroundImageHeight * kCurrentBackgroundImageInitialYOffsetMultiplier, //1092
                                 backgroundImageRatio * backgroundImageHeight,
                                 backgroundImageHeight);
    
    self.backgroundImageView.frame = self.view.bounds;
    
    self.recordButton.frame = CGRectMake(windowWidth/2.0f - buttonSizeConstant/2.0f - self.view.frame.origin.x,
                                         windowHeight/2.0f - buttonSizeConstant/2.0f - self.view.frame.origin.y,
                                         buttonSizeConstant,
                                         buttonSizeConstant);
    
    self.recordingsBottomArrow.frame = CGRectMake(windowWidth/2.0f - gestureSizeConstant/2.0f - self.view.frame.origin.x,
                                                  windowHeight/2.0f - gestureSizeConstant/2.0f - self.view.frame.origin.y - windowHeight * 0.36f,
                                                  gestureSizeConstant,
                                                  gestureSizeConstant);
    
    self.recordingsTopArrow.frame = CGRectMake(windowWidth/2.0f - gestureSizeConstant/2.0f - self.view.frame.origin.x,
                                               windowHeight/2.0f - gestureSizeConstant/2.0f - self.view.frame.origin.y - windowHeight * 0.707f,
                                               gestureSizeConstant,
                                               gestureSizeConstant);
}

- (void)setFrameBasedOnState:(HomeViewContollerPositionState)state {
    CGFloat backgroundImageHeight = self.view.window.frame.size.height * (kCurrentBackgroundImageHeight / 667.0f);
    CGFloat backgroundImageInitialY = backgroundImageHeight * kCurrentBackgroundImageInitialYOffsetMultiplier;
    CGFloat backgroundImageYOffsetToNewState = backgroundImageHeight * 0.348f;
    
    CGRect frame = self.view.frame;
    switch (state) {
        case HomeViewContollerPositionStateHome:
            frame.origin.y = backgroundImageInitialY;
            break;
        case HomeViewContollerPositionStateRecordings:
            frame.origin.y = backgroundImageInitialY + backgroundImageYOffsetToNewState;
            break;
        case HomeViewContollerPositionStateSettings:
            frame.origin.y = backgroundImageInitialY - backgroundImageYOffsetToNewState;
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
