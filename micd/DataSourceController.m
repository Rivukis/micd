//
//  DataSource.m
//  micd
//
//  Created by Timothy Hise on 2/13/15.
//  Copyright (c) 2015 CleverKnot. All rights reserved.
//

#import "DataSourceController.h"
#import "FakesForProject.h"
#import "Constants.h"

static NSString *const kRecordingsPlist = @"recordings.plist";
static BOOL const kUseFakes = YES;

@interface DataSourceController ()

@property (assign, nonatomic, readwrite) NSUInteger numberOfRecordings;
@property (strong, nonatomic) NSMutableArray *recordings;

@end

@implementation DataSourceController

- (instancetype)init {
    return [DataSourceController sharedDataSource];
}

+ (DataSourceController *)sharedDataSource {
    static DataSourceController *sharedDataSource = nil;
    @synchronized(self) {
        if (!sharedDataSource) {
            sharedDataSource = [[self alloc] init_common];
        }
    }
    return sharedDataSource;
}

- (instancetype)init_common {
    self = [super init];
    if (self) {
        if (kUseFakes) {
            _recordings = [[FakesForProject fakeArrayOfSearchItems] mutableCopy];
        }
    }
    return self;
}

- (void)saveData {
    if (kUseFakes) return;
    
    NSString *recordingsPlistPath = [[Constants documentsDirectory] stringByAppendingPathComponent:kRecordingsPlist];
    [NSKeyedArchiver archiveRootObject:self.recordings toFile:recordingsPlistPath];
}

- (void)saveRecording:(Recording *)recording {
    [self.recordings insertObject:recording atIndex:0];
    [self saveData];
}

- (void)deleteRecording:(Recording *)recording {
    [self.recordings removeObject:recording];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    [fileManager removeItemAtURL:[NSURL fileURLWithPath:recording.urlString] error:nil];
    [self saveData];
}

- (NSUInteger)numberOfRecordings {
    return self.recordings.count;
}

- (NSArray *)recordings {
    if (!_recordings) {
        _recordings = [NSMutableArray array];
        NSString *recordingsPlistPath = [[Constants documentsDirectory] stringByAppendingPathComponent:kRecordingsPlist];
        if ([DataSourceController isPlistFileInDocs:recordingsPlistPath]) {
            _recordings = [NSKeyedUnarchiver unarchiveObjectWithFile:recordingsPlistPath];
        }
    }
    return _recordings;
}

+ (BOOL)isPlistFileInDocs:(NSString *)fileName {
    NSFileManager *defaultManager = [NSFileManager defaultManager];
    return [defaultManager fileExistsAtPath:fileName];
}
@end
