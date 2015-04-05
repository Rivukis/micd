//
//  recordingsInterfaceController.m
//  micd
//
//  Created by Brian Radebaugh on 4/2/15.
//  Copyright (c) 2015 CleverKnot. All rights reserved.
//

#import "RecordingsInterfaceController.h"
#import "RecordingRowController.h"
#import "Constants.h"

@interface RecordingsInterfaceController ()

@property (weak, nonatomic) IBOutlet WKInterfaceTable *tableView;

@property (strong, nonatomic) NSArray *recordingTitles;
//@property (assign, nonatomic) BOOL isPlaying;

@end

@implementation RecordingsInterfaceController

- (void)willActivate {
    [super willActivate];
    
    NSDictionary *userInfo = @{kWatchExtKeyMessageType : kWatchExtKeyMessageTypeGetRecordingsList};
    [RecordingsInterfaceController openParentApplication:userInfo reply:^(NSDictionary *replyInfo, NSError *error) {
        [self handleBasicReplyInfo:replyInfo];
        
        self.recordingTitles = replyInfo[kWatchExtKeyRecordingsList];
        [self setupTableView];
    }];
}

#pragma mark - Helper Methods

- (void)handleBasicReplyInfo:(NSDictionary *)replyInfo {
    BOOL isRecording = [[replyInfo objectForKey:kWatchExtKeyIsRecording] boolValue];
    if (isRecording) {
        [self popController];
    }
//    self.isPlaying = [[replyInfo objectForKey:kWatchExtKeyIsPlaying] boolValue];
}

#pragma mark - View Setup Methods

- (void)setupTableView {
    [self.tableView setNumberOfRows:self.recordingTitles.count withRowType:@"RecordingRowController"];
    
    for (NSInteger i = 0; i < self.tableView.numberOfRows; i++) {
        RecordingRowController *rowController = [self.tableView rowControllerAtIndex:i];
        [rowController.recordingTitleLabel setText:self.recordingTitles[i]];
    }
}

//- (void)setIsPlaying:(BOOL)isPlaying {
//    if (isPlaying) {
//        [self.playPauseButton setTitle:@"pause"];
//    } else {
//        [self.playPauseButton setTitle:@"play"];
//    }
//    _isPlaying = isPlaying;
//}

#pragma mark - User Action Methods

- (void)table:(WKInterfaceTable *)table didSelectRowAtIndex:(NSInteger)rowIndex {
    // send message to phone
    NSDictionary *userInfo = @{kWatchExtKeyMessageType: kWatchExtKeyMessageTypeRecordingPressed,
                               kWatchExtKeyPlayRecordingIndex: @(rowIndex)};
    [RecordingsInterfaceController openParentApplication:userInfo reply:^(NSDictionary *replyInfo, NSError *error) {
        [self handleBasicReplyInfo:replyInfo];
    }];
}

//- (IBAction)previousButtonPressed {
//    NSDictionary *userInfo = @{kWatchExtKeyMessageType: kWatchExtKeyMessageTypePreviousButtonPressed};
//    [RecordingsInterfaceController openParentApplication:userInfo reply:^(NSDictionary *replyInfo, NSError *error) {
//        [self handleBasicReplyInfo:replyInfo];
//    }];
//}
//
//- (IBAction)playPausedButtonPressed {
//    NSString *messageType;
//    if (self.isPlaying) {
//        messageType = kWatchExtKeyMessageTypePauseButtonPressed;
//    } else {
//        messageType = kWatchExtKeyMessageTypePlayButtonPressed;
//    }
//    NSDictionary *userInfo = @{kWatchExtKeyMessageType: messageType};
//    [RecordingsInterfaceController openParentApplication:userInfo reply:^(NSDictionary *replyInfo, NSError *error) {
//        [self handleBasicReplyInfo:replyInfo];
//    }];
//}
//
//- (IBAction)nextButtonPressed {
//    NSDictionary *userInfo = @{kWatchExtKeyMessageType: kWatchExtKeyMessageTypeNextButtonPressed};
//    [RecordingsInterfaceController openParentApplication:userInfo reply:^(NSDictionary *replyInfo, NSError *error) {
//        [self handleBasicReplyInfo:replyInfo];
//    }];
//}

@end
