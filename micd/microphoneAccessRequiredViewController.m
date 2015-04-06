//
//  microphoneAccessRequiredViewController.m
//  micd
//
//  Created by Tim on 4/5/15.
//  Copyright (c) 2015 CleverKnot. All rights reserved.
//

#import "MicrophoneAccessRequiredViewController.h"
#import "UIColor+Palette.h"

@interface MicrophoneAccessRequiredViewController ()
@property (weak, nonatomic) IBOutlet UIButton *linkButton;
@property (weak, nonatomic) IBOutlet UILabel *label;
@end

@implementation MicrophoneAccessRequiredViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.layer.cornerRadius = 10;
    self.view.layer.borderColor = [[UIColor vibrantLightBlueText] CGColor];
    self.view.layer.borderWidth = 2;
    self.view.backgroundColor = [UIColor blackColor];

    self.linkButton.backgroundColor = [UIColor vibrantLightBlueText];
    [self.linkButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.linkButton.layer.cornerRadius = 5;
    
    self.label.textColor = [UIColor vibrantLightBlueText];
    self.label.textAlignment = NSTextAlignmentCenter;
    self.label.text = @"This app requires access to your device's Microphone.\n\nPlease enable Microphone access for this app in Settings / Privacy / Microphone";
}

- (IBAction)takeMeTherePressed:(id)sender {
    
}

@end
