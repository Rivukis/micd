#import "RecordingsInterfaceController.h"
#import "RecordingRowController.h"
#import "Constants.h"

@interface RecordingsInterfaceController ()

@property (weak, nonatomic) IBOutlet WKInterfaceTable *tableView;
@property (strong, nonatomic) NSArray *recordings; // of Dictionarys

@end

@implementation RecordingsInterfaceController

- (void)willActivate {
    [super willActivate];
    
    NSDictionary *userInfo = @{kWatchExtKeyMessageType : kWatchExtKeyMessageTypeGetRecordingsList};
    [RecordingsInterfaceController openParentApplication:userInfo reply:^(NSDictionary *replyInfo, NSError *error) {
        [self handleBasicReplyInfo:replyInfo];
        
        self.recordings = replyInfo[kWatchExtKeyRecordingsList];
        [self setupTableView];
    }];
}

#pragma mark - Helper Methods

- (void)handleBasicReplyInfo:(NSDictionary *)replyInfo {
    BOOL isRecording = [[replyInfo objectForKey:kWatchExtKeyIsRecording] boolValue];
    if (isRecording) {
        [self popController];
    }
}

#pragma mark - View Setup Methods

- (void)setupTableView {
    [self.tableView setNumberOfRows:self.recordings.count withRowType:@"RecordingRowController"];
    
    for (NSInteger i = 0; i < self.tableView.numberOfRows; i++) {
        RecordingRowController *rowController = [self.tableView rowControllerAtIndex:i];
        [rowController.recordingTitleLabel setText:self.recordings[i][kWatchExtKeyRecordingsListKeyName]];
    }
}

#pragma mark - User Action Methods

- (void)table:(WKInterfaceTable *)table didSelectRowAtIndex:(NSInteger)rowIndex {
    NSDictionary *recording = self.recordings[rowIndex];
    NSDictionary *userInfo = @{kWatchExtKeyMessageType: kWatchExtKeyMessageTypeRecordingPressed,
                               kWatchExtKeyPlayRecordingWithUUIDString: recording[kWatchExtKeyRecordingsListKeyUUID]};
    [RecordingsInterfaceController openParentApplication:userInfo reply:^(NSDictionary *replyInfo, NSError *error) {
        [self handleBasicReplyInfo:replyInfo];
        
        BOOL recordingsListDidChange = [replyInfo[kWatchExtKeyRecordingsListChangedWhileShowingOnWatch] boolValue];
        if (recordingsListDidChange) {
            self.recordings = replyInfo[kWatchExtKeyRecordingsList];
            [self setupTableView];
        }
    }];
}

@end
