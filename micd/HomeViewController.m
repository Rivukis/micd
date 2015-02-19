#import "WireTapStyleKit.h"
#import "UIColor+Palette.h"
#import "HomeViewController.h"
#import "GearsImageView.h"
#import "OBShapedButton.h"
#import "RecorderController.h"

static CGFloat const kCurrentBackgroundImageHeight = 2755;
static CGFloat const kCurrentBackgroundImageWidth = 375.0f;

@interface HomeViewController () <UIGestureRecognizerDelegate>

@property (assign, nonatomic) BOOL isMovingDown;
@property (strong, nonatomic) OBShapedButton *recordButton;
@property (strong, nonatomic) UIImageView *backgroundImageView;
@property (strong, nonatomic) GearsImageView *gearsImageView;
@property (strong, nonatomic) UIView *recordingsBottomArrow;
@property (strong, nonatomic) UIView *recordingsTopArrow;
@property (strong, nonatomic) UIView *settingsBottomArrow;
@property (strong, nonatomic) UIView *settingsTopArrow;

@property (strong, nonatomic) RecorderController *recorderController;

@property (nonatomic) CGFloat initialY;
@property (assign, nonatomic) BOOL hasSetInitialY;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.recorderController = [[RecorderController alloc] init];
    
    self.backgroundImageView = [[UIImageView alloc] initWithImage:[WireTapStyleKit imageOfHomeView]];
    [self.view addSubview:self.backgroundImageView];
    
    self.recordButton = [[OBShapedButton alloc] init];
    [self.recordButton addTarget:self action:@selector(recordButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.recordButton setImage:[WireTapStyleKit imageOfRecordButton] forState:UIControlStateNormal];
    [self.view addSubview:self.recordButton];
    
    self.gearsImageView = [[GearsImageView alloc] init];
    [self.view addSubview:self.gearsImageView];
    
    [self setupPanGestures];
    
    self.displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(handleDisplayLinkAnimation:)];
    [self.displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
    self.displayLink.paused = YES;
}

#pragma mark - User Actions

- (void)recordButtonPressed:(UIButton *)sender {
    
    switch (self.recorderController.recordingState) {
        case RecorderControllerStateStopped:
        case RecorderControllerStatePaused:
            // time to record
            [self.recorderController startRecording];
            [self.recordButton setBackgroundColor:[UIColor recordRed]];
            break;
            
        case RecorderControllerStateRecording: {
            // time to stop
            [self.recorderController pauseRecording];
            [self.recordButton setBackgroundColor:[UIColor clearColor]];
            __weak __typeof(self) weakSelf = self;
            [self.recorderController retrieveRecordingThenDelete:NO completion:^(Recording *recording, NSError *error) {
                if (error) {
                    NSLog(@"error retrieving recording: %@", error);
                    return;
                }
                [weakSelf.addNewRecordingDelegate addNewRecording:recording];
            }];
            break;
        }
        case RecorderControllerStatePausing:
        case RecorderControllerStateStopping:
            // can't do anything
            break;
    }
}

#pragma mark - PanGestureRecognizer

- (void)handleRecordingsToHomePan:(UIPanGestureRecognizer *)gestureRecognizer {
    if (gestureRecognizer.state == UIGestureRecognizerStateChanged) {
        CGPoint translation = [gestureRecognizer translationInView:gestureRecognizer.view];
        [self.movementDelegate shouldMoveWithTranslation:translation];
        [self rotateGearsWithTranslation:translation];
        [gestureRecognizer setTranslation:CGPointMake(0, 0) inView:gestureRecognizer.view];
    } else if (gestureRecognizer.state == UIGestureRecognizerStateEnded) {
        if ([gestureRecognizer velocityInView:gestureRecognizer.view].y < 0) {
            [self.movementDelegate shouldMoveToPositionState:HomeViewContollerPositionStateHome];
        } else {
            [self.movementDelegate shouldMoveToPositionState:HomeViewContollerPositionStateRecordings];
        }
        self.displayLink.paused = NO;
    }
}

- (void)handleHomeToRecordingsPan:(UIPanGestureRecognizer *)gestureRecognizer {
    if (gestureRecognizer.state == UIGestureRecognizerStateChanged) {
        CGPoint translation = [gestureRecognizer translationInView:gestureRecognizer.view];
        [self.movementDelegate shouldMoveWithTranslation:translation];
        [self rotateGearsWithTranslation:translation];
        [gestureRecognizer setTranslation:CGPointMake(0, 0) inView:gestureRecognizer.view];
    } else if (gestureRecognizer.state == UIGestureRecognizerStateEnded) {
        if ([gestureRecognizer velocityInView:gestureRecognizer.view].y > 0) {
            [self.movementDelegate shouldMoveToPositionState:HomeViewContollerPositionStateRecordings];
        } else {
            [self.movementDelegate shouldMoveToPositionState:HomeViewContollerPositionStateHome];
        }
        self.displayLink.paused = NO;
    }
}

- (void)handleHomeToSettingsPan:(UIPanGestureRecognizer *)gestureRecognizer {
    if (gestureRecognizer.state == UIGestureRecognizerStateChanged) {
        CGPoint translation = [gestureRecognizer translationInView:gestureRecognizer.view];
        [self.movementDelegate shouldMoveWithTranslation:translation];
        [self rotateGearsWithTranslation:translation];
        [gestureRecognizer setTranslation:CGPointMake(0, 0) inView:gestureRecognizer.view];
    } else if (gestureRecognizer.state == UIGestureRecognizerStateEnded) {
        if ([gestureRecognizer velocityInView:gestureRecognizer.view].y < 0) {
            [self.movementDelegate shouldMoveToPositionState:HomeViewContollerPositionStateSettings];
        } else {
            [self.movementDelegate shouldMoveToPositionState:HomeViewContollerPositionStateHome];
        }
        self.displayLink.paused = NO;
    }
}

