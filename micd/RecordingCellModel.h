//
//  RecordingCellModel.h
//  micd
//
//  Created by Timothy Hise on 3/1/15.
//  Copyright (c) 2015 CleverKnot. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CGBase.h>

@class RecordingCellModel;
@class Recording;
@class AVAsset;


typedef NS_ENUM(NSUInteger, CellState) {
    CellStateDefault = 1,
    CellStateEditing,
    CellStatePaused,
    CellStatePlaying
};


@protocol RecordingCellModelDelegate <NSObject>

- (void)editingPressedOnCellModel:(RecordingCellModel *)cellModel;

@end


@interface RecordingCellModel : NSObject

@property (nonatomic, weak) id<RecordingCellModelDelegate> delegate;
@property (nonatomic, assign, readonly) CellState state;
@property (nonatomic, assign) BOOL playing;
@property (nonatomic, assign) BOOL paused;
@property (nonatomic, assign) BOOL editing;

@property (nonatomic, strong, readonly) Recording *recording;
@property (nonatomic, weak, readonly) AVAsset *avAsset;

- (instancetype)initWithRecording:(Recording *)recording delegate:(id<RecordingCellModelDelegate>)editingStateDelegate;
- (CGFloat)heightForState;

- (void)editingPressed;

- (void)titleDidChange:(NSString *)title;

@end
