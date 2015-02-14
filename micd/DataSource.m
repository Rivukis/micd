//
//  DataSource.m
//  micd
//
//  Created by Timothy Hise on 2/13/15.
//  Copyright (c) 2015 CleverKnot. All rights reserved.
//

#import "DataSource.h"

@interface DataSource ()

@property (assign, nonatomic, readwrite) NSUInteger numberOfRecordings;

@property (strong, nonatomic) NSMutableArray *recordings;

@end

@implementation DataSource

+ (DataSource *)sharedInstance {
    static DataSource *sharedDataSource = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedDataSource = [[self alloc] init];
    });
    return sharedDataSource;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _recordings = [NSMutableArray array];
    }
    return self;
}

- (void)addNewRecording:(Recording *)recording {
    [self.recordings addObject:recording];
}

- (Recording *)recordingAtIndex:(NSUInteger)index {
    return self.recordings[index];
}

- (void)deleteRecordingAtIndex:(NSUInteger)index {
    [self.recordings removeObjectAtIndex:index];
}

- (NSUInteger)numberOfRecordings {
    return self.recordings.count;
}

@end
