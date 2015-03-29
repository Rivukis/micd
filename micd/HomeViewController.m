#import "WireTapStyleKit.h"
#import "UIColor+Palette.h"
#import "HomeViewController.h"
#import "GearsImageView.h"
#import "OBShapedButton.h"
#import "RecorderController.h"
#import "PassthroughImageView.h"
#import "ViewAnimator.h"
#import "DisplayLinkController.h"
#import "PlayerController.h"
#import "Constants.h"
#import <AVFoundation/AVFoundation.h>

static CGFloat const kCurrentBackgroundImageHeight = 2755;
static CGFloat const kCurrentBackgroundImageWidth = 375.0f;

@interface HomeViewController () <UIGestureRecognizerDelegate>

@property (assign, nonatomic) BOOL isMovingDown;
@property (strong, nonatomic) OBShapedButton *recordButton;
@property (strong, nonatomic) UIImageView *backgroundImageView;
@property (strong, nonatomic) UIImageView *gearsCircleImageView;
@property (strong, nonatomic) GearsImageView *gearsImageView;
@property (strong, nonatomic) UIButton *recordingsBottomArrowButton;
@property (strong, nonatomic) UIButton *recordingsTopArrowButton;
@property (strong, nonatomic) UIButton *settingsBottomArrowButton;
@property (strong, nonatomic) UIButton *settingsTopArrowButton;

@property (strong, nonatomic) RecorderController *recorderController;

@property (nonatomic) CGFloat initialY;
@property (assign, nonatomic) BOOL hasSetInitialY;

@property (assign, nonatomic) PositionState currentPositionState;

@property (strong, nonatomic) DisplayLinkController *displayLinkController;

@property (assign, nonatomic) NSUInteger animatingPulseCount;
@property (strong, nonatomic) NSMutableArray *pulsingValues;
@property (assign, nonatomic) BOOL growForLouderNoises;
@property (nonatomic) CGFloat arcAngleShrinkCount;
@property (strong, nonatomic) UIView *transitionView;
@property (nonatomic) CGRect recordButtonOriginalFrame;
@property (nonatomic) BOOL recordButtonEnabled;

@property (assign, nonatomic) BOOL startRecordingWhenAnimationCompletes;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.growForLouderNoises = NO;
    self.recordButtonEnabled = YES;
    
    self.recorderController = [RecorderController sharedRecorder];
    self.displayLinkController = [[DisplayLinkController alloc] initWithTarget:self selector:@selector(handleDisplayLinkAnimation:)];
    [self.displayLinkController addDisplayLinkToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
    
    [self setupSubviews];
    [self startObservingNotifications];
}

