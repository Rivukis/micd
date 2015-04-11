#import "WireTapStyleKit.h"
#import "UIColor+Palette.h"
#import "HomeViewController.h"
#import "DataSourceController.h"
#import "GearsImageView.h"
#import "OBShapedButton.h"
#import "RecorderController.h"
#import "PassthroughImageView.h"
#import "PopViewAnimator.h"
#import "DisplayLinkController.h"
#import "PlayerController.h"
#import "Constants.h"
#import <AVFoundation/AVFoundation.h>
#import "RemoteCommandCenterController.h"
#import "AudioSessionController.h"
#import "MicrophoneAccessRequiredViewController.h"
#import "RecordAnimationView.h"

static CGFloat const kCurrentBackgroundImageHeight = 2755;
static CGFloat const kCurrentBackgroundImageWidth = 375.0f;

static BOOL const growForLouderNoises = NO;

@interface HomeViewController () <UIGestureRecognizerDelegate, RemoteCommandCenterControllerDelegate>

@property (assign, nonatomic) BOOL isMovingDown;
@property (strong, nonatomic) OBShapedButton *recordButton;
@property (strong, nonatomic) UIImageView *backgroundImageView;
@property (strong, nonatomic) UIImageView *gearsCircleImageView;
@property (strong, nonatomic) GearsImageView *gearsImageView;
@property (strong, nonatomic) UIButton *recordingsLowerMoveStateButton;
@property (strong, nonatomic) UIButton *homeUpperMoveStateButton;
@property (strong, nonatomic) UIButton *homeLowerMoveStateButton;
@property (strong, nonatomic) UIButton *settingsUpperMoveStateButton;

@property (strong, nonatomic) RecorderController *recorderController;

@property (nonatomic) CGFloat initialY;
@property (assign, nonatomic) BOOL hasSetInitialY;

@property (assign, nonatomic) PositionState currentPositionState;

@property (strong, nonatomic) DisplayLinkController *displayLinkController;
@property (strong, nonatomic) UIPanGestureRecognizer *panGesture;

@property (strong, nonatomic) UIImageView *recordButtonRotator;
@property (strong, nonatomic) NSMutableArray *pulsingValues;
@property (assign, nonatomic) NSUInteger animatingPulseCount;
@property (strong, nonatomic) UIView *transitionView;
@property (nonatomic) CGRect recordButtonOriginalFrame;
@property (nonatomic) CGRect backgroundImageViewOriginalFrame;
@property (nonatomic) CGRect gearImageViewOriginalFrame;
@property (nonatomic, strong) UILabel *recordTime;

@property (nonatomic) BOOL recordButtonEnabled;
@property (assign, nonatomic) BOOL startRecordingWhenAnimationCompletes;
@property (assign, nonatomic) BOOL movingFromNoRecordingsState;

@property (nonatomic, assign) BOOL interruptionOccuredWhileRecording;

@property (nonatomic, assign) BOOL tryingToStopAndStartRecorder;
@property (nonatomic, assign) BOOL shouldShowOtherStates;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.recorderController = [RecorderController sharedRecorder];
    self.displayLinkController = [[DisplayLinkController alloc] initWithTarget:self selector:@selector(handleDisplayLinkAnimation:)];
    [self.displayLinkController addDisplayLinkToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
    
    [self setupSubviews];
    [self startObservingNotifications];
    
    self.interruptionOccuredWhileRecording = NO;
    DataSourceController *dataSourceController = [DataSourceController sharedDataSource];
    self.shouldShowOtherStates = dataSourceController.numberOfRecordings != 0;
}

