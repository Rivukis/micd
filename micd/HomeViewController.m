#import "WireTapStyleKit.h"
#import "UIColor+Palette.h"
#import "HomeViewController.h"
#import "GearsImageView.h"
#import "OBShapedButton.h"
#import "RecorderController.h"
#import "passthroughImageView.h"

static CGFloat const kCurrentBackgroundImageHeight = 2755;
static CGFloat const kCurrentBackgroundImageWidth = 375.0f;

@interface HomeViewController () <UIGestureRecognizerDelegate>

@property (assign, nonatomic) BOOL isMovingDown;
@property (strong, nonatomic) OBShapedButton *recordButton;
@property (strong, nonatomic) UIImageView *backgroundImageView;
@property (strong, nonatomic) GearsImageView *gearsImageView;
@property (strong, nonatomic) UIButton *recordingsBottomArrowButton;
@property (strong, nonatomic) UIButton *recordingsTopArrowButton;
@property (strong, nonatomic) UIButton *settingsBottomArrowButton;
@property (strong, nonatomic) UIButton *settingsTopArrowButton;

@property (strong, nonatomic) RecorderController *recorderController;

@property (nonatomic) CGFloat initialY;
@property (assign, nonatomic) BOOL hasSetInitialY;

@property (strong, nonatomic) UIImageView *recordButtonSnapshot;
@property (strong, nonatomic) UIVisualEffectView *blurView;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.recorderController = [RecorderController sharedRecorder];
    
    self.backgroundImageView = [[passthroughImageView alloc] initWithImage:[WireTapStyleKit imageOfHomeView]];
    [self.view addSubview:self.backgroundImageView];
    self.backgroundImageView.userInteractionEnabled = YES;
    
    self.recordButton = [[OBShapedButton alloc] init];
    [self.recordButton addTarget:self action:@selector(recordButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.recordButton setImage:[WireTapStyleKit imageOfRecordButton] forState:UIControlStateNormal];
    [self.view addSubview:self.recordButton];
    
    self.gearsImageView = [[GearsImageView alloc] init];
    [self.view addSubview:self.gearsImageView];
    
    [self setupArrowButtons];
    
    self.displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(handleDisplayLinkAnimation:)];
    [self.displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
    self.displayLink.paused = YES;
    
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
    panGesture.delegate = self;
    [self.view addGestureRecognizer:panGesture];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    UIGraphicsBeginImageContextWithOptions(self.recordButton.bounds.size, NO, 0);
    [self.recordButton drawViewHierarchyInRect:self.recordButton.bounds afterScreenUpdates:YES];
    UIImage *recordButtonImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    self.recordButtonSnapshot = [[UIImageView alloc] initWithImage:recordButtonImage];
}

#pragma mark - User Actions

- (void)recordButtonPressed:(UIButton *)sender {
    
    switch (self.recorderController.recordingState) {
        case RecorderControllerStateStopped:
        case RecorderControllerStatePaused:
            // time to record
            [self.recorderController startRecording];
            
            [self animateRecordingState];
            
            break;
            
        case RecorderControllerStateRecording: {
            // time to stop
            [self.recorderController pauseRecording];
            [self.recordButton setBackgroundColor:[UIColor clearColor]];
            __weak __typeof(self) weakSelf = self;
            [self.recorderController retrieveRecordingThenDelete:YES completion:^(Recording *recording, NSError *error) {
                if (error) {
                    NSLog(@"error retrieving recording: %@", error);
                    return;
                }
                [weakSelf.addNewRecordingDelegate addNewRecording:recording];
            }];
            
            [self animatePauseState];
            
            break;
        }
        case RecorderControllerStatePausing:
        case RecorderControllerStateStopping:
            // can't do anything
            break;
    }
}

- (void)animateRecordingState {
    UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
    self.blurView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
    
    CGRect blurViewFrame = self.view.bounds;
    self.blurView.frame = blurViewFrame;
    [self.view addSubview:self.blurView];
    self.blurView.alpha = 0.0f;
    
    self.recordButtonSnapshot.frame = self.recordButton.frame;
    [self.view addSubview:self.recordButtonSnapshot];
    
    [UIView animateWithDuration:.25f animations:^{
        self.recordButtonSnapshot.transform = CGAffineTransformMakeScale(1.2f, 1.2f);
        self.blurView.alpha = 1.0f;
    } completion:^(BOOL finished) {
        self.recordButton.transform = CGAffineTransformMakeScale(1.2f, 1.2f);
        [self.blurView.contentView addSubview:self.recordButton];
        self.displayLink.paused = NO;
    }];
}

- (void)animatePauseState {
    self.displayLink.paused = YES;
    
    [UIView animateWithDuration:.25f animations:^{
        self.recordButtonSnapshot.transform = CGAffineTransformIdentity;
        self.recordButton.transform = CGAffineTransformIdentity;
        self.blurView.alpha = 0.0f;
    } completion:^(BOOL finished) {
        [self.view addSubview:self.recordButton];
        [self.recordButtonSnapshot removeFromSuperview];
    }];
    
}

