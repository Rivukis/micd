#import "WireTapStyleKit.h"
#import "UIColor+Palette.h"
#import "HomeViewController.h"
#import "GearsImageView.h"
#import "OBShapedButton.h"
#import "RecorderController.h"
#import "passthroughImageView.h"
#import "ViewAnimator.h"
#import "DisplayLinkController.h"
#import "PlayerController.h"

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

@property (assign, nonatomic) NSUInteger animatingPulseCount;
@property (strong, nonatomic) NSMutableArray *pulsingValues;

@property (strong, nonatomic) DisplayLinkController *displayLinkController;

@property (assign, nonatomic) BOOL growForLouderNoises;

@property (assign, nonatomic) PositionState currentPositionState;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.growForLouderNoises = NO;
    
    self.recorderController = [RecorderController sharedRecorder];
    
    self.backgroundImageView = [[passthroughImageView alloc] initWithImage:[WireTapStyleKit imageOfHomeView]];
    [self.view addSubview:self.backgroundImageView];
    self.backgroundImageView.userInteractionEnabled = YES;
    
    self.recordButton = [[OBShapedButton alloc] init];
    [self.recordButton addTarget:self action:@selector(recordButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.recordButton setBackgroundImage:[WireTapStyleKit imageOfRecordButton] forState:UIControlStateNormal];
    [self.recordButton setBackgroundImage:[WireTapStyleKit imageOfRecordButton] forState:UIControlStateHighlighted];
    [self.view addSubview:self.recordButton];
    
    self.gearsImageView = [[GearsImageView alloc] init];
    [self.view addSubview:self.gearsImageView];
    
    [self setupArrowButtons];
    
    self.displayLinkController = [[DisplayLinkController alloc] initWithTarget:self selector:@selector(handleDisplayLinkAnimation:)];
    [self.displayLinkController addDisplayLinkToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
    
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
    panGesture.delegate = self;
    panGesture.maximumNumberOfTouches = 1;
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
            [[PlayerController sharedPlayer] pauseAudio];
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
    self.pulsingValues = [NSMutableArray array];
    for (int i = 0; i < 15; i++) {
        [self.pulsingValues addObject:(self.growForLouderNoises) ? @1.2 : @1];
    }
    
    UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
    self.blurView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
    
    CGRect blurViewFrame = self.view.bounds;
    self.blurView.frame = blurViewFrame;
    [self.view addSubview:self.blurView];
    self.blurView.alpha = 0.0f;
    
    self.recordButtonSnapshot.frame = self.recordButton.frame;
    [self.view addSubview:self.recordButtonSnapshot];
    
    [UIView animateWithDuration:.25f animations:^{
        self.blurView.alpha = 1.0f;
    } completion:^(BOOL finished) {
        [self.displayLinkController addSubscriberWithKey:@"recordButton"];
        
        [self.recordButtonSnapshot removeFromSuperview];
        [self.blurView.contentView addSubview:self.recordButton];
    }];
}

- (void)animatePauseState {
    [self.displayLinkController removeSubscriberWithKey:@"recordButton"];
    
    float averagedTransformCoefficient = 0.0f;
    for (NSNumber *savedPulseCoefficient in self.pulsingValues) {
        averagedTransformCoefficient += savedPulseCoefficient.floatValue;
    }
    
    averagedTransformCoefficient /= self.pulsingValues.count;
    
    self.recordButtonSnapshot.transform = CGAffineTransformMakeScale(averagedTransformCoefficient, averagedTransformCoefficient);
    self.recordButton.transform = CGAffineTransformIdentity;
    [self.recordButton removeFromSuperview];
    
    [self.view addSubview:self.recordButtonSnapshot];
    
    [UIView animateWithDuration:.25f animations:^{
        self.recordButtonSnapshot.transform = CGAffineTransformIdentity;
        self.blurView.alpha = 0.0f;
    } completion:^(BOOL finished) {
        [self.view addSubview:self.recordButton];
        [self.recordButtonSnapshot removeFromSuperview];
    }];
    
}

- (void)popAnimationCompleted {
    [self.displayLinkController removeSubscriberWithKey:@"gears"];
}

- (void)animateGearsSpinning {
    [self.displayLinkController addSubscriberWithKey:@"gears"];
}

#pragma mark - PanGestureRecognizer

- (void)handlePan:(UIPanGestureRecognizer *)gestureRecognizer {
    if (gestureRecognizer.state == UIGestureRecognizerStateBegan) {
        [self.movementDelegate shouldCancelMoveAnimations];
        
    } else if (gestureRecognizer.state == UIGestureRecognizerStateChanged) {
        CGPoint translation = [gestureRecognizer translationInView:gestureRecognizer.view];
        [self.movementDelegate shouldMoveWithTranslation:translation];
        [self rotateGearsWithTranslation:translation];
        [gestureRecognizer setTranslation:CGPointMake(0, 0) inView:gestureRecognizer.view];
        NSLog(@"%f y velocity", [gestureRecognizer velocityInView:gestureRecognizer.view].y);
        
    } else if (gestureRecognizer.state == UIGestureRecognizerStateEnded) {
        NSInteger velocityHorizon = 200;
        CGPoint velocity = [gestureRecognizer velocityInView:gestureRecognizer.view];
        BOOL isPanningUp = velocity.y < 0;
        CGFloat currentY = self.view.frame.origin.y;
        
        if (currentY > [self backgroundImageRecordingsStateYOffset]) {
            [self.movementDelegate shouldMoveToPositionState:PositionStateRecordings];
        } else if (currentY > [self backgroundImageHomeStateYOffset]) {
            // in between recordings and home
            if (abs(velocity.y) < velocityHorizon) {
                // move based on location
                if (abs(currentY - [self backgroundImageRecordingsStateYOffset]) < abs(currentY - [self backgroundImageHomeStateYOffset])) {
                    [self.movementDelegate shouldMoveToPositionState:PositionStateRecordings];
                } else {
                    [self.movementDelegate shouldMoveToPositionState:PositionStateHome];
                }
            } else {
                // move based on velocity direction
                if (isPanningUp) {
                    [self.movementDelegate shouldMoveToPositionState:PositionStateHome];
                } else {
                    [self.movementDelegate shouldMoveToPositionState:PositionStateRecordings];
                }
            }
        } else if (currentY > [self backgroundImageSettingsStateYOffset]) {
            //in between home and settings
            if (abs(velocity.y) < velocityHorizon) {
                // move based on location
                
                if (abs(currentY - [self backgroundImageHomeStateYOffset]) < abs(currentY - [self backgroundImageSettingsStateYOffset])) {
                    [self.movementDelegate shouldMoveToPositionState:PositionStateHome];
                } else {
                    [self.movementDelegate shouldMoveToPositionState:PositionStateSettings];
                }
                
            } else {
                // move based on velocity direction
                if (isPanningUp) {
                    [self.movementDelegate shouldMoveToPositionState:PositionStateSettings];
                } else {
                    [self.movementDelegate shouldMoveToPositionState:PositionStateHome];
                }
            }
        } else {
            [self.movementDelegate shouldMoveToPositionState:PositionStateSettings];
        }
        
        
        
//        [self.movementDelegate shouldMoveToPositionState:[self nextPositionStateWhenMovingUp:isMovingUp fromState:NSNotFound]];
    }
}

- (PositionState)nextPositionStateWhenMovingUp:(BOOL)isMovingUp fromState:(PositionState)fromState {
    switch (self.currentPositionState) {
        case PositionStateSettings:
            if (isMovingUp) {
                return PositionStateHome;
            } else {
                return self.currentPositionState;
            }
        case PositionStateHome:
            if (isMovingUp) {
                return PositionStateRecordings;
            } else {
                return PositionStateSettings;
            }
        case PositionStateRecordings:
            if (isMovingUp) {
                return self.currentPositionState;
            } else {
                return PositionStateHome;
            }
        default:
            break;
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
    [self.movementDelegate shouldMoveToPositionState:PositionStateHome];
}

- (void)moveToPlayerState {
    [self.movementDelegate shouldMoveToPositionState:PositionStateRecordings];
}

- (void)moveToSettingState {
    [self.movementDelegate shouldMoveToPositionState:PositionStateSettings];
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
    
    self.currentPositionState = PositionStateHome;
}

- (CGRect)frameForState:(PositionState)state {
    self.currentPositionState = state;
    
    CGRect frame = self.view.frame;
    switch (state) {
        case PositionStateHome:
            frame.origin.y = [self backgroundImageHomeStateYOffset];
            
            break;
        case PositionStateRecordings:
            frame.origin.y = [self backgroundImageRecordingsStateYOffset];
            
            break;
        case PositionStateSettings:
            frame.origin.y = [self backgroundImageSettingsStateYOffset];
            
            break;
        default:
            break;
    }
    return frame;
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
    if (self.recorderController.recordingState == RecorderControllerStateRecording) {
        
        CGFloat avgDB = [self.recorderController averagePowerForChannelZero];
        CGFloat transformCoefficient = 1.2 - (((avgDB + 40) / 40) * 0.4f);
        
        [self.pulsingValues addObject:@(transformCoefficient)];
        if (self.pulsingValues.count > 15) {
            [self.pulsingValues removeObjectAtIndex:0];
        }
        if (self.pulsingValues.count > 15) {
            [self.pulsingValues removeObjectAtIndex:0];
        }
        
        float averagedTransformCoefficient = 0.0f;
        for (NSNumber *savedPulseCoefficient in self.pulsingValues) {
            averagedTransformCoefficient += savedPulseCoefficient.floatValue;
        }
        
        averagedTransformCoefficient /= self.pulsingValues.count;
        
        if (self.growForLouderNoises) {
            float difference = 1.2 - averagedTransformCoefficient;
            averagedTransformCoefficient = 1.0 + difference;
        }
        
        self.recordButton.transform = CGAffineTransformMakeScale(averagedTransformCoefficient, averagedTransformCoefficient);
        
    } else {
        CGRect presentationFrame = [self.view.layer.presentationLayer frame];
        
        if (!self.hasSetInitialY) {
            self.initialY = presentationFrame.origin.y;
            self.hasSetInitialY = YES;
        }
        
        float Ytraveled = fabsf(presentationFrame.origin.y) - fabsf(self.initialY);
        self.initialY = presentationFrame.origin.y;
        [self.gearsImageView moveGearsWithRotationAngle:-Ytraveled];
    }
}

@end
