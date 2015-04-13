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

static CGFloat const kCurrentBackgroundImageHeight = 2755;
static CGFloat const kCurrentBackgroundImageWidth = 375.0f;

static BOOL const growForLouderNoises = YES;

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
@property (nonatomic) CGRect recordButtonOriginalFrame;
@property (nonatomic) CGRect backgroundImageViewOriginalFrame;
@property (nonatomic) CGRect gearImageViewOriginalFrame;
@property (nonatomic, strong) UILabel *recordTime;

@property (nonatomic) BOOL recordButtonEnabled;
@property (assign, nonatomic) BOOL startRecordingWhenAnimationCompletes;
@property (assign, nonatomic) BOOL movingFromNoRecordingsState;

@property (nonatomic, assign) BOOL interruptionOccuredWhileRecording;
@property (nonatomic, assign) BOOL tryingToStopAndStartRecorder;
@property (nonatomic, assign) BOOL shouldMoveToHomeStateOnAppLaunch;

@property (nonatomic, assign) NSInteger currentRecordingPart;
@property (nonatomic, strong) NSDate *continuationDate;

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
    
    [self.recordButton addSubview:self.recordButtonRotator];
    [self.recordButton sendSubviewToBack:self.recordButtonRotator];
    
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
    BOOL isOnHomeScreen = self.view.frame.origin.y == [self backgroundImageHomeStateYOffset];
    BOOL isApplicationActive = [[UIApplication sharedApplication] applicationState] == UIApplicationStateActive;
    BOOL isRecording = self.recorderController.recordingState == RecorderControllerStateRecording;
    
    if (isRecording) {
        [self pauseRecordingShouldAnimate:isApplicationActive shouldShowCircles:YES completionBlockWhenRecordingIsSaved:nil];
        return;
    }
    
    if (isOnHomeScreen) {
        [self startRecordingShouldAnimate:isApplicationActive];
        return;
    }
    
    if (isApplicationActive) {
        self.startRecordingWhenAnimationCompletes = YES;
        [self moveToHomeState];
    } else {
        self.shouldMoveToHomeStateOnAppLaunch = YES;
        [self startRecordingShouldAnimate:NO];
    }
}

- (void)responseToApplicationDidBecomeActive:(NSNotification *)notification {
    if (self.recorderController.recordingState == RecorderControllerStateRecording || self.shouldMoveToHomeStateOnAppLaunch) {
        self.shouldMoveToHomeStateOnAppLaunch = NO;
        [self moveToHomeState];
        return;
    }
    
    BOOL autoRecordOnLaunch = [[NSUserDefaults standardUserDefaults] boolForKey:kUserDefaultsKeyStartRecordingOnAppDidBecomeActive];
    if (autoRecordOnLaunch) {
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
        [self pauseRecordingShouldAnimate:YES shouldShowCircles:YES completionBlockWhenRecordingIsSaved:nil];
    }
}

#pragma mark - Helper Methods

- (void)startRecordingShouldAnimate:(BOOL)shouldAnimate {
    if (self.recorderController.recordingState == RecorderControllerStateRecording) {
        [self goToRecordingStateAnimateChange:shouldAnimate];
        return;
    }
    
    if (![[NSUserDefaults standardUserDefaults] boolForKey:kUserDefaultsKeySessionIsActive]) {
        return;
    }
    
    AudioSessionController *audioSessionController = [AudioSessionController sharedAudioSessionController];
    BOOL accessDetermined = [audioSessionController hasMicrophonePermissionBeenDetermined];
    if (!accessDetermined) {
        [audioSessionController requestMicrophonePermissionWithCompletion:nil];
        return;
    }
    
    BOOL accessGranted = [audioSessionController hasMicrophonePermissionBeenGranted];
    if (!accessGranted) {
        [MicrophoneAccessRequiredViewController showMicrophoneAccessRequiredViewControllerWithPresenter:self];
        return;
    }
    
    [[PlayerController sharedPlayer] pauseAudio];
    
    BOOL success = [self.recorderController startRecording];
    if (success) {
        NSInteger maxRecordingLength = [[NSUserDefaults standardUserDefaults] integerForKey:kUserDefaultsKeyMaxRecordingLength];
        [self performSelector:@selector(maxRecordingLengthReached) withObject:nil afterDelay:maxRecordingLength];
        
        [[RemoteCommandCenterController sharedRCCController] setDelegate:self];
        [[RemoteCommandCenterController sharedRCCController] showRemoteTitle:@"RECORDING"
                                                                 createdDate:nil
                                                                    duration:@(maxRecordingLength)
                                                                 elapsedTime:@0
                                                                    forstate:RemoteCommandCenterControllerStateRecording];
        
        [self goToRecordingStateAnimateChange:shouldAnimate];
    }
}

