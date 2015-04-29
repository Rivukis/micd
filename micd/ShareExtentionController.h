//
//  ShareExtentionController.h
//  micd
//
//  Created by Brian Radebaugh on 4/27/15.
//  Copyright (c) 2015 CleverKnot. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class Recording;

typedef NS_ENUM(NSInteger, ShareExtentionControllerFileType) {
    ShareExtentionControllerFileTypeMovie = 1,
    ShareExtentionControllerFileTypeAudio
};

@interface ShareExtentionController : NSObject

+ (void)presentShareExtensionForRecording:(Recording *)recording fileType:(ShareExtentionControllerFileType)fileType presenter:(UIViewController *)presenter;

@end
