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
#import "RecordingsSection.h"

@interface RecordingsViewController () <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) DataSourceController *dataSource;
@property (strong, nonatomic) PlayerController *playerController;
@property (strong, nonatomic) NSMutableArray *expandedRows;
@property (strong, nonatomic) NSArray *sections;

@property (assign, nonatomic) BOOL didGetOriginalHeight;
@property (assign, nonatomic) CGFloat originalHeight;
@property (assign, nonatomic) BOOL didGetOriginalTableViewHeight;
@property (assign, nonatomic) CGFloat originalTableViewHeight;

@end

@implementation RecordingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dataSource = [DataSourceController sharedInstance];
    self.playerController = [[PlayerController alloc] init];
    
    [self.tableView setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.tableView addObserver:self forKeyPath:@"contentSize" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:NULL];
    
    
    self.expandedRows = [NSMutableArray array];
    
    [self reloadData];
}

- (void)reloadData {
    self.sections = [RecordingsSection arrayOfSectionsForRecordings:[self.dataSource allRecordings]];
    [self.tableView reloadData];
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    if (!self.didGetOriginalHeight) {
        self.didGetOriginalHeight = YES;
        self.originalHeight = self.view.frame.size.height;
    }
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    if (!self.didGetOriginalTableViewHeight) {
        self.didGetOriginalTableViewHeight = YES;
        self.originalTableViewHeight = self.tableView.frame.size.height;
    }
}

#pragma mark - FramesBasedOnStateProtocol

- (void)setInitialStateFrame {
    CGRect screenSize = [[UIScreen mainScreen] bounds];
    self.view.frame = CGRectMake(0,
                                 (self.view.window.frame.size.height * 1.068f) * -1,
                                 self.view.window.frame.size.width,
                                 screenSize.size.height * 0.808f);
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

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    RecordingCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    RecordingsSection *recordingsSection = self.sections[indexPath.section];
    Recording *recording = [recordingsSection recordingAtIndex:indexPath.row];
    
    [cell setValuesForRecording:recording];
    
    //    cell.title.text = recording.recordedDateAsFullString;
    //    BOOL expanding = [self.expandedRows containsObject:@(indexPath.row)];
    
    //    [cell setPreAnimationConstraintsBasedOnExpansion:expanding];
    //    [cell setPostAnimationConstraintsBasedOnExpansion:expanding];
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return YES if you want the specified item to be editable.
    return YES;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        //add code here for when you hit delete
    }
}

//- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath {
//    return @"deletoooo";
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    RecordingsSection *recordingsSection = self.sections[section];
    
    NSLog(@"number of cells: %li", (long)recordingsSection.numberOfRecordings); // !!!: remove
    
    return [recordingsSection numberOfRecordings];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.sections.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 45.0f;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    RecordingsSection *recordingsSection = self.sections[section];
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.tableView.frame.size.width, 45.0f)];
    
    UIView *bottomBorderView = [[UIView alloc] initWithFrame:CGRectMake(13.0f, 44.0f, tableView.frame.size.width - 26.f, 1.0f)];
    bottomBorderView.backgroundColor = [UIColor babyBlue];
    [headerView addSubview:bottomBorderView];
    
    UILabel *headerTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, self.tableView.frame.size.width - 13, 20.0f)];
    headerTitleLabel.text = recordingsSection.dateAsString;
    headerTitleLabel.font = [UIFont fontWithName: @"AvenirNextCondensed-Regular" size:17.0f];
    headerTitleLabel.textAlignment = NSTextAlignmentRight;
    headerTitleLabel.textColor = [UIColor babyBlue];
    [headerView addSubview:headerTitleLabel];
    
    return headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.01f;
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
        return 45.0f;
        return tableView.frame.size.width * .16f;
    }
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if (!self.didGetOriginalTableViewHeight || !self.didGetOriginalHeight) {
        return;
    }
    
    if ([keyPath isEqualToString:@"contentSize"]) {
//        CGSize contentSize = (CGSize)object;
        NSLog(@"contentSize: %@", object);
        CGRect viewFrame = self.view.frame;
        if (self.tableView.contentSize.height >= self.originalTableViewHeight) {
            viewFrame.size.height = self.originalHeight;
        } else {
            CGFloat differenceInHeight = self.originalTableViewHeight - self.tableView.contentSize.height;
            viewFrame.size.height = self.originalHeight - differenceInHeight;
        }
        self.view.frame = viewFrame;
    }
}

@end
