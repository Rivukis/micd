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

@interface RecordingCellModel ()

@property (nonatomic, strong, readwrite) Recording *recording;

@end

@implementation RecordingCellModel

- (instancetype)initWithRecording:(Recording *)recording {
    self = [super init];
    if (self) {
        _recording = recording;
        _state = CellStateDefault;
    }
    return self;
}

- (CGFloat)heightForState {
    switch (self.state) {
        case CellStateDefault:
            return 45.0f;
        case CellStateEditing:
            return 120.0f;
        case CellStatePlaying:
            return 100.0f;
        case CellStatePlayingAndEditing:
            return 145.0f;
        default:
            return 45.0f;
    }
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
