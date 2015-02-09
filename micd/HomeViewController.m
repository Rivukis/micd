#import "WireTapStyleKit.h"
#import "UIColor+Palette.h"
#import "HomeViewController.h"

static CGFloat const kCurrentBackgroundImageHeight = 2755;
static CGFloat const kCurrentBackgroundImageWidth = 375.0f;

@interface HomeViewController () <UIGestureRecognizerDelegate>

@property (assign, nonatomic) BOOL isMovingDown;
@property (strong, nonatomic) UIButton *recordButton;

@property (strong, nonatomic) UIImageView *backgroundImageView;
@property (strong, nonatomic) UIView *recordingsBottomArrow;
@property (strong, nonatomic) UIView *recordingsTopArrow;
@property (strong, nonatomic) UIView *settingsBottomArrow;
@property (strong, nonatomic) UIView *settingsTopArrow;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.backgroundImageView = [[UIImageView alloc] initWithImage:[WireTapStyleKit imageOfHomeViewWithColor:[UIColor vibrantBlue]]];
    [self.view addSubview:self.backgroundImageView];
    
    self.recordButton = [[UIButton alloc] init];
    [self.recordButton setImage:[WireTapStyleKit imageOfRecordButton] forState:UIControlStateNormal];
    [self.view addSubview:self.recordButton];
    
    [self setupPanGestures];
}

- (void)setupPanGestures {
    UIPanGestureRecognizer *panGesture;
    
    self.recordingsTopArrow = [[UIView alloc] init];
    panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handleRecordingsToHomePan:)];
    panGesture.delegate = self;
    [self.recordingsTopArrow addGestureRecognizer:panGesture];
    [self.view addSubview:self.recordingsTopArrow];
//    self.recordingsTopArrow.layer.borderColor = [UIColor redColor].CGColor;
//    self.recordingsTopArrow.layer.borderWidth = 2.0f;
    
    
    self.recordingsBottomArrow = [[UIView alloc] init];
    panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handleHomeToRecordingsPan:)];
    panGesture.delegate = self;
    [self.recordingsBottomArrow addGestureRecognizer:panGesture];
    [self.view addSubview:self.recordingsBottomArrow];
//    self.recordingsBottomArrow.layer.borderColor = [UIColor greenColor].CGColor;
//    self.recordingsBottomArrow.layer.borderWidth = 2.0f;
    
    self.settingsTopArrow = [[UIView alloc] init];
    panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handleHomeToSettingsPan:)];
    panGesture.delegate = self;
    [self.settingsTopArrow addGestureRecognizer:panGesture];
    [self.view addSubview:self.settingsTopArrow];
//    self.settingsTopArrow.layer.borderColor = [UIColor magentaColor].CGColor;
//    self.settingsTopArrow.layer.borderWidth = 2.0f;
    
    self.settingsBottomArrow = [[UIView alloc] init];
    panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handleSettingsToHomePan:)];
    panGesture.delegate = self;
    [self.settingsBottomArrow addGestureRecognizer:panGesture];
    [self.view addSubview:self.settingsBottomArrow];
//    self.settingsBottomArrow.layer.borderColor = [UIColor cyanColor].CGColor;
//    self.settingsBottomArrow.layer.borderWidth = 2.0f;
}

#pragma mark - PanGestureRecognizer

- (void)handleRecordingsToHomePan:(UIPanGestureRecognizer *)gestureRecognizer {
    if (gestureRecognizer.state == UIGestureRecognizerStateChanged) {
        CGPoint translation = [gestureRecognizer translationInView:gestureRecognizer.view];
        [self.movementDelegate shouldMoveWithTranslation:translation];
        [gestureRecognizer setTranslation:CGPointMake(0, 0) inView:gestureRecognizer.view];
    } else if (gestureRecognizer.state == UIGestureRecognizerStateEnded) {
        NSLog(@"%@", NSStringFromCGPoint([gestureRecognizer velocityInView:gestureRecognizer.view]));
        if ([gestureRecognizer velocityInView:gestureRecognizer.view].y < 0) {
            [self.movementDelegate shouldMoveToPositionState:HomeViewContollerPositionStateHome];
        } else {
            [self.movementDelegate shouldMoveToPositionState:HomeViewContollerPositionStateRecordings];
        }
    }
}

