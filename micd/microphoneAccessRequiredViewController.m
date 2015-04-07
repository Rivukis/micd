#import "MicrophoneAccessRequiredViewController.h"
#import "UIColor+Palette.h"

@interface MicrophoneAccessRequiredViewController ()
@property (weak, nonatomic) IBOutlet UIButton *goToSettingsButton;
@property (weak, nonatomic) IBOutlet UIButton *dismissButton;
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) UIViewController *presenter;
@end

@implementation MicrophoneAccessRequiredViewController

+ (void)showMicrophoneAccessRequiredViewControllerWithPresenter:(UIViewController *)presenter {
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    MicrophoneAccessRequiredViewController *viewController = [mainStoryboard instantiateViewControllerWithIdentifier:@"MicrophoneAccessRequiredViewController"];
    viewController.presenter = presenter;
    
    [viewController.presenter presentViewController:viewController animated:YES completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.layer.cornerRadius = 10;
    self.view.layer.borderColor = [[UIColor vibrantLightBlueText] CGColor];
    self.view.layer.borderWidth = 2;
    self.view.backgroundColor = [UIColor blackColor];

    NSURL *url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
    if ([[UIApplication sharedApplication] canOpenURL:url]) {
        self.goToSettingsButton.backgroundColor = [UIColor vibrantLightBlueText];
        [self.goToSettingsButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.goToSettingsButton.layer.cornerRadius = 5;
        self.goToSettingsButton.hidden = NO;
    } else {
        self.goToSettingsButton.hidden = YES;
    }
    
    self.dismissButton.backgroundColor = [UIColor vibrantLightBlueText];
    [self.dismissButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.dismissButton.layer.cornerRadius = 5;
    
    self.label.textColor = [UIColor vibrantLightBlueText];
    self.label.textAlignment = NSTextAlignmentCenter;
    self.label.text = @"This app requires access to your device's Microphone.\n\nPlease enable Microphone access for this app in Settings / Privacy / Microphone";
}

- (IBAction)goToSettingsPressed:(UIButton *)sender {
    // go to settings
    NSURL *url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
    [[UIApplication sharedApplication] openURL:url];
    [self.presenter dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)dismissPressed:(UIButton *)sender {
    [self.presenter dismissViewControllerAnimated:YES completion:nil];
}


@end
