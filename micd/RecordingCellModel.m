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
@property (nonatomic, assign, readwrite) CellState state;

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

- (void)turnOnEditingState {
    if (self.state == CellStateDefault) {
        self.state = CellStateEditing;
    } else if (self.state == CellStatePlaying) {
        self.state = CellStatePlayingAndEditing;
    }
}

- (void)turnOffEditingState {
    if (self.state == CellStateEditing) {
        self.state = CellStateDefault;
    } else if (self.state == CellStatePlayingAndEditing) {
        self.state = CellStatePlaying;
    }
}

- (void)turnOnPlayingState {
    if (self.state == CellStateDefault) {
        self.state = CellStatePlaying;
    } else if (self.state == CellStateEditing) {
        self.state = CellStatePlayingAndEditing;
    }
}

- (void)turnOffPlayingState {
    if (self.state == CellStatePlaying) {
        self.state = CellStateDefault;
    } else if (self.state == CellStatePlayingAndEditing) {
        self.state = CellStateEditing;
    }
}

//- (void)playModeToggled {
//    switch (self.state) {
//        case CellStateDefault:
//            self.state = CellStatePlaying;
//            break;
//        case CellStateEditing:
//            self.state = CellStatePlayingAndEditing;
//            break;
//        case CellStatePlaying:
//            self.state = CellStateDefault;
//            break;
//        case CellStatePlayingAndEditing:
//            self.state = CellStateEditing;
//            break;
//    }
//}
//
- (void)editModeToggled {
//    if ([self.editingStateChangedDelegate shouldChangeEditingStateForCellModel:self]) {
    
    
    if (self.state == CellStateEditing || self.state == CellStatePlayingAndEditing) {
        [self turnOffEditingState];
        [self.editingStateChangedDelegate editingModeTurnedOff:self];
    } else {
        [self turnOnEditingState];
        [self.editingStateChangedDelegate editingModeTurnedOn:self];
    }
        
//        switch (self.state) {
//            case CellStateDefault:
//                self.state = CellStateEditing;
//                break;
//            case CellStateEditing:
//                self.state = CellStateDefault;
//                break;
//            case CellStatePlaying:
//                self.state = CellStatePlayingAndEditing;
//                break;
//            case CellStatePlayingAndEditing:
//                self.state = CellStatePlaying;
//                break;
//        }
//    }
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
