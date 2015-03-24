//
//  RecordingCellModel.h
//  micd
//
//  Created by Timothy Hise on 3/1/15.
//  Copyright (c) 2015 CleverKnot. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CGBase.h>

@class Recording;
@class AVAsset;

typedef NS_ENUM(NSUInteger, CellState) {
    CellStateDefault = 1,
    CellStatePaused,
    CellStatePlaying
};


@interface RecordingCellModel : NSObject

@property (nonatomic, assign) CellState state;
@property (nonatomic, strong, readonly) Recording *recording;
@property (nonatomic, strong, readonly) NSString *title;
@property (nonatomic, weak, readonly) AVAsset *avAsset;

- (instancetype)initWithRecording:(Recording *)recording;
- (CGFloat)heightForState;

@end