- (void)setupSubviews {
    self.backgroundImageView = [[UIImageView alloc] initWithImage:[WireTapStyleKit imageOfHomeView]];
    [self.view addSubview:self.backgroundImageView];
    self.backgroundImageView.userInteractionEnabled = YES;
    
    self.recordButton = [[OBShapedButton alloc] init];
    [self.recordButton addTarget:self action:@selector(recordButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.recordButton setBackgroundImage:[WireTapStyleKit imageOfRecordButton] forState:UIControlStateNormal];
    [self.recordButton setBackgroundImage:[WireTapStyleKit imageOfRecordButtonHighlighted] forState:UIControlStateHighlighted];
    [self.view addSubview:self.recordButton];
    self.recordButtonEnabled = YES;
    
    self.gearsCircleImageView = [[UIImageView alloc] initWithImage:[WireTapStyleKit imageOfGearsCircle]];
    [self.view addSubview:self.gearsCircleImageView];
    self.gearsImageView = [[GearsImageView alloc] init];
    [self.gearsCircleImageView addSubview:self.gearsImageView];
    
    self.panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
    self.panGesture.delegate = self;
    [self.view addGestureRecognizer:self.panGesture];

    self.recordingsLowerMoveStateButton = [[UIButton alloc] init];
    [self.view addSubview:self.recordingsLowerMoveStateButton];
    [self.recordingsLowerMoveStateButton addTarget:self action:@selector(moveToHomeState) forControlEvents:UIControlEventTouchUpInside];
    
    self.homeUpperMoveStateButton = [[UIButton alloc] init];
    [self.view addSubview:self.homeUpperMoveStateButton];
    [self.homeUpperMoveStateButton addTarget:self action:@selector(moveToPlayerState) forControlEvents:UIControlEventTouchUpInside];
    
    self.homeLowerMoveStateButton = [[UIButton alloc] init];
    [self.view addSubview:self.homeLowerMoveStateButton];
    [self.homeLowerMoveStateButton addTarget:self action:@selector(moveToSettingState) forControlEvents:UIControlEventTouchUpInside];
    
    self.settingsUpperMoveStateButton = [[UIButton alloc] init];
    [self.view addSubview:self.settingsUpperMoveStateButton];
    [self.settingsUpperMoveStateButton addTarget:self action:@selector(moveToHomeState) forControlEvents:UIControlEventTouchUpInside];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
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
                                             selector:@selector(responseToRecordPressedFromWatch:)
                                                 name:kNotificationKeyRecordPressedFromWatch
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(responseToApplicationDidBecomeActive:)
                                                 name:kNotificationKeyApplicationDidBecomeActive
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(responseToAVAudioSessionInterruption:)
                                                 name:AVAudioSessionInterruptionNotification
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(responseToAVAudioSessionRouteChange:)
                                                 name:AVAudioSessionRouteChangeNotification
                                               object:nil];
}

