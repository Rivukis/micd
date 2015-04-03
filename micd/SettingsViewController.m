//
//  SettingsViewController.m
//  micd
//
//  Created by Timothy Hise on 4/2/15.
//  Copyright (c) 2015 CleverKnot. All rights reserved.
//

#import "SettingsViewController.h"
#import "UIColor+Palette.h"
#import "WireTapStyleKit.h"
#import "SettingsView.h"
#import "PopViewAnimator.h"

@interface SettingsViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *loveMicdImageView;
@property (weak, nonatomic) IBOutlet UIButton *noButton;
@property (weak, nonatomic) IBOutlet UIButton *yesButton;

@property (assign, nonatomic) BOOL isFirstTimeLayingOutSubviews;
@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor clearColor];
    self.loveMicdImageView.image = [WireTapStyleKit imageOfLoveMicd];
    self.noButton.backgroundColor = [UIColor vibrantBlue];
    self.yesButton.backgroundColor = [UIColor vibrantBlue];
    
    self.noButton.layer.cornerRadius = 5;
    self.yesButton.layer.cornerRadius = 5;
    
    self.isFirstTimeLayingOutSubviews = YES;
}

-(void)viewDidLayoutSubviews {
    if (self.isFirstTimeLayingOutSubviews) {
        ((SettingsView *)self.view).interactiveElements = @[self.noButton, self.yesButton];
        ((SettingsView *)self.view).settingsView = self.view;
        
        self.isFirstTimeLayingOutSubviews = NO;
    }
    
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