- (void)setupSubviews {
    self.backgroundImageView = [[UIImageView alloc] initWithImage:[WireTapStyleKit imageOfHomeView]];
    [self.view addSubview:self.backgroundImageView];
    self.backgroundImageView.userInteractionEnabled = YES;
    
    self.recordButton = [[OBShapedButton alloc] init];
    [self.recordButton addTarget:self action:@selector(recordButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.recordButton setBackgroundImage:[WireTapStyleKit imageOfRecordButtonWithArcEndAngle:0 arcStartAngle:1 strokeWidth:10] forState:UIControlStateNormal];
    [self.recordButton setBackgroundImage:[WireTapStyleKit imageOfRecordButtonWithArcEndAngle:0 arcStartAngle:1 strokeWidth:5] forState:UIControlStateHighlighted];
    [self.view addSubview:self.recordButton];
    
    self.gearsCircleImageView = [[UIImageView alloc] initWithImage:[WireTapStyleKit imageOfGearsCircle]];
    [self.view addSubview:self.gearsCircleImageView];
    self.gearsImageView = [[GearsImageView alloc] init];
    [self.gearsCircleImageView addSubview:self.gearsImageView];
    
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
    panGesture.delegate = self;
    [self.view addGestureRecognizer:panGesture];
}

- (void)viewDidAppear:(BOOL)animated {
    // for launching the app while recording
    if (self.recorderController.recordingState == RecorderControllerStateRecording) {
        [self animateRecordingState];
    }
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - Notification Methods

- (void)startObservingNotifications {
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(responseToDidFinishRecordingFromWatch:)
                                                 name:kNotificationKeyDidFinishedRecordingFromWatch
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(responseToApplicationDidBecomeActive:)
                                                 name:kNotificationKeyApplicationDidBecomeActive
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(responseToAVAudioSessionInterruption:)
                                                 name:AVAudioSessionInterruptionNotification
                                               object:nil];
}

- (void)responseToDidFinishRecordingFromWatch:(NSNotification *)notification {
    if (self.recorderController.recordingState == RecorderControllerStateRecording) {
        [self.recorderController pauseRecording];
        __weak __typeof(self) weakSelf = self;
        [self.recorderController retrieveRecordingThenDelete:YES completion:^(Recording *recording, NSError *error) {
            if (error) {
                NSLog(@"error retrieving recording: %@", error);
                return;
            }
            [weakSelf.addNewRecordingDelegate addNewRecording:recording];
        }];
    } else {
        [[PlayerController sharedPlayer] pauseAudio];
        [self.recorderController startRecording];
    }
    
    if (self.view.frame.origin.y != [self backgroundImageHomeStateYOffset]) {
        [self moveToHomeState];
    }
}

- (void)responseToApplicationDidBecomeActive:(NSNotification *)notification {
    BOOL shouldMoveToHomeState = [[NSUserDefaults standardUserDefaults] boolForKey:kUserDefaultsKeyStartRecordingOnAppDidBecomeActive];
    if (shouldMoveToHomeState) {
        self.startRecordingWhenAnimationCompletes = YES;
        [self moveToHomeState];
    }
}

- (void)responseToAVAudioSessionInterruption:(NSNotification *)notification {
    if (self.recorderController.recordingState == RecorderControllerStateRecording) {
        [self recordButtonPressed:self.recordButton];
    }
}

#pragma mark - User Actions

- (void)recordButtonPressed:(UIButton *)sender {
    if (self.recordButtonEnabled) {
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
}

- (void)animateRecordingState {
    self.recordButtonOriginalFrame = self.recordButton.frame;
    
    self.pulsingValues = [NSMutableArray array];
    for (int i = 0; i < 15; i++) {
        [self.pulsingValues addObject:(self.growForLouderNoises) ? @1.2 : @1];
    }
    
    //setup transition view to hold record button stationary
    self.transitionView = [[UIView alloc] initWithFrame:self.view.window.bounds];
    [self.view addSubview:self.transitionView];
    self.transitionView.center = self.recordButton.center;
    [self.transitionView addSubview:self.recordButton];
    self.recordButton.center = self.view.window.center;//CGRectMake(0, 0, 256, 256);
    
    //now take these views and make animation magic
    CGFloat fullCircle = self.gearsCircleImageView.frame.size.height;
    CGRect mainFrame = self.backgroundImageView.frame;
    mainFrame.origin.y -= fullCircle;
    CGRect gearFrame = self.gearsCircleImageView.frame;
    gearFrame.origin.y += fullCircle;
    
    [UIView animateWithDuration:.25f animations:^{
        self.backgroundImageView.frame = mainFrame;
        self.gearsCircleImageView.frame = gearFrame;
    }];
    
    self.arcAngleShrinkCount = 0;
    [self.displayLinkController addSubscriberWithKey:@"recordButton"];
}

- (void)animatePauseState {
    [self.displayLinkController removeSubscriberWithKey:@"recordButton"];
    [self.recordButton setBackgroundImage:[WireTapStyleKit imageOfRecordButtonWithArcEndAngle:0 arcStartAngle:1 strokeWidth:10] forState:UIControlStateNormal];
    
    CGFloat fullCircle = self.gearsCircleImageView.frame.size.height;
    CGRect mainFrame = self.backgroundImageView.frame;
    mainFrame.origin.y += fullCircle;
    CGRect gearFrame = self.gearsCircleImageView.frame;
    gearFrame.origin.y -= fullCircle;
    
    [UIView animateWithDuration:.25f animations:^{
        self.backgroundImageView.frame = mainFrame;
        self.gearsCircleImageView.frame = gearFrame;
    }];
    
    [UIView animateWithDuration:.25f animations:^{
        self.recordButton.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        [self.view addSubview:self.recordButton];
        self.recordButton.frame = self.recordButtonOriginalFrame;
        [self.transitionView removeFromSuperview];
    }];
}

- (void)popAnimationCompleted {
//    if (self.recorderController.recordingState == RecorderControllerStateRecording && self.view.frame.origin.y == [self backgroundImageHomeStateYOffset]) {
//        [self performSelector:@selector(animateRecordingState) withObject:nil afterDelay:1.0f];
//    }
    
    [self.displayLinkController removeSubscriberWithKey:@"gears"];
    
    if (self.startRecordingWhenAnimationCompletes) {
        [self recordButtonPressed:self.recordButton];
        self.startRecordingWhenAnimationCompletes = NO;
        
    }
}

- (void)animateGearsSpinning {
    [self.displayLinkController addSubscriberWithKey:@"gears"];
}

#pragma mark - PanGestureRecognizer

- (void)handlePan:(UIPanGestureRecognizer *)gestureRecognizer {
    
    if (gestureRecognizer.state == UIGestureRecognizerStateBegan) {
        
        [self.movementDelegate cancelMoveAnimations];
        self.recordButtonEnabled = NO;
        
    } else if (gestureRecognizer.state == UIGestureRecognizerStateChanged) {
        
        CGPoint translation = [gestureRecognizer translationInView:gestureRecognizer.view];
        [self.movementDelegate moveWithTranslation:translation];
        [self rotateGearsWithTranslation:translation];
        [gestureRecognizer setTranslation:CGPointMake(0, 0) inView:gestureRecognizer.view];
        
    } else if (gestureRecognizer.state == UIGestureRecognizerStateEnded) {
        
        NSInteger velocityHorizon = 200;
        CGPoint velocity = [gestureRecognizer velocityInView:gestureRecognizer.view];
        BOOL isPanningUp = velocity.y < 0;
        CGFloat currentY = self.view.frame.origin.y;
        
        if (currentY > [self backgroundImageRecordingsStateYOffset]) {
            [self moveToPlayerState];
        } else if (currentY > [self backgroundImageHomeStateYOffset]) {
            // in between recordings and home
            if (abs(velocity.y) < velocityHorizon) {
                // move based on location
                if (abs(currentY - [self backgroundImageRecordingsStateYOffset]) < abs(currentY - [self backgroundImageHomeStateYOffset])) {
                    [self moveToPlayerState];
                } else {
                    [self moveToHomeState];
                }
            } else {
                // move based on velocity direction
                if (isPanningUp) {
                    [self moveToHomeState];
                } else {
                    [self moveToPlayerState];
                }
            }
        } else if (currentY > [self backgroundImageSettingsStateYOffset]) {
            //in between home and settings
            if (abs(velocity.y) < velocityHorizon) {
                // move based on location
                
                if (abs(currentY - [self backgroundImageHomeStateYOffset]) < abs(currentY - [self backgroundImageSettingsStateYOffset])) {
                    [self moveToHomeState];
                } else {
                    [self moveToSettingState];
                }
                
            } else {
                // move based on velocity direction
                if (isPanningUp) {
                    [self moveToSettingState];
                } else {
                    [self moveToHomeState];
                }
            }
        } else {
            [self moveToSettingState];
        }
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
            return PositionStateHome;
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

- (void)moveToHomeState {
    self.recordButtonEnabled = YES;
    [self.movementDelegate moveToPositionState:PositionStateHome];
}

- (void)moveToPlayerState {
    [self.movementDelegate moveToPositionState:PositionStateRecordings];
}

- (void)moveToSettingState {
    [self.movementDelegate moveToPositionState:PositionStateSettings];
}

#pragma mark - FramesBasedOnStateProtocol

- (void)setInitialStateFrame {
    CGFloat windowHeight = self.view.window.frame.size.height;
    CGFloat windowWidth = self.view.window.frame.size.width;
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
    
    CGRect gearsFrame = self.recordButton.frame;
    gearsFrame.origin.y += windowHeight/2.0f * 1.1f;
    self.gearsCircleImageView.frame = gearsFrame;
    self.gearsImageView.frame = self.gearsCircleImageView.bounds;
    
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
        
        self.arcAngleShrinkCount --;
        if (self.arcAngleShrinkCount > -300) {
            [self.recordButton setBackgroundImage:[WireTapStyleKit imageOfRecordButtonWithArcEndAngle:self.arcAngleShrinkCount arcStartAngle:0 strokeWidth:10] forState:UIControlStateNormal];
        } else {
            [self.recordButton setBackgroundImage:[WireTapStyleKit imageOfRecordButtonWithArcEndAngle:self.arcAngleShrinkCount arcStartAngle:self.arcAngleShrinkCount+300 strokeWidth:10] forState:UIControlStateNormal];
        }
        
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