#pragma mark - PanGestureRecognizer

- (void)handlePan:(UIPanGestureRecognizer *)gestureRecognizer {
    if (gestureRecognizer.state == UIGestureRecognizerStateChanged) {
        CGPoint translation = [gestureRecognizer translationInView:gestureRecognizer.view];
        [self.movementDelegate shouldMoveWithTranslation:translation];
        [self rotateGearsWithTranslation:translation];
        [gestureRecognizer setTranslation:CGPointMake(0, 0) inView:gestureRecognizer.view];
    } else if (gestureRecognizer.state == UIGestureRecognizerStateEnded) {
        // TODO: need to make this work for settings
        
        if ([gestureRecognizer velocityInView:gestureRecognizer.view].y < 0) {
            [self.movementDelegate shouldMoveToPositionState:HomeViewContollerPositionStateHome];
        } else {
            [self.movementDelegate shouldMoveToPositionState:HomeViewContollerPositionStateRecordings];
        }
    }
}

-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    if (touch.view == self.recordButton || self.recorderController.recordingState == RecorderControllerStateRecording) {
        return NO;
    }
    return YES;
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    return [self.backgroundImageView pointInside:[gestureRecognizer locationInView:self.backgroundImageView] withEvent:UIEventTypeTouches];
}

//- (void)handleRecordingsToHomeTap:(UITapGestureRecognizer *)gestureRecognizer {
//    if (gestureRecognizer.state == UIGestureRecognizerStateChanged) {
//        CGPoint translation = [gestureRecognizer translationInView:gestureRecognizer.view];
//        [self.movementDelegate shouldMoveWithTranslation:translation];
//        [self rotateGearsWithTranslation:translation];
//        [gestureRecognizer setTranslation:CGPointMake(0, 0) inView:gestureRecognizer.view];
//    } else if (gestureRecognizer.state == UIGestureRecognizerStateEnded) {
//        self.displayLink.paused = NO;
//        if ([gestureRecognizer velocityInView:gestureRecognizer.view].y < 0) {
//            [self.movementDelegate shouldMoveToPositionState:HomeViewContollerPositionStateHome];
//        } else {
//            [self.movementDelegate shouldMoveToPositionState:HomeViewContollerPositionStateRecordings];
//        }
//    }
//}
//
//- (void)handleHomeToRecordingsTap:(UITapGestureRecognizer *)gestureRecognizer {
//    if (gestureRecognizer.state == UIGestureRecognizerStateChanged) {
//        CGPoint translation = [gestureRecognizer translationInView:gestureRecognizer.view];
//        [self.movementDelegate shouldMoveWithTranslation:translation];
//        [self rotateGearsWithTranslation:translation];
//        [gestureRecognizer setTranslation:CGPointMake(0, 0) inView:gestureRecognizer.view];
//    } else if (gestureRecognizer.state == UIGestureRecognizerStateEnded) {
//        self.displayLink.paused = NO;
//        if ([gestureRecognizer velocityInView:gestureRecognizer.view].y > 0) {
//            [self.movementDelegate shouldMoveToPositionState:HomeViewContollerPositionStateRecordings];
//        } else {
//            [self.movementDelegate shouldMoveToPositionState:HomeViewContollerPositionStateHome];
//        }
//    }
//}
//
//- (void)handleHomeToSettingsTap:(UITapGestureRecognizer *)gestureRecognizer {
//    if (gestureRecognizer.state == UIGestureRecognizerStateChanged) {
//        CGPoint translation = [gestureRecognizer translationInView:gestureRecognizer.view];
//        [self.movementDelegate shouldMoveWithTranslation:translation];
//        [self rotateGearsWithTranslation:translation];
//        [gestureRecognizer setTranslation:CGPointMake(0, 0) inView:gestureRecognizer.view];
//    } else if (gestureRecognizer.state == UIGestureRecognizerStateEnded) {
//        self.displayLink.paused = NO;
//        if ([gestureRecognizer velocityInView:gestureRecognizer.view].y < 0) {
//            [self.movementDelegate shouldMoveToPositionState:HomeViewContollerPositionStateSettings];
//        } else {
//            [self.movementDelegate shouldMoveToPositionState:HomeViewContollerPositionStateHome];
//        }
//    }
//}
//
//- (void)handleSettingsToHomeTap:(UITapGestureRecognizer *)gestureRecognizer {
//    if (gestureRecognizer.state == UIGestureRecognizerStateChanged) {
//        CGPoint translation = [gestureRecognizer translationInView:gestureRecognizer.view];
//        [self.movementDelegate shouldMoveWithTranslation:translation];
//        [self rotateGearsWithTranslation:translation];
//        [gestureRecognizer setTranslation:CGPointMake(0, 0) inView:gestureRecognizer.view];
//    } else if (gestureRecognizer.state == UIGestureRecognizerStateEnded) {
//        self.displayLink.paused = NO;
//        if ([gestureRecognizer velocityInView:gestureRecognizer.view].y > 0) {
//            [self.movementDelegate shouldMoveToPositionState:HomeViewContollerPositionStateHome];
//        } else {
//            [self.movementDelegate shouldMoveToPositionState:HomeViewContollerPositionStateSettings];
//        }
//    }
//}