- (void)responseToRecordPressedFromWatch:(NSNotification *)notification {
    if (self.recorderController.recordingState == RecorderControllerStateRecording) {
        [self pauseRecordingShouldAnimate:YES shouldShowOtherStates:YES completionBlockWhenRecordingIsSaved:nil];
    } else {
        [[PlayerController sharedPlayer] pauseAudio];
        
        if ([[NSUserDefaults standardUserDefaults] boolForKey:kUserDefaultsKeySessionIsActive]) {
            [self startRecordingShouldAnimate:YES];
        }
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
    AVAudioSessionInterruptionType interruptionType = [notification.userInfo[AVAudioSessionInterruptionTypeKey] integerValue];
    
    if (interruptionType == AVAudioSessionInterruptionTypeBegan) {
        if (self.recorderController.recordingState == RecorderControllerStateRecording) {
            [self recordButtonPressed:self.recordButton];
            self.interruptionOccuredWhileRecording = YES;
        }
    } else if (interruptionType == AVAudioSessionInterruptionTypeEnded) {
        if (self.interruptionOccuredWhileRecording && self.recorderController.recordingState != RecorderControllerStateRecording) {
            [self recordButtonPressed:self.recordButton];
        }
        self.interruptionOccuredWhileRecording = NO;
    }
}

- (void)responseToAVAudioSessionRouteChange:(NSNotification *)notification {
    AVAudioSessionRouteChangeReason changeReason = [notification.userInfo[AVAudioSessionRouteChangeReasonKey] integerValue];
    if (changeReason == AVAudioSessionRouteChangeReasonOldDeviceUnavailable && self.recorderController.recordingState == RecorderControllerStateRecording) {
        [self pauseRecordingShouldAnimate:YES shouldShowOtherStates:YES completionBlockWhenRecordingIsSaved:nil];
    }
}

- (void)pauseRecordingShouldAnimate:(BOOL)shouldAnimate shouldShowOtherStates:(BOOL)shouldShowOtherStates completionBlockWhenRecordingIsSaved:(void(^)())completion {
    [self.recorderController pauseRecording];
    if (shouldShowOtherStates) {
        self.shouldShowOtherStates = shouldShowOtherStates;
    }
    if (shouldAnimate) {
        [self animatePauseState];
    }
    __weak __typeof(self) weakSelf = self;
    [self.recorderController retrieveRecordingThenDelete:YES completion:^(Recording *recording, NSError *error) {
        if (!error) {
            [weakSelf.addNewRecordingDelegate addNewRecording:recording];
        }
        if (completion) {
            completion();
        }
    }];
}

- (void)startRecordingShouldAnimate:(BOOL)shouldAnimate {
    if (![[NSUserDefaults standardUserDefaults] boolForKey:kUserDefaultsKeySessionIsActive]) {
        return;
    }
    
    AudioSessionController *audioSessionController = [AudioSessionController sharedAudioSessionController];
    BOOL accessDetermined = [audioSessionController hasMicrophonePermissionBeenDetermined];
    if (accessDetermined) {
        
        BOOL accessGranted = [audioSessionController hasMicrophonePermissionBeenGranted];
        if (accessGranted) {
            BOOL success = [self.recorderController startRecording];
            if (success) {
                NSInteger maxRecordingLength = [[NSUserDefaults standardUserDefaults] integerForKey:kUserDefaultsKeyMaxRecordingLength];
                [[RemoteCommandCenterController sharedRCCController] setDelegate:self];
                [[RemoteCommandCenterController sharedRCCController] showRemoteTitle:@"RECORDING"
                                                                         createdDate:nil
                                                                            duration:@(maxRecordingLength)
                                                                         elapsedTime:@0
                                                                            forstate:RemoteCommandCenterControllerStateRecording];
                if (shouldAnimate) {
                    [self animateRecordingState];
                }
            }
        } else {
            [self animatePauseState];
            [MicrophoneAccessRequiredViewController showMicrophoneAccessRequiredViewControllerWithPresenter:self];
        }
    } else {
//        [audioSessionController requestMicrophonePermissionWithCompletion:^{
//            if (!self.justAskedForPermission) {
//            [self startRecordingShouldAnimate:shouldAnimate];
//            }
//            self.justAskedForPermission = YES;
//        }];
    }
}

- (void)saveAndStartRecording {
    self.tryingToStopAndStartRecorder = YES;

    [self pauseRecordingShouldAnimate:NO shouldShowOtherStates:YES completionBlockWhenRecordingIsSaved:^{
        [self startRecordingShouldAnimate:NO];
        self.tryingToStopAndStartRecorder = NO;
    }];
}

#pragma mark - Record Pressed

- (void)recordButtonPressed:(UIButton *)sender {
    if (self.recordButtonEnabled) {
        switch (self.recorderController.recordingState) {
            case RecorderControllerStateStopped:
            case RecorderControllerStatePaused:
                // time to record
                [[PlayerController sharedPlayer] pauseAudio];
                
                if ([[NSUserDefaults standardUserDefaults] boolForKey:kUserDefaultsKeySessionIsActive]) {
                    [self startRecordingShouldAnimate:YES];
                }
                
                break;
                
            case RecorderControllerStateRecording: {
                // time to stop
                [self pauseRecordingShouldAnimate:YES shouldShowOtherStates:YES completionBlockWhenRecordingIsSaved:nil];
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
    [self setupRecordButtonRotator];
    
    if (!self.movingFromNoRecordingsState) {
        [self goToRecordButtonOnlyStateShouldAnimate:YES];
    } else {
        self.movingFromNoRecordingsState = NO;
    }
    
    self.recordTime.text = @"0:00";
    self.recordTime.alpha = 1;
    
    [self.displayLinkController addSubscriberWithKey:@"recordButton"];
}

- (void)animatePauseState {
    self.recordTime.alpha = 0;
    [self.displayLinkController removeSubscriberWithKey:@"recordButton"];
    self.pulsingValues = nil;
    
    [UIView animateWithDuration:.5f animations:^{
        if (self.shouldShowOtherStates) {
            self.backgroundImageView.frame = self.backgroundImageViewOriginalFrame;
            self.gearsCircleImageView.frame = self.gearImageViewOriginalFrame;
        }
        self.recordButtonRotator.transform = CGAffineTransformMakeScale(0.1, 0.1);
        self.recordButton.transform = CGAffineTransformIdentity;
        self.recordTime.alpha = 0;
    } completion:^(BOOL finished) {
        [self.view addSubview:self.recordButton];
        self.recordButton.frame = self.recordButtonOriginalFrame;
        [self.recordButtonRotator pop_removeAllAnimations];
        [self.recordButtonRotator removeFromSuperview];
        [self.transitionView removeFromSuperview];
        if (self.shouldShowOtherStates) {
            [self.view addGestureRecognizer:self.panGesture];
        }
    }];
}

- (void)goToRecordButtonOnlyStateShouldAnimate:(BOOL)animate {
    //setup transition view to hold record button stationary
    self.transitionView = [[UIView alloc] initWithFrame:self.view.window.bounds];
    [self.view addSubview:self.transitionView];
    self.transitionView.center = self.recordButton.center;
    [self.transitionView addSubview:self.recordButton];
    self.recordButton.center = self.view.window.center;//CGRectMake(0, 0, 256, 256);
    
    CGPoint recordTimeCenter = CGPointMake(CGRectGetWidth(self.recordButton.bounds)/2, CGRectGetHeight(self.recordButton.bounds)/2);
    recordTimeCenter.y += self.recordButton.bounds.size.height*.30;
    self.recordTime.center = recordTimeCenter;
    
    //now take these views and get them outta here
    CGFloat fullCircle = self.recordButton.frame.size.height;
    CGRect mainFrame = self.backgroundImageView.frame;
    mainFrame.origin.y -= fullCircle;
    CGRect gearFrame = self.gearsCircleImageView.frame;
    gearFrame.origin.y += fullCircle;
    
    if (animate) {
        [UIView animateWithDuration:.25f animations:^{
            self.backgroundImageView.frame = mainFrame;
            self.gearsCircleImageView.frame = gearFrame;
        } completion:^(BOOL finished) {
            
        }];
    } else {
        self.backgroundImageView.frame = mainFrame;
        self.gearsCircleImageView.frame = gearFrame;
    }
    
    
    [self.view removeGestureRecognizer:self.panGesture];
}

- (void)goToNoRecordingState {
    self.shouldShowOtherStates = NO;
    [self goToRecordButtonOnlyStateShouldAnimate:YES];
    self.movingFromNoRecordingsState = YES;
}

- (void)popAnimationCompleted {
//    if (self.recorderController.recordingState == RecorderControllerStateRecording && self.view.frame.origin.y == [self backgroundImageHomeStateYOffset]) {
//        [self performSelector:@selector(animateRecordingState) withObject:nil afterDelay:1.0f];
//    }
    
    [self.displayLinkController removeSubscriberWithKey:@"gears"];
    
    if (self.currentPositionState == PositionStateHome) {
        self.recordButtonEnabled = YES;
    }
    
    if (self.startRecordingWhenAnimationCompletes && self.recorderController.recordingState != RecorderControllerStateRecording) {
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
        self.recordingsLowerMoveStateButton.enabled = NO;
        self.homeUpperMoveStateButton.enabled = NO;
        self.homeLowerMoveStateButton.enabled = NO;
        self.settingsUpperMoveStateButton.enabled = NO;
        
    } else if (gestureRecognizer.state == UIGestureRecognizerStateChanged) {
        CGPoint translation = [gestureRecognizer translationInView:gestureRecognizer.view];
        
        // check to see if we are in the intended app zone, if not slow panning to half
        if ([self isWithinAppArea]) {
            [self.movementDelegate moveWithTranslation:translation];
        } else {
            translation.y = translation.y/2;
            [self.movementDelegate moveWithTranslation:translation];
        }
        
        [gestureRecognizer setTranslation:CGPointMake(0, 0) inView:gestureRecognizer.view];
        
    } else if (gestureRecognizer.state == UIGestureRecognizerStateEnded || gestureRecognizer.state == UIGestureRecognizerStateCancelled) {
        self.recordingsLowerMoveStateButton.enabled = YES;
        self.homeUpperMoveStateButton.enabled = YES;
        self.homeLowerMoveStateButton.enabled = YES;
        self.settingsUpperMoveStateButton.enabled = YES;
        
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

#pragma mark - RemoteCommandCenterControllerDelegate

- (MPRemoteCommandHandlerStatus)pauseCommand {
    if (self.recorderController.recordingState == RecorderControllerStateRecording) {
        [self pauseRecordingShouldAnimate:YES shouldShowOtherStates:YES completionBlockWhenRecordingIsSaved:nil];
        return MPRemoteCommandHandlerStatusSuccess;
    } else {
        return MPRemoteCommandHandlerStatusCommandFailed;
    }
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
    
    self.recordButtonOriginalFrame = self.recordButton.frame;
    self.gearImageViewOriginalFrame = self.gearsCircleImageView.frame;
    self.backgroundImageViewOriginalFrame = self.backgroundImageView.frame;
    
    BOOL weHaveRecordings = [[DataSourceController sharedDataSource] numberOfRecordings];
    if (!weHaveRecordings) {
        [self goToRecordButtonOnlyStateShouldAnimate:NO];
        self.movingFromNoRecordingsState = YES;
    }
    
    float gestureSizeWidthConstant = windowHeight * 0.4f; // 0.4
    float gestureSizeHeightConstant = windowHeight * 0.18f;
    float baseVerticalAdjustment = 0 - self.view.frame.origin.y;
    
    self.recordingsLowerMoveStateButton.frame = CGRectMake(windowWidth/2 - gestureSizeWidthConstant/2,
                                                           baseVerticalAdjustment - gestureSizeHeightConstant - windowHeight*0.06f,
                                                           gestureSizeWidthConstant,
                                                           gestureSizeHeightConstant);
    
    self.homeUpperMoveStateButton.frame = CGRectMake(windowWidth/2.0f - gestureSizeWidthConstant/2,
                                                        baseVerticalAdjustment - windowHeight*0.008f,
                                                        gestureSizeWidthConstant,
                                                        gestureSizeHeightConstant);
    
    self.homeLowerMoveStateButton.frame = CGRectMake(windowWidth/2 - gestureSizeWidthConstant/2,
                                                     baseVerticalAdjustment - gestureSizeHeightConstant + windowHeight * 1.09 - windowHeight*0.065f,
                                                     gestureSizeWidthConstant,
                                                     gestureSizeHeightConstant);
    
    self.settingsUpperMoveStateButton.frame = CGRectMake(windowWidth/2 - gestureSizeWidthConstant/2,
                                                      baseVerticalAdjustment + windowHeight*1.09f - windowHeight*0.015f,
                                                      gestureSizeWidthConstant,
                                                      gestureSizeHeightConstant);
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

- (BOOL)isWithinAppArea {
    return (self.view.frame.origin.y < [self backgroundImageRecordingsStateYOffset] && self.view.frame.origin.y > [self backgroundImageSettingsStateYOffset]);
}

#pragma mark - Adjusting views during pan Translation

- (void)adjustFrameBasedOnTranslation:(CGPoint)translation {
    CGRect frame = self.view.frame;
    frame.origin.y += translation.y;
    self.view.frame = frame;
    
    [self rotateGearsWithYTranslation:translation.y];
}

- (void)rotateGearsWithYTranslation:(CGFloat)yTranslation {
    [self.gearsImageView moveGearsWithRotationAngle:yTranslation];
}

- (void)handleDisplayLinkAnimation:(CADisplayLink *)displayLink {
    if (self.recorderController.recordingState == RecorderControllerStateRecording || self.tryingToStopAndStartRecorder) {
        
        CGFloat avgDB = [self.recorderController averagePowerForChannelZero];
        CGFloat transformCoefficient = 1.2 - (((avgDB + 40) / 40) * 0.4f);
        
        [self.pulsingValues addObject:@(transformCoefficient)];
        if (self.pulsingValues.count > 15) {
            [self.pulsingValues removeObjectAtIndex:0];
        }
        
        float averagedTransformCoefficient = 0.0f;
        for (NSNumber *savedPulseCoefficient in self.pulsingValues) {
            averagedTransformCoefficient += savedPulseCoefficient.floatValue;
        }
        
        averagedTransformCoefficient /= self.pulsingValues.count;
        
        if (growForLouderNoises) {
            float difference = 1.2 - averagedTransformCoefficient;
            averagedTransformCoefficient = 1.0 + difference;
        }
        
        self.recordButton.transform = CGAffineTransformMakeScale(averagedTransformCoefficient, averagedTransformCoefficient);
        
        [self setRecordingTimeText];
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

#pragma mark - Helper Methods

- (void)setupRecordButtonRotator {
    self.recordButtonRotator = [[UIImageView alloc] initWithImage:[WireTapStyleKit imageOfRecordButtonRotator]];
    self.recordButtonRotator.userInteractionEnabled = NO;
    self.recordButtonRotator.frame = self.recordButton.bounds;
    //make it small so it can grow into view
    self.recordButtonRotator.transform = CGAffineTransformMakeScale(0.5, 0.5);
    [self.recordButton addSubview:self.recordButtonRotator];
    [self.recordButton sendSubviewToBack:self.recordButtonRotator];
    
    CABasicAnimation* animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    //start it at a random location around the record button
    CGFloat randomAngle = arc4random_uniform(360);
    animation.fromValue = [NSNumber numberWithFloat:randomAngle];
    animation.toValue = [NSNumber numberWithFloat: randomAngle + 2*M_PI];
    animation.duration = 6.0f;
    animation.repeatCount = 120000;
    [self.recordButtonRotator.layer addAnimation:animation forKey:@"MyAnimation"];
    
    [UIView animateWithDuration:.25 animations:^{
        self.recordButtonRotator.transform = CGAffineTransformMakeScale(1, 1);
    }];
}

- (void)setRecordingTimeText {
    if (![self.recordTime.text isEqualToString:self.recorderController.currentRecordingTimeAsString]) {
        [[RemoteCommandCenterController sharedRCCController] showRemoteElapsedPlaybackTime:@(self.recorderController.currentRecordingTime)];
        
        self.recordTime.text = self.recorderController.currentRecordingTimeAsString;
        
        NSTimeInterval maxRecordingLength = [[NSUserDefaults standardUserDefaults] integerForKey:kUserDefaultsKeyMaxRecordingLength];
        BOOL maximumReached = self.recorderController.currentRecordingTime >= maxRecordingLength;
        if (maximumReached && !self.tryingToStopAndStartRecorder) {
            [self saveAndStartRecording];
        }
    }
}

- (NSMutableArray *)pulsingValues {
    if (!_pulsingValues) {
        _pulsingValues = [NSMutableArray new];
        for (int i = 0; i < 15; i++) {
            [_pulsingValues addObject:(growForLouderNoises) ? @1.2 : @1];
        }
    }
    return _pulsingValues;
}

- (UILabel *)recordTime {
    if (!_recordTime) {
        _recordTime = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 120, 30)];
        [self.recordButton addSubview:_recordTime];
        _recordTime.text = @"0:00";
        _recordTime.textAlignment = NSTextAlignmentCenter;
        _recordTime.font = [UIFont fontWithName: @"Helvetica-Medium" size:22.0f];
        _recordTime.textColor = [UIColor blackColor];
        _recordTime.alpha = 0;
    }
    return _recordTime;
}

@end
