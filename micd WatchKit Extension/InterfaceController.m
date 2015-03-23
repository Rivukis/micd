//
//  InterfaceController.m
//  micd WatchKit Extension
//
//  Created by Timothy Hise on 3/22/15.
//  Copyright (c) 2015 CleverKnot. All rights reserved.
//

#import "InterfaceController.h"
#import "Constants.h"

@interface InterfaceController()

@property (weak, nonatomic) IBOutlet WKInterfaceButton *recordButton;

@end


@implementation InterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    
    NSDictionary *userInfo = @{kWatchExtKeyMessageType : kWatchExtKeyMessageTypeWillActivate};
    [InterfaceController openParentApplication:userInfo reply:^(NSDictionary *replyInfo, NSError *error) {
        BOOL isRecording = [[replyInfo objectForKey:kWatchExtKeyIsRecording] boolValue];
        [self setupViewForIsRecording:isRecording];
    }];

    // Configure interface objects here.
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

- (IBAction)recordButtonPressed {
    // send message to phone that record button was pressed
    NSDictionary *userInfo = @{kWatchExtKeyMessageType : kWatchExtKeyMessageTypeRecordButtonPressed};
    [InterfaceController openParentApplication:userInfo reply:^(NSDictionary *replyInfo, NSError *error) {
        BOOL isRecording = [[replyInfo objectForKey:kWatchExtKeyIsRecording] boolValue];
        [self setupViewForIsRecording:isRecording];
    }];
}

- (void)setupViewForIsRecording:(BOOL)isRecording {
    if (isRecording) {
        [self.recordButton setBackgroundImage:[UIImage imageNamed:@"recordButtonRecording"]];
    } else {
        [self.recordButton setBackgroundImage:[UIImage imageNamed:@"recordButton"]];
    }
}

@end



