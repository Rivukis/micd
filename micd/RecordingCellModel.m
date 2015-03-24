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
@property (nonatomic, strong, readwrite) NSString *title;

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
    return 50.0f;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"%@ - %@", self.recording.title, self.recording];
}

- (NSString *)title {
    self.title = self.recording.title;
    if ([_title isEqualToString:self.recording.dateAsString]) {
        return @"Tap and hold to edit";
    }
    
    return _title;
}

@end
