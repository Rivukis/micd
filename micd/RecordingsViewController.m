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

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    RecordingCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    Recording *recording = [self.dataSource recordingAtIndex:indexPath.row];
    cell.title.text = recording.uuid.UUIDString;
    cell.date.text = @"Dec 25";
    BOOL expanding = [self.expandedRows containsObject:@(indexPath.row)];
    
    [cell setPreAnimationConstraintsBasedOnExpansion:expanding];
    [cell setPostAnimationConstraintsBasedOnExpansion:expanding];
    
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
    BOOL expanding = [self.expandedRows containsObject:@(indexPath.row)];
    [cell setPreAnimationConstraintsBasedOnExpansion:expanding];
    
    [tableView beginUpdates];
    [UIView animateWithDuration:.3f animations:^{
        [cell setPostAnimationConstraintsBasedOnExpansion:expanding];
        [cell layoutIfNeeded];
    }];
    [tableView endUpdates];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([self.expandedRows containsObject:@(indexPath.row)]) {
        return 180.0f;
        return tableView.frame.size.width *.31f;
    } else {
        return 60.0f;
        return tableView.frame.size.width * .16f;
    }
}

@end
