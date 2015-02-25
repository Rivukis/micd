//
//  RecordingsViewController.m
//  micd
//
//  Created by Timothy Hise on 2/7/15.
//  Copyright (c) 2015 CleverKnot. All rights reserved.
//

#import "RecordingsViewController.h"
#import "UIColor+Palette.h"
#import "DataSourceController.h"
#import "Recording.h"
#import "PlayerController.h"
#import "WireTapStyleKit.h"
#import "RecordingCell.h"

@interface RecordingsViewController () <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) DataSourceController *dataSource;
@property (strong, nonatomic) PlayerController *playerController;
//@property (strong, nonatomic) NSIndexPath *pleaseExpand;
@property (strong, nonatomic) NSMutableArray *expandedRows;

@end

@implementation RecordingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dataSource = [DataSourceController sharedInstance];
    self.playerController = [[PlayerController alloc] init];
    
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    self.expandedRows = [NSMutableArray array];
}

- (void)reloadData {
    [self.tableView reloadData];
}

#pragma mark - FramesBasedOnStateProtocol

- (void)setInitialStateFrame {
    CGRect screenSize = [[UIScreen mainScreen] bounds];
    self.view.frame = CGRectMake(0,
                                 (self.view.window.frame.size.height * 1.068f) * -1,
                                 self.view.window.frame.size.width,
                                 screenSize.size.height * 0.808f);
    self.tableView.frame = self.view.frame;
}

- (void)setFrameBasedOnState:(HomeViewContollerPositionState)state {
    CGRect frame = self.view.frame;
    switch (state) {
        case HomeViewContollerPositionStateHome:
            frame.origin.y = (self.view.window.frame.size.height * -1.068f);
            break;
        case HomeViewContollerPositionStateRecordings:
            frame.origin.y = 0;
            break;
        case HomeViewContollerPositionStateSettings:
            frame.origin.y = (self.view.window.frame.size.height * -1.068f * 2);
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
    return self.dataSource.numberOfRecordings;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    RecordingCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    Recording *recording = [self.dataSource recordingAtIndex:indexPath.row];
    
    [cell setValuesForRecording:recording];
    
//    cell.title.text = recording.recordedDateAsFullString;
//    BOOL expanding = [self.expandedRows containsObject:@(indexPath.row)];
    
//    [cell setPreAnimationConstraintsBasedOnExpansion:expanding];
//    [cell setPostAnimationConstraintsBasedOnExpansion:expanding];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    [tableView deselectRowAtIndexPath:indexPath animated:YES];
//    Recording *recording = [self.dataSource recordingAtIndex:indexPath.row];
//    [self.playerController loadRecording:recording error:nil];
//    [self.playerController playAudioWithError:nil];
    
    if ([self.expandedRows containsObject:@(indexPath.row)]) {
        [self.expandedRows removeObject:@(indexPath.row)];
    } else {
        [self.expandedRows addObject:@(indexPath.row)];
    }
    
    RecordingCell *cell = (RecordingCell *)[tableView cellForRowAtIndexPath:indexPath];
//    BOOL expanding = [self.expandedRows containsObject:@(indexPath.row)];
//    [cell setPreAnimationConstraintsBasedOnExpansion:expanding];
    
    [tableView beginUpdates];
    [UIView animateWithDuration:.3f animations:^{
//        [cell setPostAnimationConstraintsBasedOnExpansion:expanding];
        [cell layoutIfNeeded];
    }];
    [tableView endUpdates];
    
    /* some animation choices
    [cell setPostAnimationConstraintsBasedOnExpansion:expanding];
    [cell layoutIfNeeded];
    
    [UIView beginAnimations:@"myAnimationId" context:nil];
    
    [UIView setAnimationDuration:.3f]; // Set duration here
    
    [CATransaction begin];
    
    //just in case we want to
    [CATransaction setCompletionBlock:^{
        
    }];
    
    [tableView beginUpdates];
    // my table changes
    [tableView endUpdates];
    
    [CATransaction commit];
    [UIView commitAnimations];
     */
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([self.expandedRows containsObject:@(indexPath.row)]) {
        return 150.0f;
        return tableView.frame.size.width *.31f;
    } else {
        return 50.0f;
        return tableView.frame.size.width * .16f;
    }
}

@end
