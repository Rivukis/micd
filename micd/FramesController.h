//
//  CustomFrames.h
//  micd
//
//  Created by Brian Radebaugh on 2/15/15.
//  Copyright (c) 2015 CleverKnot. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, PositionState) {
    PositionStateRecordings = 1,
    PositionStateHome,
    PositionStateSettings,
};

@protocol FramesBasedOnStateProtocol <NSObject>

- (void)setInitialStateFrame;
- (void)adjustFrameBasedOnTranslation:(CGPoint)translation;

@optional
- (CGRect)frameForState:(PositionState)state;

@end

@interface FramesController : NSObject

+ (CGRect)adjustedFrameBasedOnHeightFromOriginalFrame:(CGRect)originalFrame;
+ (CGRect)adjustedFrameBasedOnWidthFromOriginalFrame:(CGRect)originalFrame;

@end
