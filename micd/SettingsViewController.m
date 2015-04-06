#import "SettingsViewController.h"
#import "UIColor+Palette.h"
#import "WireTapStyleKit.h"
#import "SettingsView.h"
#import "PopViewAnimator.h"
#import "PresentingAnimationController.h"
#import "DismissingAnimationController.h"
#import "FeedbackViewController.h"
#import "Constants.h"
#import <MessageUI/MessageUI.h>

@interface SettingsViewController () <UIViewControllerTransitioningDelegate, MFMailComposeViewControllerDelegate, FeedbackViewControllerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *loveMicdImageView;
@property (weak, nonatomic) IBOutlet UIButton *noButton;
@property (weak, nonatomic) IBOutlet UIButton *yesButton;
@property (weak, nonatomic) IBOutlet UIButton *sendFeedbackButton;
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
    [[NSUserDefaults standardUserDefaults] setBool:NO forKey:kUserDefaultsKeyLoveMicdQuestionAnswered];
    
    [self initialSetupOfViews];
    self.isFirstTimeLayingOutSubviews = YES;
}

-(void)viewDidLayoutSubviews {
    if (self.isFirstTimeLayingOutSubviews) {
        ((SettingsView *)self.view).interactiveElements = @[self.noButton, self.yesButton, self.rememberRecordingLocationSwitch, self.startRecordingOnLaunchSwitch, self.lengthSegmentedControl, self.autoStartRecAfterMaxSwitch, self.sendFeedbackButton];
        ((SettingsView *)self.view).settingsView = self.view;
        
        self.isFirstTimeLayingOutSubviews = NO;
    }
}

- (void)initialSetupOfViews {
    self.view.backgroundColor = [UIColor clearColor];
    
    self.loveMicdImageView.image = [WireTapStyleKit imageOfLoveMicdWithColor7:[UIColor vibrantLightBlueText]];
    
    self.rememberRecordingLocationSwitch.onTintColor = [UIColor vibrantBlue];
    self.rememberRecordingLocationSwitch.tintColor = [UIColor vibrantBlue];
    self.rememberRecordingLocationLabel.textColor = [UIColor vibrantLightBlueText];
    
    self.startRecordingOnLaunchSwitch.onTintColor = [UIColor vibrantBlue];
    self.startRecordingOnLaunchSwitch.tintColor = [UIColor vibrantBlue];
    self.startRecordingOnLaunchLabel.textColor = [UIColor vibrantLightBlueText];
    
    self.autoStartRecAfterMaxSwitch.onTintColor = [UIColor vibrantBlue];
    self.autoStartRecAfterMaxSwitch.tintColor = [UIColor vibrantBlue];
    self.autoStartRecAfterMaxLabel.textColor = [UIColor vibrantLightBlueText];
    
    self.lengthSegmentedControl.tintColor = [UIColor vibrantLightBlueText];
    NSInteger maxRecordingLength = [[NSUserDefaults standardUserDefaults] integerForKey:kUserDefaultsKeyMaxRecordingLength];
    NSInteger maxRecordingLengthMinutes = maxRecordingLength/60;
    if (maxRecordingLengthMinutes == 5) {
        self.lengthSegmentedControl.selectedSegmentIndex = 0;
    } else if (maxRecordingLengthMinutes == 15) {
        self.lengthSegmentedControl.selectedSegmentIndex = 1;
    } else if (maxRecordingLengthMinutes == 30) {
        self.lengthSegmentedControl.selectedSegmentIndex = 2;
    }
    
    self.maxRecordingLengthLabel.textColor = [UIColor vibrantLightBlueText];
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    self.startRecordingOnLaunchSwitch.on = [userDefaults boolForKey:kUserDefaultsKeyStartRecordingOnAppDidBecomeActive];
    self.rememberRecordingLocationSwitch.on = [userDefaults boolForKey:kUserDefaultsKeyRecordingsSavePlaybackPosition];
    
    self.noButton.backgroundColor = [UIColor vibrantBlue];
    self.noButton.layer.cornerRadius = 5;
    
    self.yesButton.backgroundColor = [UIColor vibrantBlue];
    self.yesButton.layer.cornerRadius = 5;
    
    self.sendFeedbackButton.backgroundColor = [UIColor vibrantBlue];
    self.sendFeedbackButton.layer.cornerRadius = 5;
    
    [self refreshFeedBackViews];
}

