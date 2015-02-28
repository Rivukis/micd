//
//  CKRecordingDetailsViewController.m
//  Recorder
//
//  Created by Brian Radebaugh on 1/7/15.
//  Copyright (c) 2015 CleverKnot. All rights reserved.
//

#import "CKRecordingDetailsViewController.h"
#import "Recording.h"

@interface CKRecordingDetailsViewController ()

@property (nonatomic, weak) IBOutlet UITextField *nameTextField;
@property (nonatomic, weak) IBOutlet UITextField *uuidTextField;
@property (nonatomic, weak) IBOutlet UITextField *dateTextField;
@property (nonatomic, weak) IBOutlet UITextField *lengthTextField;

@end

@implementation CKRecordingDetailsViewController

- (void)viewDidLoad {
    self.title = self.recording.title;
    
    self.nameTextField.text = self.recording.title;
    self.uuidTextField.text = self.recording.uuid.UUIDString;
    
    // TODO: fix weekday issue (comming up as huge number instead of a number 1-7)
//    NSString *dateWeekday = [NSString stringWithFormat:@"%ld", (long)self.recording.recordedDate.weekday];
    NSString *dateYear = [NSString stringWithFormat:@"%ld", (long)self.recording.dateComponents.year];
    NSString *dateMonth = [self twoNumberStringWithInteger:self.recording.dateComponents.month];
    NSString *dateDay = [self twoNumberStringWithInteger:self.recording.dateComponents.day];
    NSString *dateHours = [self twoNumberStringWithInteger:self.recording.dateComponents.hour];
    NSString *dateMinutes = [self twoNumberStringWithInteger:self.recording.dateComponents.minute];
    NSString *dateSeconds = [self twoNumberStringWithInteger:self.recording.dateComponents.second];
    NSString *dateTimeZone = [self.recording.dateComponents.timeZone abbreviation];
    self.dateTextField.text = [NSString stringWithFormat:@"%@/%@/%@ %@:%@:%@ %@", dateYear, dateMonth, dateDay, dateHours, dateMinutes, dateSeconds, dateTimeZone];
    
    NSString *lengthHours = [self twoNumberStringWithInteger:self.recording.length.hours];
    NSString *lengthMinutes = [self twoNumberStringWithInteger:self.recording.length.minutes];
    NSString *lengthSeconds = [self twoNumberStringWithInteger:self.recording.length.seconds];
    NSString *lengthCentiseconds = [self twoNumberStringWithInteger:self.recording.length.centiseconds];
    self.lengthTextField.text = [NSString stringWithFormat:@"%@:%@:%@.%@", lengthHours, lengthMinutes, lengthSeconds, lengthCentiseconds];
    
    UIBarButtonItem *rightBarButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave
                                                                                    target:self
                                                                                    action:@selector(saveAndExit)];
    self.navigationItem.rightBarButtonItem = rightBarButton;
}

- (NSString *)twoNumberStringWithInteger:(NSInteger)integer {
    return [NSString stringWithFormat:@"%@%ld", integer < 10 ? @"0" : @"", (long)integer];
}

- (void)saveAndExit {
    [self.recording setRecordingTitle:self.nameTextField.text];
    [self.navigationController popViewControllerAnimated:YES];
}

@end
