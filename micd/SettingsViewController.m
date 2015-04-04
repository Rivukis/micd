#import "SettingsViewController.h"
#import "UIColor+Palette.h"
#import "WireTapStyleKit.h"
#import "SettingsView.h"
#import "PopViewAnimator.h"
#import "Constants.h"

@interface SettingsViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *loveMicdImageView;
@property (weak, nonatomic) IBOutlet UIButton *noButton;
@property (weak, nonatomic) IBOutlet UIButton *yesButton;
@property (weak, nonatomic) IBOutlet UISwitch *rememberRecordingLocationSwitch;
@property (weak, nonatomic) IBOutlet UILabel *rememberRecordingLocationLabel;
@property (weak, nonatomic) IBOutlet UISwitch *startRecordingOnLaunchSwitch;
@property (weak, nonatomic) IBOutlet UILabel *startRecordingOnLaunchLabel;

@property (assign, nonatomic) BOOL isFirstTimeLayingOutSubviews;
@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initialSetupOfViews];
    
    self.isFirstTimeLayingOutSubviews = YES;
}

-(void)viewDidLayoutSubviews {
    if (self.isFirstTimeLayingOutSubviews) {
        ((SettingsView *)self.view).interactiveElements = @[self.noButton, self.yesButton, self.rememberRecordingLocationSwitch, self.startRecordingOnLaunchSwitch];
        ((SettingsView *)self.view).settingsView = self.view;
        
        self.isFirstTimeLayingOutSubviews = NO;
    }
}

- (void)initialSetupOfViews {
    self.view.backgroundColor = [UIColor clearColor];
    self.loveMicdImageView.image = [WireTapStyleKit imageOfLoveMicd];
    self.noButton.backgroundColor = [UIColor vibrantBlue];
    self.yesButton.backgroundColor = [UIColor vibrantBlue];
    self.rememberRecordingLocationSwitch.onTintColor = [UIColor vibrantBlue];
    self.startRecordingOnLaunchSwitch.onTintColor = [UIColor vibrantBlue];
    self.rememberRecordingLocationLabel.textColor = [UIColor vibrantBlue];
    self.startRecordingOnLaunchLabel.textColor = [UIColor vibrantBlue];
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    self.startRecordingOnLaunchSwitch.on = [userDefaults boolForKey:kUserDefaultsKeyStartRecordingOnAppDidBecomeActive];
    self.rememberRecordingLocationSwitch.on = [userDefaults boolForKey:kUserDefaultsKeyRecordingsSavePlaybackPosition];
    
    [self testmethod];
    
    self.noButton.layer.cornerRadius = 5;
    self.yesButton.layer.cornerRadius = 5;
}

#pragma mark - User Action Methods

- (IBAction)recordingsSavePlaybackPositionSwitchValueChanged:(UISwitch *)sender {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setBool:sender.on forKey:kUserDefaultsKeyRecordingsSavePlaybackPosition];
    [self testmethod];
}

- (IBAction)startRecordingOnAppDidBecomeActiveSwitchValueChanged:(UISwitch *)sender {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setBool:sender.on forKey:kUserDefaultsKeyStartRecordingOnAppDidBecomeActive];
    [self testmethod];
}

- (void)testmethod {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    BOOL savePlayback = [userDefaults boolForKey:kUserDefaultsKeyRecordingsSavePlaybackPosition];
    BOOL recordOnStart = [userDefaults boolForKey:kUserDefaultsKeyStartRecordingOnAppDidBecomeActive];
    
    NSLog(@"save playback: %i, record on start: %i", savePlayback, recordOnStart);
}

- (IBAction)noTapped:(id)sender {
    [self addButtonBounceAnimationToView:self.noButton];
}

- (IBAction)yesTapped:(id)sender {
    [self addButtonBounceAnimationToView:self.yesButton];
}

- (void)addButtonBounceAnimationToView:(UIView *)view {
    view.transform = CGAffineTransformIdentity;
    POPSpringAnimation *buttonPressedAnimation = [PopViewAnimator springAnimationButtonBounce];
    [view pop_addAnimation:buttonPressedAnimation forKey:@"buttonBounce"];
}

#pragma mark - FramesBasedOnStateProtocol

-(void)setInitialStateFrame {
    CGRect screenSize = [[UIScreen mainScreen] bounds];
    self.view.frame = CGRectMake(0,
                                 (self.view.window.frame.size.height * 1.068f),
                                 self.view.window.frame.size.width,
                                 screenSize.size.height);
}

- (CGRect)frameForState:(PositionState)state {
    CGRect futureFrame = self.view.frame;
    switch (state) {
        case PositionStateHome:
            futureFrame.origin.y = (self.view.window.frame.size.height * 1.068f);
            break;
        case PositionStateRecordings:
            futureFrame.origin.y = (self.view.window.frame.size.height * 1.068f * 2);
            break;
        case PositionStateSettings:
            futureFrame.origin.y = 0;
            break;
        default:
            break;
    }
    return futureFrame;
}

-(void)adjustFrameBasedOnTranslation:(CGPoint)translation {
    CGRect frame = self.view.frame;
    frame.origin.y += translation.y;
    self.view.frame = frame;
}

@end
