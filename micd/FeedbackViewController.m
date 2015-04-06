#import "FeedbackViewController.h"
#import "UIColor+Palette.h"

@interface FeedbackViewController ()

@property (weak, nonatomic) IBOutlet UILabel *textLabel;
@property (weak, nonatomic) IBOutlet UIButton *noButton;
@property (weak, nonatomic) IBOutlet UIButton *yesButton;

@property (nonatomic) BOOL lovesMicd;
@property (nonatomic, weak) id<FeedbackViewControllerDelegate> delegate;

@end

@implementation FeedbackViewController

- (instancetype)initWithLovesMicd:(BOOL)lovesMicd delegate:(id<FeedbackViewControllerDelegate>)delegate {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    self = [storyboard instantiateViewControllerWithIdentifier:@"popover"];
    
    if (self) {
        _lovesMicd = lovesMicd;
        _delegate = delegate;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.layer.cornerRadius = 10;
    self.view.layer.borderColor = [[UIColor vibrantLightBlueText] CGColor];
    self.view.layer.borderWidth = 2;
    self.view.backgroundColor = [UIColor blackColor];
    self.noButton.layer.cornerRadius = 5;
    self.yesButton.layer.cornerRadius = 5;
    self.noButton.backgroundColor = [UIColor vibrantLightBlueText];
    self.yesButton.backgroundColor = [UIColor vibrantLightBlueText];
    [self.noButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.yesButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    self.textLabel.textColor = [UIColor vibrantLightBlueText];
    
    if (self.lovesMicd) {
        self.textLabel.text = @"Thanks you sexy sonofa bitch. We really appreciate that you really appreciate our app. If you would please take a few moments of your time and rate our app, we would give you a handy...tip";
    } else {
        self.textLabel.text = @"HMMM, Obviously you dont have even a smidge of taste. If you would like to leave your idiotic feedback, then please send us an email...you piece of shit.                   \n\n            Not reading it anyway";
    }
}

- (IBAction)noTapped:(id)sender {
    [self.delegate nevermind:self];
}

- (IBAction)yesTapped:(id)sender {
    if (self.lovesMicd) {
        [self.delegate showAppStore:self];
    } else {
        [self.delegate showMailComposer:self];
    }
}

@end
