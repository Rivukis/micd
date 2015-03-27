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
@class RecordingCell;
@class Recording;
@class AVAsset;

@protocol RecordingCellModelDelegate <NSObject>

- (void)cellModel:(RecordingCellModel *)cellModel shouldChangeRecordingTitle:(NSString *)title;

@end

typedef NS_ENUM(NSUInteger, CellState) {
    CellStateDefault,
    CellStatePaused,
    CellStatePlaying
};


@interface RecordingCellModel : NSObject

@property (nonatomic, assign, readonly) CellState state;
@property (nonatomic, strong, readonly) Recording *recording;
@property (nonatomic, strong, readonly) NSString *title;
@property (nonatomic, weak, readonly) AVAsset *avAsset;
@property (nonatomic, assign) CGFloat angle;
@property (nonatomic, assign) BOOL shouldAnimateStateChanges;

- (instancetype)initWithRecording:(Recording *)recording delegate:(id<RecordingCellModelDelegate>)delegate;
- (CGFloat)heightForState;
- (void)changeRecordingTitle:(NSString *)title;
- (void)setCellState:(CellState)cellState;

+ (NSString *)titlePlaceholderText;

@end
