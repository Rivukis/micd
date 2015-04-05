//
//  PopoverViewController.m
//  micd
//
//  Created by Tim on 4/4/15.
//  Copyright (c) 2015 CleverKnot. All rights reserved.
//

#import "PopoverViewController.h"
#import "UIColor+Palette.h"

@interface PopoverViewController ()
@property (weak, nonatomic) IBOutlet UILabel *textLabel;
@property (weak, nonatomic) IBOutlet UIButton *noButton;
@property (weak, nonatomic) IBOutlet UIButton *yesButton;
@end

@implementation PopoverViewController

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
    
    if (self.didSayYes) {
        self.textLabel.text = @"Thanks you sexy sonofa bitch. We really appreciate that you really appreciate our app. If you would please take a few moments of your time and rate our app, we would give you a handy.";
    } else {
        self.textLabel.text = @"HMM. obviously you dont have even a smidge of taste. If you would like to leave your idiotic feedback, then please send us an email...you piece of shit.                   \n\n            Not reading it anyway";
    }
}

- (IBAction)noTapped:(id)sender {
    [self dismissViewControllerAnimated:YES completion:^{
    }];
}

- (IBAction)yesTapped:(id)sender {
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
    if (self.didSayYes) {
        //leaving us a review. woot 5 stars
    } else {
        //sending us an email
    }
}


@end
