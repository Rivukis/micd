#import "RecordingsInterfaceController.h"
#import "RecordingRowController.h"
#import "Constants.h"
#import "UIColor+PalettePicker.h"

@interface RecordingsInterfaceController ()

@property (weak, nonatomic) IBOutlet WKInterfaceTable *tableView;
@property (strong, nonatomic) NSArray *recordings; // of Dictionarys

@property (assign, nonatomic) NSInteger focusedRowIndex;

@end

@implementation RecordingsInterfaceController

- (void)willActivate {
    [super willActivate];
    
    NSDictionary *userInfo = @{kWatchExtKeyMessageType : kWatchExtKeyMessageTypeGetRecordingsList};
    [RecordingsInterfaceController openParentApplication:userInfo reply:^(NSDictionary *replyInfo, NSError *error) {
        self.recordings = replyInfo[kWatchExtKeyRecordingsList];
        [self handleReplyInfo:replyInfo];
    }];
}

#pragma mark - Helper Methods

- (void)handleReplyInfo:(NSDictionary *)replyInfo {
    BOOL isRecording = [[replyInfo objectForKey:kWatchExtKeyIsRecording] boolValue];
    if (isRecording) {
        [self popController];
    }
    [self setupTableView];
}

#pragma mark - View Setup Methods

- (void)setupTableView {
    [self.tableView setNumberOfRows:self.recordings.count withRowType:@"RecordingRowController"];
    
    for (NSInteger rowIndex = 0; rowIndex < self.tableView.numberOfRows; rowIndex++) {
        RecordingRowController *rowController = [self.tableView rowControllerAtIndex:rowIndex];
        NSString *title = self.recordings[rowIndex][kWatchExtKeyRecordingsListKeyName];
        BOOL isLoaded = [self.recordings[rowIndex][kWatchExtKeyRecordingsListIsLoaded] boolValue];
        
        [self setupRowController:rowController withTitle:title isLoaded:isLoaded];
        if (isLoaded) self.focusedRowIndex = rowIndex;
    }
}

- (void)setupRowController:(RecordingRowController *)rowController withTitle:(NSString *)title isLoaded:(BOOL)isLoaded {
    [self setupRowController:rowController isLoaded:isLoaded];
    [rowController.recordingTitleLabel setText:title];
}

- (void)setupRowController:(RecordingRowController *)rowController isLoaded:(BOOL)isLoaded {
    if (isLoaded) {
        [rowController.backgroundGroup setBackgroundColor:[UIColor colorWithType:ColorTypeTextLight]];
        [rowController.recordingTitleLabel setTextColor:[UIColor colorWithType:ColorTypeVeryDark]];
    } else {
        [rowController.backgroundGroup setBackgroundColor:[UIColor colorWithType:ColorTypeVeryDark]];
        [rowController.recordingTitleLabel setTextColor:[UIColor colorWithType:ColorTypeTextLight]];
    }
}

#pragma mark - User Action Methods

- (void)table:(WKInterfaceTable *)table didSelectRowAtIndex:(NSInteger)rowIndex {
    if (rowIndex != self.focusedRowIndex) {
        RecordingRowController *previouslyFocusedRowController = [self.tableView rowControllerAtIndex:self.focusedRowIndex];
        [self setupRowController:previouslyFocusedRowController isLoaded:NO];
        
        self.focusedRowIndex = rowIndex;
        
        RecordingRowController *upComingFocusedRowController = [self.tableView rowControllerAtIndex:self.focusedRowIndex];
        [self setupRowController:upComingFocusedRowController isLoaded:YES];
    }
    
    NSDictionary *recording = self.recordings[rowIndex];
    NSDictionary *userInfo = @{kWatchExtKeyMessageType: kWatchExtKeyMessageTypeRecordingPressed,
                               kWatchExtKeyPlayRecordingWithUUIDString: recording[kWatchExtKeyRecordingsListKeyUUID]};
    [RecordingsInterfaceController openParentApplication:userInfo reply:^(NSDictionary *replyInfo, NSError *error) {
        self.recordings = replyInfo[kWatchExtKeyRecordingsList];
        [self handleReplyInfo:replyInfo];
    }];
}

@end
