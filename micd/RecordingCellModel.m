//
//  RecordingCellModel.m
//  micd
//
//  Created by Timothy Hise on 3/1/15.
//  Copyright (c) 2015 CleverKnot. All rights reserved.
//

#import "RecordingCellModel.h"
#import "Recording.h"
#import "MTKValidKeyPath.h"

@interface RecordingCellModel ()

@property (nonatomic, strong, readwrite) Recording *recording;

@end

@implementation RecordingCellModel

- (instancetype)initWithRecording:(Recording *)recording {
    self = [super init];
    if (self) {
        _recording = recording;
    }
    return self;
}

- (CGFloat)heightForState {
    return 45.0f;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"%@ - %@", self.recording.title, self.recording];
}

@end