- (void)pauseRecordingShouldAnimate:(BOOL)shouldAnimate shouldShowCircles:(BOOL)shouldShowCircles completionBlockWhenRecordingIsSaved:(void(^)())completion {
    [self.recorderController pauseRecording];
    
    [self goToPauseStateShowCircles:shouldShowCircles animateChange:shouldAnimate];
    
    __weak __typeof(self) weakSelf = self;
    [self.recorderController retrieveRecordingThenDelete:YES completion:^(Recording *recording, NSError *error) {
        
        /* ----- start
         this occurs for the last track in a 'save and continue' group
         the currentRecordingPart is not incremented because it won't go through the maxRecordingLengthReached method
         */
        if (!self.tryingToStopAndStartRecorder && self.currentRecordingPart != 0) {
            self.currentRecordingPart++;
        }
        // ----- end
        
        if (!error) {
            if (self.currentRecordingPart == 1) {
                self.continuationDate = recording.date;
            }
            if (self.currentRecordingPart > 0) {
                [recording setPart:self.currentRecordingPart withOriginalTrackDate:self.continuationDate];
            }
            [weakSelf.addNewRecordingDelegate addNewRecording:recording];
        }
        
        /* ----- start
         reset currentRecordingPart after saving,
         so the last recording in the continuation is saved as part of that group of tracks
         */
        if (!self.tryingToStopAndStartRecorder) {
            self.currentRecordingPart = 0;
        }
        // ----- end
        
        if (completion) {
            completion();
        }
    }];
}

- (void)maxRecordingLengthReached {
    BOOL startNewRecordingWhenMaxReached = [[NSUserDefaults standardUserDefaults] boolForKey:kUserDefaultsKeyAutoStartRecordingAfterMaximumReached];
    
    if (startNewRecordingWhenMaxReached) {
        self.tryingToStopAndStartRecorder = YES;
        self.currentRecordingPart++;
        
        [self pauseRecordingShouldAnimate:NO shouldShowCircles:NO completionBlockWhenRecordingIsSaved:^{
            [self startRecordingShouldAnimate:NO];
            self.tryingToStopAndStartRecorder = NO;
            
            NSTimeInterval maxRecordingLength = [[NSUserDefaults standardUserDefaults] integerForKey:kUserDefaultsKeyMaxRecordingLength];
            [self performSelector:@selector(maxRecordingLengthReached) withObject:nil afterDelay:maxRecordingLength];
        }];
    } else {
        BOOL isAppActive = [[UIApplication sharedApplication] applicationState] == UIApplicationStateActive;
        [self pauseRecordingShouldAnimate:isAppActive shouldShowCircles:YES completionBlockWhenRecordingIsSaved:nil];
    }
}

- (void)setRecordingTimeText {
    if (![self.recordTime.text isEqualToString:self.recorderController.currentRecordingTimeAsString]) {
        [[RemoteCommandCenterController sharedRCCController] showRemoteElapsedPlaybackTime:@(self.recorderController.currentRecordingTime)];
        self.recordTime.text = self.recorderController.currentRecordingTimeAsString;
    }
}

#pragma mark - Public Methods

