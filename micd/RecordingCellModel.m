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
#import "DataSourceController.h"

@interface RecordingCellModel ()

@property (nonatomic, weak) id<RecordingCellModelDelegate> delegate;
@property (nonatomic, strong, readwrite) Recording *recording;
@property (nonatomic, strong, readwrite) NSString *title;

@end

@implementation RecordingCellModel

- (instancetype)initWithRecording:(Recording *)recording delegate:(id<RecordingCellModelDelegate>)delegate {
    self = [super init];
    if (self) {
        _recording = recording;
        _delegate = delegate;
    }
    return self;
}

- (CGFloat)heightForState {
    return 50.0f;
}

- (void)changeRecordingTitle:(NSString *)title {
    [self.delegate cellModel:self shouldChangeRecordingTitle:title];
}

- (NSString *)description {
    return [NSString stringWithFormat:@"%@ - %@", self.recording.title, self.recording];
}

- (NSString *)title {
    if (self.recording.title.length > 0) {
        return self.recording.title;
    } else {
        return [RecordingCellModel titlePlaceholderText];
    }
}

+ (NSString *)titlePlaceholderText {
    return @"Tap and hold to edit";
}

@end