- (void)setupArrowButtons {
    self.recordingsTopArrowButton= [[UIButton alloc] init];
    [self.view addSubview:self.recordingsTopArrowButton];
    [self.recordingsTopArrowButton addTarget:self action:@selector(moveToHomeState) forControlEvents:UIControlEventTouchUpInside];
    
    self.recordingsBottomArrowButton = [[UIButton alloc] init];
    [self.view addSubview:self.recordingsBottomArrowButton];
    [self.recordingsBottomArrowButton addTarget:self action:@selector(moveToPlayerState) forControlEvents:UIControlEventTouchUpInside];
    
    self.settingsTopArrowButton = [[UIButton alloc] init];
    [self.view addSubview:self.settingsTopArrowButton];
    [self.settingsTopArrowButton addTarget:self action:@selector(moveToSettingState) forControlEvents:UIControlEventTouchUpInside];
    
    self.settingsBottomArrowButton = [[UIButton alloc] init];
    [self.view addSubview:self.settingsBottomArrowButton];
    [self.settingsBottomArrowButton addTarget:self action:@selector(moveToHomeState) forControlEvents:UIControlEventTouchUpInside];
}

- (void)moveToHomeState {
    [self.movementDelegate shouldMoveToPositionState:HomeViewContollerPositionStateHome];
}

- (void)moveToPlayerState {
    [self.movementDelegate shouldMoveToPositionState:HomeViewContollerPositionStateRecordings];
}

- (void)moveToSettingState {
    [self.movementDelegate shouldMoveToPositionState:HomeViewContollerPositionStateSettings];
}

#pragma mark - FramesBasedOnStateProtocol

- (void)setInitialStateFrame {
    CGFloat windowHeight = self.view.window.frame.size.height;
    CGFloat windowWidth = self.view.window.frame.size.width;
    CGFloat gestureSizeHeightConstant = windowWidth * 0.1f;
    CGFloat gestureSizeWidthConstant = windowWidth * 0.143;
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
    
    self.recordingsBottomArrowButton.frame = CGRectMake(windowWidth/2.0f - gestureSizeWidthConstant/2,
                                                  windowHeight/2.0f - gestureSizeHeightConstant/2.0f - self.view.frame.origin.y - windowHeight * 0.36f,
                                                  gestureSizeWidthConstant,
                                                  gestureSizeHeightConstant);
    
    self.recordingsTopArrowButton.frame = CGRectMake(windowWidth/2 - gestureSizeWidthConstant/2,
                                               windowHeight/2.0f - gestureSizeHeightConstant/2.0f - self.view.frame.origin.y - windowHeight * 0.707,
                                               gestureSizeWidthConstant,
                                               gestureSizeHeightConstant);
    
    self.settingsBottomArrowButton.frame = CGRectMake(windowWidth/2 - gestureSizeWidthConstant/2,
                                               (windowHeight/2.0f - gestureSizeHeightConstant/2.0f - self.view.frame.origin.y - windowHeight * 0.36f) + windowHeight * 1.09f,
                                               gestureSizeWidthConstant,
                                               gestureSizeHeightConstant);
    
    self.settingsTopArrowButton.frame = CGRectMake(windowWidth/2 - gestureSizeWidthConstant/2,
                                             (windowHeight/2.0f - gestureSizeHeightConstant/2.0f - self.view.frame.origin.y - windowHeight * 0.707) + windowHeight * 1.09f,
                                             gestureSizeWidthConstant,
                                             gestureSizeHeightConstant);
    
//    self.recordingsBottomArrowButton.backgroundColor = [UIColor redColor];
//    self.recordingsBottomArrowButton.alpha = .5;
//    self.recordingsBottomArrowButton.layer.cornerRadius = 20;
//    self.recordingsTopArrowButton.backgroundColor = [UIColor redColor];
//    self.settingsBottomArrowButton.backgroundColor = [UIColor redColor];
//    self.settingsTopArrowButton.backgroundColor = [UIColor redColor];
    
    CGRect gearsFrame = self.recordButton.frame;
    gearsFrame.origin.y += windowHeight/2.0f * 1.1f;
    self.gearsImageView.frame = gearsFrame;
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
    
    self.recorderController
    
}

@end
