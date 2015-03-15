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

@protocol EditingStateChangedDelegate <NSObject>

- (BOOL)shouldGotoEditingStateForCellModel:(RecordingCellModel *)cellModel;

@end

typedef NS_ENUM(NSUInteger, CellState) {
    CellStateDefault = 1,
    CellStateEditing,
    CellStatePlaying,
    CellStatePlayingAndEditing
};

@interface RecordingCellModel : NSObject

@property (nonatomic, assign) CellState state;
@property (nonatomic, weak) id<EditingStateChangedDelegate> editingStateChangedDelegate;

@property (nonatomic, strong, readonly) Recording *recording;
@property (nonatomic, weak ,readonly) NSString *length;
@property (nonatomic, weak ,readonly) NSString *date;
@property (nonatomic, weak ,readonly) NSString *title;
@property (nonatomic, weak, readonly) NSArray *tags;
@property (nonatomic, weak, readonly) AVAsset *avAsset;

- (instancetype)initWithRecording:(Recording *)recording delegate:(id<EditingStateChangedDelegate>)editingStateDelegate;
- (CGFloat)heightForState;

- (void)editingPressed;
- (void)titleDidChange:(NSString *)title;

@end
