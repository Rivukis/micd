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

typedef NS_ENUM(NSInteger, ShareExtensionControllerFileType) {
    ShareExtensionControllerFileTypeMovie = 1,
    ShareExtensionControllerFileTypeAudio
};

@interface ShareExtensionController : NSObject

+ (void)presentShareExtensionForRecording:(Recording *)recording fileType:(ShareExtensionControllerFileType)fileType presenter:(UIViewController *)presenter completion:(void(^)())completionBlock;

@end
