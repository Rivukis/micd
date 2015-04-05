//
//  PopoverViewController.m
//  micd
//
//  Created by Tim on 4/4/15.
//  Copyright (c) 2015 CleverKnot. All rights reserved.
//

#import "PopoverViewController.h"

@interface PopoverViewController ()

@end

@implementation PopoverViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.layer.cornerRadius = 10;
}

- (IBAction)dismiss:(id)sender {
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

@end
