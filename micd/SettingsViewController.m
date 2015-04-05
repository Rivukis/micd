#import "SettingsViewController.h"
#import "UIColor+Palette.h"
#import "WireTapStyleKit.h"
#import "SettingsView.h"
#import "PopViewAnimator.h"
#import "PresentingAnimationController.h"
#import "DismissingAnimationController.h"
#import "PopoverViewController.h"
#import "Constants.h"

@interface SettingsViewController () <UIViewControllerTransitioningDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *loveMicdImageView;
@property (weak, nonatomic) IBOutlet UIButton *noButton;
@property (weak, nonatomic) IBOutlet UIButton *yesButton;
@property (weak, nonatomic) IBOutlet UISwitch *rememberRecordingLocationSwitch;
@property (weak, nonatomic) IBOutlet UILabel *rememberRecordingLocationLabel;
@property (weak, nonatomic) IBOutlet UISwitch *startRecordingOnLaunchSwitch;
@property (weak, nonatomic) IBOutlet UILabel *startRecordingOnLaunchLabel;
@property (weak, nonatomic) IBOutlet UILabel *maxRecordingLengthLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *lengthSegmentedControl;
@property (weak, nonatomic) IBOutlet UILabel *autoStartRecAfterMaxLabel;
@property (weak, nonatomic) IBOutlet UISwitch *autoStartRecAfterMaxSwitch;

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
        ((SettingsView *)self.view).interactiveElements = @[self.noButton, self.yesButton, self.rememberRecordingLocationSwitch, self.startRecordingOnLaunchSwitch, self.lengthSegmentedControl, self.autoStartRecAfterMaxSwitch];
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
    self.rememberRecordingLocationSwitch.tintColor = [UIColor vibrantBlue];
    self.startRecordingOnLaunchSwitch.onTintColor = [UIColor vibrantBlue];
    self.startRecordingOnLaunchSwitch.tintColor = [UIColor vibrantBlue];
    self.rememberRecordingLocationLabel.textColor = [UIColor vibrantLightBlueText];
    self.startRecordingOnLaunchLabel.textColor = [UIColor vibrantLightBlueText];
    self.maxRecordingLengthLabel.textColor = [UIColor vibrantLightBlueText];
    self.autoStartRecAfterMaxLabel.textColor = [UIColor vibrantLightBlueText];
    self.autoStartRecAfterMaxSwitch.onTintColor = [UIColor vibrantBlue];
    self.autoStartRecAfterMaxSwitch.tintColor = [UIColor vibrantBlue];
    self.lengthSegmentedControl.tintColor = [UIColor vibrantLightBlueText];
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    self.startRecordingOnLaunchSwitch.on = [userDefaults boolForKey:kUserDefaultsKeyStartRecordingOnAppDidBecomeActive];
    self.rememberRecordingLocationSwitch.on = [userDefaults boolForKey:kUserDefaultsKeyRecordingsSavePlaybackPosition];
    
    self.noButton.layer.cornerRadius = 5;
    self.yesButton.layer.cornerRadius = 5;
}

#pragma mark - User Action Methods

- (IBAction)recordingsSavePlaybackPositionSwitchValueChanged:(UISwitch *)sender {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setBool:sender.on forKey:kUserDefaultsKeyRecordingsSavePlaybackPosition];
}

- (IBAction)startRecordingOnAppDidBecomeActiveSwitchValueChanged:(UISwitch *)sender {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setBool:sender.on forKey:kUserDefaultsKeyStartRecordingOnAppDidBecomeActive];
}

- (IBAction)noTapped:(id)sender {
    [self setupPopoverViewForAnswer:NO];
}

- (IBAction)yesTapped:(id)sender {
    [self setupPopoverViewForAnswer:YES];
}

- (void)addButtonBounceAnimationToView:(UIView *)view {
    POPSpringAnimation *buttonPressedAnimation = [PopViewAnimator springAnimationButtonBounce];
    [view.layer pop_addAnimation:buttonPressedAnimation forKey:@"buttonBounce"];
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

#pragma mark - Transitioning Delegate

- (void)setupPopoverViewForAnswer:(BOOL)answer {
    PopoverViewController *popoverVC = [self.storyboard instantiateViewControllerWithIdentifier:@"popover"];
    popoverVC.didSayYes = answer;
    popoverVC.transitioningDelegate = self;
    popoverVC.modalPresentationStyle = UIModalPresentationCustom;
    [self presentViewController:popoverVC animated:YES completion:^{
        self.loveMicdImageView.hidden = YES;
        self.yesButton.hidden = YES;
        self.noButton.hidden = YES;
    }];
}

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    return [[PresentingAnimationController alloc] init];
}

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    return [[DismissingAnimationController alloc] init];
}

@end