- (void)handleSettingsToHomePan:(UIPanGestureRecognizer *)gestureRecognizer {
    if (gestureRecognizer.state == UIGestureRecognizerStateChanged) {
        CGPoint translation = [gestureRecognizer translationInView:gestureRecognizer.view];
        [self.movementDelegate shouldMoveWithTranslation:translation];
        [self rotateGearsWithTranslation:translation];
        [gestureRecognizer setTranslation:CGPointMake(0, 0) inView:gestureRecognizer.view];
    } else if (gestureRecognizer.state == UIGestureRecognizerStateEnded) {
        if ([gestureRecognizer velocityInView:gestureRecognizer.view].y > 0) {
            [self.movementDelegate shouldMoveToPositionState:HomeViewContollerPositionStateHome];
        } else {
            [self.movementDelegate shouldMoveToPositionState:HomeViewContollerPositionStateSettings];
        }
        self.displayLink.paused = NO;
    }
}

#pragma mark - FramesBasedOnStateProtocol

- (void)setInitialStateFrame {
    CGFloat windowHeight = self.view.window.frame.size.height;
    CGFloat windowWidth = self.view.window.frame.size.width;
    CGFloat gestureSizeConstant = windowWidth * 0.5f;
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
    
    self.recordingsBottomArrow.frame = CGRectMake(0,
                                                  windowHeight/2.0f - gestureSizeConstant/2.0f - self.view.frame.origin.y - windowHeight * 0.36f,
                                                  self.view.window.frame.size.width,
                                                  gestureSizeConstant);
    
    self.recordingsTopArrow.frame = CGRectMake(0,
                                               windowHeight/2.0f - gestureSizeConstant/2.0f - self.view.frame.origin.y - windowHeight * 0.707,
                                               self.view.window.frame.size.width,
                                               gestureSizeConstant);
    
    self.settingsBottomArrow.frame = CGRectMake(0,
                                               (windowHeight/2.0f - gestureSizeConstant/2.0f - self.view.frame.origin.y - windowHeight * 0.36f) + windowHeight * 1.09f,
                                               self.view.window.frame.size.width,
                                               gestureSizeConstant);
    
    self.settingsTopArrow.frame = CGRectMake(0,
                                               (windowHeight/2.0f - gestureSizeConstant/2.0f - self.view.frame.origin.y - windowHeight * 0.707) + windowHeight * 1.09f,
                                               self.view.window.frame.size.width,
                                               gestureSizeConstant);
    
    CGPoint settingsCircleMidpoint = CGPointMake(self.recordButton.center.x, self.settingsTopArrow.center.y + (self.settingsBottomArrow.center.y - self.settingsTopArrow.center.y)/2);
    
    self.gearsImageView.frame = self.recordButton.frame;
    self.gearsImageView.center = settingsCircleMidpoint;
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
    CGFloat backgroundImageYOffsetToNewState = self.view.window.frame.size.height * 1.06f;
    return [self backgroundImageHomeStateYOffset] + backgroundImageYOffsetToNewState;
}

- (CGFloat)backgroundImageSettingsStateYOffset {
    CGFloat backgroundImageYOffsetToNewState = self.view.window.frame.size.height * 1.09f;
    return [self backgroundImageHomeStateYOffset] - backgroundImageYOffsetToNewState;
}

#pragma mark - Adjusting views during pan Translation

- (void)adjustFrameBasedOnTranslation:(CGPoint)translation {
    CGRect frame = self.view.frame;
    frame.origin.y += translation.y;
    self.view.frame = frame;
}

- (void)rotateGearsWithTranslation:(CGPoint)translation {
    [self.gearsImageView moveGearsWithRotationAngle:translation.y];
}

- (void)handleDisplayLinkAnimation:(CADisplayLink *)displayLink {
    CGRect presentationFrame = [self.view.layer.presentationLayer frame];
    
    if (!self.hasSetInitialY) {
        self.initialY = presentationFrame.origin.y;
        self.hasSetInitialY = YES;
    }
    
    float Ytraveled = fabsf(presentationFrame.origin.y) - fabsf(self.initialY);
    
    self.initialY = presentationFrame.origin.y;

    [self.gearsImageView moveGearsWithRotationAngle:-Ytraveled];
}

- (void)setupPanGestures {
    UIPanGestureRecognizer *panGesture;
    
    self.recordingsTopArrow = [[UIView alloc] init];
    panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handleRecordingsToHomePan:)];
    panGesture.delegate = self;
    [self.recordingsTopArrow addGestureRecognizer:panGesture];
    [self.view addSubview:self.recordingsTopArrow];
    
    self.recordingsBottomArrow = [[UIView alloc] init];
    panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handleHomeToRecordingsPan:)];
    panGesture.delegate = self;
    [self.recordingsBottomArrow addGestureRecognizer:panGesture];
    [self.view addSubview:self.recordingsBottomArrow];
    
    self.settingsTopArrow = [[UIView alloc] init];
    panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handleHomeToSettingsPan:)];
    panGesture.delegate = self;
    [self.settingsTopArrow addGestureRecognizer:panGesture];
    [self.view addSubview:self.settingsTopArrow];
    
    self.settingsBottomArrow = [[UIView alloc] init];
    panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handleSettingsToHomePan:)];
    panGesture.delegate = self;
    [self.settingsBottomArrow addGestureRecognizer:panGesture];
    [self.view addSubview:self.settingsBottomArrow];
}


@end
