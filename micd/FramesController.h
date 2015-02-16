//
//  CustomFrames.h
//  micd
//
//  Created by Brian Radebaugh on 2/15/15.
//  Copyright (c) 2015 CleverKnot. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>

typedef NS_ENUM(NSUInteger, HomeViewContollerPositionState) {
    HomeViewContollerPositionStateRecordings = 0,
    HomeViewContollerPositionStateHome,
    HomeViewContollerPositionStateSettings,
};

@protocol FramesBasedOnStateProtocol <NSObject>

- (void)setFrameBasedOnState:(HomeViewContollerPositionState)state;
- (void)setInitialStateFrame;
- (void)adjustFrameBasedOnTranslation:(CGPoint)translation;

@end

@interface FramesController : NSObject

+ (CGRect)adjustedFrameBasedOnHeightFromOriginalFrame:(CGRect)originalFrame;
+ (CGRect)adjustedFrameBasedOnWidthFromOriginalFrame:(CGRect)originalFrame;

@end
