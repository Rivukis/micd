#import "RecorderInterfaceController.h"
#import "Constants.h"

@interface RecorderInterfaceController()

@property (weak, nonatomic) IBOutlet WKInterfaceButton *recordButton;
@property (weak, nonatomic) IBOutlet WKInterfaceGroup *recordButtonGroup;
@property (weak, nonatomic) IBOutlet WKInterfaceButton *goToTracksButton;

@end

@implementation RecorderInterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    // Configure interface objects here.
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
    
    NSDictionary *userInfo = @{kWatchExtKeyMessageType : kWatchExtMessageTypeGetRecorderInfo};
    [RecorderInterfaceController openParentApplication:userInfo reply:^(NSDictionary *replyInfo, NSError *error) {
        [self handleReplyInfo:replyInfo];
    }];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

#pragma mark - Helper Methods

- (void)handleReplyInfo:(NSDictionary *)replyInfo {
    BOOL isRecording = [[replyInfo objectForKey:kWatchExtKeyIsRecording] boolValue];
    BOOL isAccessGranted = [[replyInfo objectForKey:kWatchExtKeyRecordingPermissionIsGranted] boolValue];
    [self setupViewForIsRecording:isRecording isAccessGranted:isAccessGranted];
}

#pragma mark - View Setup Methods

- (void)setupViewForIsRecording:(BOOL)isRecording isAccessGranted:(BOOL)isAccessGranted {
    if (!isAccessGranted) {
        [self.recordButtonGroup stopAnimating];
        [self.recordButtonGroup setBackgroundImageNamed:@"micPermissionsOffWatch"];
        [self setupGoToTracksButtonShouldBeEnabled:YES];
    } else {
        if (isRecording) {
            [self.recordButtonGroup setBackgroundImageNamed:@"watchRecording"];
            [self setupGoToTracksButtonShouldBeEnabled:NO];
        } else {
            [self.recordButtonGroup setBackgroundImageNamed:@"recordButton"];
            [self setupGoToTracksButtonShouldBeEnabled:YES];
        }
    }
}

- (void)setupGoToTracksButtonShouldBeEnabled:(BOOL)enabled {
    UIFont *font = [UIFont systemFontOfSize:15];
    UIColor *textColor;
    
    if (enabled) {
        textColor = [UIColor whiteColor];
    } else {
        textColor = [UIColor darkGrayColor];
    }
    
    NSDictionary *attributes = @{NSForegroundColorAttributeName : textColor,
                                 NSFontAttributeName: font};
    NSAttributedString *attributedTitle = [[NSAttributedString alloc] initWithString:@"Recordings" attributes:attributes];
    [self.goToTracksButton setAttributedTitle:attributedTitle];
    [self.goToTracksButton setEnabled:enabled];
}

#pragma mark - User Action Methods

- (IBAction)recordButtonPressed {
    [self setupGoToTracksButtonShouldBeEnabled:NO];
    // send message to phone that record button was pressed
    NSDictionary *userInfo = @{kWatchExtKeyMessageType : kWatchExtMessageTypeRecordButtonPressed};
    [RecorderInterfaceController openParentApplication:userInfo reply:^(NSDictionary *replyInfo, NSError *error) {
        [self handleReplyInfo:replyInfo];
    }];
}

- (IBAction)goToTracksButtonPressed {
    [self pushControllerWithName:@"RecordingsInterfaceController" context:nil];
}

@end