- (void)refreshFeedBackViews {
    BOOL questionHasBeenAnswered = [[NSUserDefaults standardUserDefaults] boolForKey:kUserDefaultsKeyLoveMicdQuestionAnswered];
    self.yesButton.hidden = questionHasBeenAnswered;
    self.noButton.hidden = questionHasBeenAnswered;
    self.sendFeedbackButton.hidden = !questionHasBeenAnswered;
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

- (IBAction)maxRecordingLengthSegmentedControl:(UISegmentedControl *)sender {
    NSString *selectedSegmentTitle = [sender titleForSegmentAtIndex:sender.selectedSegmentIndex];
    NSInteger maxRecordingLength = [selectedSegmentTitle integerValue] * 60;
    [[NSUserDefaults standardUserDefaults] setInteger:maxRecordingLength forKey:kUserDefaultsKeyMaxRecordingLength];
}

- (IBAction)autoStartRecordingAfterMaximumReachedSwitch:(UISwitch *)sender {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setBool:sender.on forKey:kUserDefaultsKeyAutoStartRecordingAfterMaximumReached];
}

- (IBAction)noTapped:(id)sender {
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:kUserDefaultsKeyLoveMicdQuestionAnswered];
    [self setupPopoverViewForAnswer:NO];
}

- (IBAction)yesTapped:(id)sender {
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:kUserDefaultsKeyLoveMicdQuestionAnswered];
    [self setupPopoverViewForAnswer:YES];
}

- (IBAction)emailUsTapped:(id)sender {
    [self showMailComposer:nil];
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
//    FeedbackViewController *popoverVC = [self.storyboard instantiateViewControllerWithIdentifier:@"popover"];
//    popoverVC.lovesMicd = answer;
//    popoverVC.delegate = self;
    
    FeedbackViewController *popoverVC = [[FeedbackViewController alloc] initWithLovesMicd:answer delegate:self];
    popoverVC.transitioningDelegate = self;
    popoverVC.modalPresentationStyle = UIModalPresentationCustom;
    [self presentViewController:popoverVC animated:YES completion:^{
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

#pragma mark - FeedbackViewControllerDelegate

- (void)nevermind:(FeedbackViewController *)popoverViewController {
    [self refreshFeedBackViews];
    
    [popoverViewController.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

- (void)showMailComposer:(FeedbackViewController *)popoverViewController {
    if ([MFMailComposeViewController canSendMail]) {
        MFMailComposeViewController *mail = [[MFMailComposeViewController alloc] init];
        mail.mailComposeDelegate = self;
        [mail setSubject:@"Some thoughts on Mic'd"];
        [mail setMessageBody:@"Some Text" isHTML:NO];
        [mail setToRecipients:@[@"micdfeedback@gmail.com"]];
        
        if (popoverViewController) {
            [self dismissViewControllerAnimated:YES completion:^{
                [self presentViewController:mail animated:YES completion:^{
                    [self refreshFeedBackViews];
                }];
            }];
        } else {
            [self presentViewController:mail animated:YES completion:nil];
        }
    } else {
        NSLog(@"This device cannot send email");
    }
}

- (void)showAppStore:(FeedbackViewController *)popoverViewController {
    [self refreshFeedBackViews];
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - MFMailComposeViewControllerDelegate

- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error {
    switch (result) {
        case MFMailComposeResultSent:
            NSLog(@"You sent the email.");
            break;
        case MFMailComposeResultSaved:
            NSLog(@"You saved a draft of this email");
            break;
        case MFMailComposeResultCancelled:
            NSLog(@"You cancelled sending this email.");
            break;
        case MFMailComposeResultFailed:
            NSLog(@"Mail failed:  An error occurred when trying to compose this email");
            break;
        default:
            NSLog(@"An error occurred when trying to compose this email");
            break;
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