- (void)deletedLastRemainingTrack {
    [self goToPauseStateShowCircles:NO animateChange:YES];
}

#pragma mark - User Action Methods

- (void)recordButtonPressed:(UIButton *)sender {
    if (self.recordButtonEnabled) {
        if (self.recorderController.recordingState == RecorderControllerStateRecording) {
            [self pauseRecordingShouldAnimate:YES shouldShowCircles:YES completionBlockWhenRecordingIsSaved:nil];
        } else {
            [self startRecordingShouldAnimate:YES];
        }
    }
}

#pragma mark - Animation Methods

- (void)popAnimationCompleted {
    [self.displayLinkController removeSubscriberWithKey:@"gears"];
    
    if (self.currentPositionState == PositionStateHome) {
        self.recordButtonEnabled = YES;
    }
    
    if (self.startRecordingWhenAnimationCompletes || self.recorderController.recordingState == RecorderControllerStateRecording) {
        BOOL isApplicationActive = [[UIApplication sharedApplication] applicationState] == UIApplicationStateActive;
        [self startRecordingShouldAnimate:isApplicationActive];
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
        
        if (self.recorderController.recordingState == RecorderControllerStateRecording || [[DataSourceController sharedDataSource] numberOfRecordings] == 0) {
            [self moveToHomeState];
            return;
        }
        
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

-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    DataSourceController *dataSource = [DataSourceController sharedDataSource];
    if (touch.view == self.recordButton || self.recorderController.recordingState == RecorderControllerStateRecording || dataSource.numberOfRecordings == 0) {
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
        [self pauseRecordingShouldAnimate:YES shouldShowCircles:YES completionBlockWhenRecordingIsSaved:nil];
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
    
    self.recordButtonRotator.frame = self.recordButton.bounds;
    
    CGPoint recordTimeCenter = CGPointMake(CGRectGetWidth(self.recordButton.bounds)/2, CGRectGetHeight(self.recordButton.bounds)/2);
    recordTimeCenter.y += self.recordButton.bounds.size.height*.30;
    self.recordTime.center = recordTimeCenter;
    
    CGRect gearsFrame = self.recordButton.frame;
    gearsFrame.origin.y += windowHeight/2.0f * 1.1f;
    self.gearsCircleImageView.frame = gearsFrame;
    self.gearsImageView.frame = self.gearsCircleImageView.bounds;
    
    self.currentPositionState = PositionStateHome;
    
    self.recordButtonOriginalFrame = self.recordButton.frame;
    self.gearImageViewOriginalFrame = self.gearsCircleImageView.frame;
    self.backgroundImageViewOriginalFrame = self.backgroundImageView.frame;
    
    BOOL weHaveRecordings = [[DataSourceController sharedDataSource] numberOfRecordings];
    [self goToPauseStateShowCircles:weHaveRecordings animateChange:NO];
    
    float gestureSizeWidthConstant = windowHeight * 0.4f; // 0.4
    float gestureSizeHeightConstant = windowHeight * 0.155f;
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

#pragma mark - Lazy Instantiation

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

- (UIImageView *)recordButtonRotator {
    if (!_recordButtonRotator) {
        _recordButtonRotator = [[UIImageView alloc] initWithImage:[WireTapStyleKit imageOfRecordButtonRotator]];
        _recordButtonRotator.userInteractionEnabled = NO;
    }
    return _recordButtonRotator;
}

#pragma mark - new shiz

- (void)goToRecordingStateAnimateChange:(BOOL)shouldAnimate {
    self.recordingsLowerMoveStateButton.enabled = NO;
    self.homeUpperMoveStateButton.enabled = NO;
    self.homeLowerMoveStateButton.enabled = NO;
    self.settingsUpperMoveStateButton.enabled = NO;
    
    CGRect backgroundImageFrame = self.backgroundImageViewOriginalFrame;
    CGRect gearFrame = self.gearImageViewOriginalFrame;
    CGFloat fullCircleHeight = CGRectGetHeight(self.gearImageViewOriginalFrame);
    backgroundImageFrame.origin.y -= fullCircleHeight;
    gearFrame.origin.y += fullCircleHeight;
    
    if (shouldAnimate) {
        [UIView animateWithDuration:.25f animations:^{
            self.backgroundImageView.frame = backgroundImageFrame;
            self.gearsCircleImageView.frame = gearFrame;
        } completion:nil];
        
    } else {
        self.backgroundImageView.frame = backgroundImageFrame;
        self.gearsCircleImageView.frame = gearFrame;
    }
    
    CABasicAnimation* animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    //start it at a random location around the record button
    if (![self.recordButtonRotator.layer animationForKey:@"MyAnimation"]) {
        CGFloat randomAngle = arc4random_uniform(360);
        animation.fromValue = [NSNumber numberWithFloat:randomAngle];
        animation.toValue = [NSNumber numberWithFloat: randomAngle + 2*M_PI];
        animation.duration = 6.0f;
        animation.repeatCount = HUGE_VALF;
        [self.recordButtonRotator.layer addAnimation:animation forKey:@"MyAnimation"];
    }
    
    // always animate
    [UIView animateWithDuration:0.25f delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.recordButtonRotator.transform = CGAffineTransformMakeScale(1, 1);
    } completion:nil];
    
    self.recordTime.text = @"0:00";
    self.recordTime.alpha = 1;
    
    [self.displayLinkController addSubscriberWithKey:@"recordButton"];
}

- (void)goToPauseStateShowCircles:(BOOL)shouldShowCircles animateChange:(BOOL)shouldAnimate {
    self.shouldMoveToHomeStateOnAppLaunch = NO;
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(maxRecordingLengthReached) object:nil];
    [self.displayLinkController removeSubscriberWithKey:@"recordButton"];
    self.recordTime.alpha = 0;
    self.pulsingValues = nil;
    
    CGRect backgroundImageFrame = self.backgroundImageViewOriginalFrame;
    CGRect gearFrame = self.gearImageViewOriginalFrame;
    
    if (!shouldShowCircles) {
        CGFloat fullCircleHeight = CGRectGetHeight(self.gearImageViewOriginalFrame);
        backgroundImageFrame.origin.y -= fullCircleHeight;
        gearFrame.origin.y += fullCircleHeight;
    }
    
    if (shouldAnimate) {
        [UIView animateWithDuration:.25f animations:^{
            self.backgroundImageView.frame = backgroundImageFrame;
            self.gearsCircleImageView.frame = gearFrame;
            self.recordButtonRotator.transform = CGAffineTransformMakeScale(0.7f, 0.7f);
            self.recordButton.transform = CGAffineTransformIdentity;
        } completion:^(BOOL finished) {
            if (self.recorderController.recordingState != RecorderControllerStateRecording) {
                self.recordingsLowerMoveStateButton.enabled = shouldShowCircles;
                self.homeUpperMoveStateButton.enabled = shouldShowCircles;
                self.homeLowerMoveStateButton.enabled = shouldShowCircles;
                self.settingsUpperMoveStateButton.enabled = shouldShowCircles;
                [self.recordButtonRotator.layer removeAnimationForKey:@"MyAnimation"];
            }
        }];
    } else {
        self.backgroundImageView.frame = backgroundImageFrame;
        self.gearsCircleImageView.frame = gearFrame;
        self.recordButtonRotator.transform = CGAffineTransformMakeScale(0.7f, 0.7f);
        self.recordButton.transform = CGAffineTransformIdentity;
        self.recordingsLowerMoveStateButton.enabled = shouldShowCircles;
        self.homeUpperMoveStateButton.enabled = shouldShowCircles;
        self.homeLowerMoveStateButton.enabled = shouldShowCircles;
        self.settingsUpperMoveStateButton.enabled = shouldShowCircles;
        [self.recordButtonRotator.layer removeAnimationForKey:@"MyAnimation"];
    }
}

@end
