//
//  RecordingsViewController.m
//  micd
//
//  Created by Timothy Hise on 2/7/15.
//  Copyright (c) 2015 CleverKnot. All rights reserved.
//

#import "RecordingsViewController.h"
#import "UIColor+Palette.h"

@interface RecordingsViewController () <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation RecordingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
}

#pragma mark - SetFramesProtocol

- (void)setInitialStateFrame {
    self.view.frame = CGRectMake(0,
                                 (self.view.window.frame.size.height * 1.068f) * -1,
                                 self.view.window.frame.size.width,
                                 self.view.window.frame.size.height - 128.0f);
    self.tableView.frame = self.view.frame;
}

- (void)setFrameBasedOnState:(HomeViewContollerPositionState)state {
    CGRect frame = self.view.frame;
    switch (state) {
        case HomeViewContollerPositionStateHome:
            frame.origin.y = (self.view.window.frame.size.height * 1.068f) * -1;
            break;
        case HomeViewContollerPositionStateRecordings:
            frame.origin.y = 0;
            break;
        case HomeViewContollerPositionStateSettings:
            
            break;
        default:
            break;
    }
    self.view.frame = frame;
}

- (void)adjustFrameBasedOnTranslation:(CGPoint)translation {
    CGRect frame = self.view.frame;
    frame.origin.y += translation.y;
    self.view.frame = frame;
}

#pragma mark - UITableViewDataSource && UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    cell.textLabel.text = @"fun time with time hisous";
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.textColor = [UIColor vibrantBlue];
    cell.layer.borderColor = [[UIColor vibrantBlue] CGColor];
    cell.layer.borderWidth = 1.0f;
    
    return cell;
}

@end
