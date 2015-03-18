//
//  RecordingCellModel.m
//  micd
//
//  Created by Timothy Hise on 3/1/15.
//  Copyright (c) 2015 CleverKnot. All rights reserved.
//

#import "RecordingCellModel.h"
#import "Recording.h"
#import <UIKit/UIKit.h>
#import "DataSourceController.h"
#import "MTKValidKeyPath.h"

@interface RecordingCellModel ()

@property (nonatomic, strong, readwrite) Recording *recording;

@end

@implementation RecordingCellModel

- (instancetype)initWithRecording:(Recording *)recording delegate:(id<RecordingCellModelDelegate>)editingStateDelegate {
    self = [super init];
    if (self) {
        _recording = recording;
        _delegate = editingStateDelegate;
    }
    return self;
}

- (CellState)state {
    if (self.isEditing) {
        return CellStateEditing;
    }
    if (self.isPlaying) {
        return CellStatePlaying;
    }
    if (self.isPaused) {
        return CellStatePaused;
    }
    
    return CellStateDefault;
}

+ (NSSet *)keyPathsForValuesAffectingState {
    return [NSSet setWithArray:
            @[MTK_VALID_KEY(RecordingCellModel, isPlaying),
              MTK_VALID_KEY(RecordingCellModel, isPaused),
              MTK_VALID_KEY(RecordingCellModel, isEditing)
              ]];
}

- (void)setPlaying:(BOOL)playing {
    _paused = NO;
    _playing = playing;
}

- (void)setPaused:(BOOL)paused {
    _playing = NO;
    _paused = paused;
}

- (void)editingPressed {
    [self.delegate editingPressedOnCellModel:self];
}

- (void)titleDidChange:(NSString *)title {
    if (title.length > 0 && ![self.recording.title isEqualToString:title]) {
        self.recording.title = title;
        [[DataSourceController sharedDataSource] saveData];
    }
}

- (CGFloat)heightForState {
    return 45.0f;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"%@ - %@", self.recording.title, self.recording];
}

@end
