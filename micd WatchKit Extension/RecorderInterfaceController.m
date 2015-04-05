//
//  InterfaceController.m
//  micd WatchKit Extension
//
//  Created by Timothy Hise on 3/22/15.
//  Copyright (c) 2015 CleverKnot. All rights reserved.
//

#import "RecorderInterfaceController.h"
#import "Constants.h"

@interface RecorderInterfaceController()

@property (weak, nonatomic) IBOutlet WKInterfaceButton *recordButton;
@property (weak, nonatomic) IBOutlet WKInterfaceButton *recordingsButton;

@end

@implementation RecorderInterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    // Configure interface objects here.
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
    
    NSDictionary *userInfo = @{kWatchExtKeyMessageType : kWatchExtKeyMessageTypeGetRecorderInfo};
    [RecorderInterfaceController openParentApplication:userInfo reply:^(NSDictionary *replyInfo, NSError *error) {
        BOOL isRecording = [[replyInfo objectForKey:kWatchExtKeyIsRecording] boolValue];
        [self setupViewForIsRecording:isRecording];
    }];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

#pragma mark - View Setup Methods

- (void)setupViewForIsRecording:(BOOL)isRecording {
    if (isRecording) {
        [self.recordButton setBackgroundImage:[UIImage imageNamed:@"recordButtonRecording"]];
        [self setupRecordingsButtonShouldBeEnabled:NO];
    } else {
        [self.recordButton setBackgroundImage:[UIImage imageNamed:@"recordButton"]];
        [self setupRecordingsButtonShouldBeEnabled:YES];
    }
}

- (void)setupRecordingsButtonShouldBeEnabled:(BOOL)enabled {
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
    [self.recordingsButton setAttributedTitle:attributedTitle];
    [self.recordingsButton setEnabled:enabled];
}

#pragma mark - User Action Methods

- (IBAction)recordButtonPressed {
    [self setupRecordingsButtonShouldBeEnabled:NO];
    // send message to phone that record button was pressed
    NSDictionary *userInfo = @{kWatchExtKeyMessageType : kWatchExtKeyMessageTypeRecordButtonPressed};
    [RecorderInterfaceController openParentApplication:userInfo reply:^(NSDictionary *replyInfo, NSError *error) {
        BOOL isRecording = [[replyInfo objectForKey:kWatchExtKeyIsRecording] boolValue];
        [self setupViewForIsRecording:isRecording];
    }];
}

- (IBAction)recordingsButtonPressed {
    [self pushControllerWithName:@"RecordingsInterfaceController" context:nil];
}

@end



