#import "RecordingsInterfaceController.h"
#import "RecordingRowController.h"
#import "Constants.h"
#import "UIColor+PalettePicker.h"

@interface RecordingsInterfaceController ()

@property (weak, nonatomic) IBOutlet WKInterfaceTable *tableView;
//@property (strong, nonatomic) NSArray *receivedRecordings; // of Dictionarys
@property (strong, nonatomic) NSArray *loadedRecordings; // of Recording Dictionaries

@property (assign, nonatomic) NSInteger focusedRowIndex;

@end

@implementation RecordingsInterfaceController

- (void)willActivate {
    [super willActivate];
    
    NSDictionary *userInfo = @{kWatchExtKeyMessageType : kWatchExtMessageTypeGetRecordingsList};
    [RecordingsInterfaceController openParentApplication:userInfo reply:^(NSDictionary *replyInfo, NSError *error) {
        [self handleReplyInfo:replyInfo];
    }];
}

#pragma mark - Helper Methods

- (void)handleReplyInfo:(NSDictionary *)replyInfo {
    BOOL isRecording = [[replyInfo objectForKey:kWatchExtKeyIsRecording] boolValue];
    if (isRecording) {
        [self popController];
    }
    
    NSArray *receivedRecordings = replyInfo[kWatchExtKeyRecordingsList];
    if ([self shouldReloadTableForReceivedRecordings:receivedRecordings]) {
        [self setupTableViewWithRecordings:receivedRecordings];
    }
}

- (BOOL)shouldReloadTableForReceivedRecordings:(NSArray *)receivedRecordings {
    if (self.loadedRecordings.count != receivedRecordings.count) {
        return YES;
    }
    
    for (NSInteger i = 0; i < self.tableView.numberOfRows; i++) {
        NSDictionary *loadedRecording = self.loadedRecordings[i];
        NSDictionary *receivedRecording = receivedRecordings[i];
        
        NSString *loadedTitle = loadedRecording[kWatchExtRecordingDictKeyTitle];
        NSString *receivedTitle = receivedRecording[kWatchExtRecordingDictKeyTitle];
        NSString *loadedUUID = loadedRecording[kWatchExtRecordingDictKeyUUID];
        NSString *receivedUUID = receivedRecording[kWatchExtRecordingDictKeyUUID];
        
        if ([loadedTitle isEqualToString:receivedTitle] == NO) {
            return YES;
        }
        if ([loadedUUID isEqualToString:receivedUUID] == NO) {
            return YES;
        }
    }
    
    return NO;
}

#pragma mark - View Setup Methods

- (void)setupTableViewWithRecordings:(NSArray *)receivedRecordings {
    self.loadedRecordings = receivedRecordings;
    
    [self.tableView setNumberOfRows:self.loadedRecordings.count withRowType:@"RecordingRowController"];
    
    for (NSInteger rowIndex = 0; rowIndex < self.tableView.numberOfRows; rowIndex++) {
        RecordingRowController *rowController = [self.tableView rowControllerAtIndex:rowIndex];
        NSString *title = self.loadedRecordings[rowIndex][kWatchExtRecordingDictKeyTitle];
        NSString *date = self.loadedRecordings[rowIndex][kWatchExtRecordingDictKeyDate];
        NSString *length = self.loadedRecordings[rowIndex][kWatchExtRecordingDictKeyLength];
        BOOL isLoaded = [self.loadedRecordings[rowIndex][kWatchExtRecordingDictKeyIsLoaded] boolValue];
        
        [self setupRowController:rowController withTitle:title date:date length:length isLoaded:isLoaded];
        if (isLoaded) self.focusedRowIndex = rowIndex;
    }
}

- (void)setupRowController:(RecordingRowController *)rowController withTitle:(NSString *)title date:(NSString *)date length:(NSString *)length isLoaded:(BOOL)isLoaded {
    [self setupRowController:rowController isLoaded:isLoaded];
    [rowController.titleLabel setText:title];
    [rowController.dateLabel setText:date];
    [rowController.lengthLabel setText:length];
}

- (void)setupRowController:(RecordingRowController *)rowController isLoaded:(BOOL)isLoaded {
    if (isLoaded) {
        [rowController.backgroundGroup setBackgroundColor:[UIColor colorWithType:ColorTypeTextLight]];
        [rowController.titleLabel setTextColor:[UIColor colorWithType:ColorTypeVeryDark]];
        [rowController.dateLabel setTextColor:[UIColor colorWithType:ColorTypeVeryDark]];
        [rowController.lengthLabel setTextColor:[UIColor colorWithType:ColorTypeVeryDark]];
    } else {
        [rowController.backgroundGroup setBackgroundColor:[UIColor colorWithType:ColorTypeVeryDark]];
        [rowController.titleLabel setTextColor:[UIColor colorWithType:ColorTypeTextLight]];
        [rowController.dateLabel setTextColor:[UIColor colorWithType:ColorTypeTextLight]];
        [rowController.lengthLabel setTextColor:[UIColor colorWithType:ColorTypeTextLight]];
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
    
    NSDictionary *recording = self.loadedRecordings[rowIndex];
    NSDictionary *userInfo = @{kWatchExtKeyMessageType: kWatchExtMessageTypeRecordingPressed,
                               kWatchExtKeyPlayRecordingWithUUIDString: recording[kWatchExtRecordingDictKeyUUID]};
    [RecordingsInterfaceController openParentApplication:userInfo reply:^(NSDictionary *replyInfo, NSError *error) {
        [self handleReplyInfo:replyInfo];
    }];
}

@end
