//
//  renameRecordingViewController.m
//  micd
//
//  Created by Timothy Hise on 3/22/15.
//  Copyright (c) 2015 CleverKnot. All rights reserved.
//

#import "RenameRecordingViewController.h"
#import "WireTapStyleKit.h"

@interface RenameRecordingViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *textfieldBacker;
@property (weak, nonatomic) IBOutlet UIButton *dismissButton;

@end

@implementation RenameRecordingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.textfieldBacker.backgroundColor = [UIColor clearColor];
    self.textfieldBacker.image = [WireTapStyleKit imageOfTextfieldBacker];
}

- (IBAction)dismissPressed:(id)sender {
    [self dismissViewControllerAnimated:YES completion:^{
        [self.renameRecordingsViewDelegate didFinishRenaming];
    }];
}

@end