- (void)handleHomeToRecordingsPan:(UIPanGestureRecognizer *)gestureRecognizer {
    if (gestureRecognizer.state == UIGestureRecognizerStateChanged) {
        CGPoint translation = [gestureRecognizer translationInView:gestureRecognizer.view];
        [self.movementDelegate shouldMoveWithTranslation:translation];
        [gestureRecognizer setTranslation:CGPointMake(0, 0) inView:gestureRecognizer.view];
    } else if (gestureRecognizer.state == UIGestureRecognizerStateEnded) {
        if ([gestureRecognizer velocityInView:gestureRecognizer.view].y > 0) {
            [self.movementDelegate shouldMoveToPositionState:HomeViewContollerPositionStateRecordings];
        } else {
            [self.movementDelegate shouldMoveToPositionState:HomeViewContollerPositionStateHome];
        }
    }
}

- (void)handleHomeToSettingsPan:(UIPanGestureRecognizer *)gestureRecognizer {
    if (gestureRecognizer.state == UIGestureRecognizerStateChanged) {
        CGPoint translation = [gestureRecognizer translationInView:gestureRecognizer.view];
        [self.movementDelegate shouldMoveWithTranslation:translation];
        [gestureRecognizer setTranslation:CGPointMake(0, 0) inView:gestureRecognizer.view];
    } else if (gestureRecognizer.state == UIGestureRecognizerStateEnded) {
        if ([gestureRecognizer velocityInView:gestureRecognizer.view].y < 0) {
            [self.movementDelegate shouldMoveToPositionState:HomeViewContollerPositionStateSettings];
        } else {
            [self.movementDelegate shouldMoveToPositionState:HomeViewContollerPositionStateHome];
        }
    }
}

- (void)handleSettingsToHomePan:(UIPanGestureRecognizer *)gestureRecognizer {
    if (gestureRecognizer.state == UIGestureRecognizerStateChanged) {
        CGPoint translation = [gestureRecognizer translationInView:gestureRecognizer.view];
        [self.movementDelegate shouldMoveWithTranslation:translation];
        [gestureRecognizer setTranslation:CGPointMake(0, 0) inView:gestureRecognizer.view];
    } else if (gestureRecognizer.state == UIGestureRecognizerStateEnded) {
        if ([gestureRecognizer velocityInView:gestureRecognizer.view].y > 0) {
            [self.movementDelegate shouldMoveToPositionState:HomeViewContollerPositionStateHome];
        } else {
            [self.movementDelegate shouldMoveToPositionState:HomeViewContollerPositionStateSettings];
        }
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
                                 [self backgroundImageHomeStateYOffset], //1092
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
                                               windowHeight/2.0f - gestureSizeConstant/2.0f - self.view.frame.origin.y - windowHeight * 0.707,
                                               gestureSizeConstant,
                                               gestureSizeConstant);
    
    self.settingsBottomArrow.frame = CGRectMake(windowWidth/2.0f - gestureSizeConstant/2.0f - self.view.frame.origin.x,
                                               (windowHeight/2.0f - gestureSizeConstant/2.0f - self.view.frame.origin.y - windowHeight * 0.36f) + windowHeight * 1.09f,
                                               gestureSizeConstant,
                                               gestureSizeConstant);
    
    self.settingsTopArrow.frame = CGRectMake(windowWidth/2.0f - gestureSizeConstant/2.0f - self.view.frame.origin.x,
                                               (windowHeight/2.0f - gestureSizeConstant/2.0f - self.view.frame.origin.y - windowHeight * 0.707) + windowHeight * 1.09f,
                                               gestureSizeConstant,
                                               gestureSizeConstant);
}

- (void)setFrameBasedOnState:(HomeViewContollerPositionState)state {
    CGRect frame = self.view.frame;
    switch (state) {
        case HomeViewContollerPositionStateHome:
            frame.origin.y = [self backgroundImageHomeStateYOffset];
            break;
        case HomeViewContollerPositionStateRecordings:
            frame.origin.y = [self backgroundImageRecordingsStateYOffset];
            break;
        case HomeViewContollerPositionStateSettings:
            frame.origin.y = [self backgroundImageSettingsStateYOffset];
            break;
        default:
            break;
    }
    self.view.frame = frame;
}

- (CGFloat)backgroundImageHomeStateYOffset {
    return self.view.window.frame.size.height * -1.637f;
}

- (CGFloat)backgroundImageRecordingsStateYOffset {
    CGFloat backgroundImageYOffsetToNewState = self.view.window.frame.size.height * 1.09f;
    return [self backgroundImageHomeStateYOffset] + backgroundImageYOffsetToNewState;
}

- (CGFloat)backgroundImageSettingsStateYOffset {
    CGFloat backgroundImageYOffsetToNewState = self.view.window.frame.size.height * 1.09f;
    return [self backgroundImageHomeStateYOffset] - backgroundImageYOffsetToNewState;
}

- (void)adjustFrameBasedOnTranslation:(CGPoint)translation {
    CGRect frame = self.view.frame;
    frame.origin.y += translation.y;
    self.view.frame = frame;
}

@end
