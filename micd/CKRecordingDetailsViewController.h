//
//  CKRecordingDetailsViewController.h
//  Recorder
//
//  Created by Brian Radebaugh on 1/7/15.
//  Copyright (c) 2015 CleverKnot. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CKRecording;

@interface CKRecordingDetailsViewController : UIViewController

@property (nonatomic, strong) CKRecording *recording;

@end