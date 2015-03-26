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

@protocol RecordingCellModelDelegate <NSObject>

- (void)cellModel:(RecordingCellModel *)cellModel shouldChangeRecordingTitle:(NSString *)title;

@end

typedef NS_ENUM(NSUInteger, CellState) {
    CellStateDefault,
    CellStatePaused,
    CellStatePlaying
};


@interface RecordingCellModel : NSObject

@property (nonatomic, assign) CellState state;
@property (nonatomic, strong, readonly) Recording *recording;
@property (nonatomic, strong, readonly) NSString *title;
@property (nonatomic, weak, readonly) AVAsset *avAsset;

- (instancetype)initWithRecording:(Recording *)recording delegate:(id<RecordingCellModelDelegate>)delegate;
- (CGFloat)heightForState;
- (void)changeRecordingTitle:(NSString *)title;

+ (NSString *)titlePlaceholderText;

@end
