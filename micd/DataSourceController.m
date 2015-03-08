//
//  DataSource.m
//  micd
//
//  Created by Timothy Hise on 2/13/15.
//  Copyright (c) 2015 CleverKnot. All rights reserved.
//

#import "DataSourceController.h"
#import "FakesForProject.h"

@interface DataSourceController ()

@property (assign, nonatomic, readwrite) NSUInteger numberOfRecordings;

@property (strong, nonatomic) NSMutableArray *recordings;

@end

@implementation DataSourceController

+ (DataSourceController *)sharedInstance {
    static DataSourceController *sharedDataSource = nil;
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
        NSArray *fakes = [FakesForProject fakeArrayOfSearchItems];
        [_recordings addObjectsFromArray:fakes];
    }
    return self;
}

- (void)saveRecording:(Recording *)recording {
    [self.recordings insertObject:recording atIndex:0];
}

- (NSUInteger)numberOfRecordings {
    return self.recordings.count;
}

- (NSArray *)allRecordings {
    return [self.recordings copy];
}

@end
