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

@interface RecordingCellModel ()

@property (nonatomic, strong, readwrite) Recording *recording;

@end

@implementation RecordingCellModel

- (instancetype)initWithRecording:(Recording *)recording delegate:(id<EditingStateChangedDelegate>)editingStateDelegate {
    self = [super init];
    if (self) {
        _recording = recording;
        _state = CellStateDefault;
        _editingStateChangedDelegate = editingStateDelegate;
    }
    return self;
}

- (void)editingPressed {
    if ([self.editingStateChangedDelegate shouldGotoEditingStateForCellModel:self]) {
        switch (self.state) {
            case CellStateDefault:
                self.state = CellStateEditing;
                break;
            case CellStateEditing:
                self.state = CellStateDefault;
                break;
            case CellStatePlaying:
                self.state = CellStatePlayingAndEditing;
                break;
            case CellStatePlayingAndEditing:
                self.state = CellStatePlaying;
                break;
        }
    }
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

- (NSString *)length {
    return self.recording.lengthToDiplay;
}

- (NSString *)date {
    return self.recording.dateAsString;
}

- (NSString *)title {
    return self.recording.title;
}

- (NSArray *)tags {
    return self.recording.tags;
}

- (AVAsset *)avAsset {
    return self.recording.avAsset;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"%@ - %@", self.title, self.recording];
}

@end
