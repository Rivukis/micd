#import "FeedbackViewController.h"
#import "UIColor+Palette.h"

@interface FeedbackViewController ()

@property (weak, nonatomic) IBOutlet UITextView *textView;
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
    
    // hack: for iphone 4 & 5 so the button text fits
    if (self.view.frame.size.width <= 321) {
        [self.yesButton.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Medium" size:15.0f]];
        [self.noButton.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Medium" size:15.0f]];
    }
    
    [self.noButton setTitle:@"Nope" forState:UIControlStateNormal];
    if (self.lovesMicd) {
        [self.yesButton setTitle:@"Take me there!" forState:UIControlStateNormal];
        self.textView.text = @"Awww thanks! You're too kind!\n\nWe really appreciate that you really appreciate our app.\n\nAs a small team of two, it would be huge for us if you would rate our very first app.";
    } else {
        [self.yesButton setTitle:@"Share my wisdom" forState:UIControlStateNormal];
        self.textView.text = @"Sorry to hear that.\n\nWe would love to hear any feedback or suggestions you have to make Mic'd better.\n\nAs a small team of two working on our first app, we have a lot to learn.";
    }
    [self.textView setFont:[UIFont fontWithName:@"HelveticaNeue" size:16.0f]];
    [self.textView setTextColor:[UIColor vibrantLightBlueText]];
    self.textView.textAlignment = NSTextAlignmentJustified;
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
