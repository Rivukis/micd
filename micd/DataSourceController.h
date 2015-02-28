//
//  DataSource.h
//  micd
//
//  Created by Timothy Hise on 2/13/15.
//  Copyright (c) 2015 CleverKnot. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Recording.h"

@interface DataSourceController : NSObject

@property (assign, nonatomic, readonly) NSUInteger numberOfRecordings;

+ (DataSourceController *)sharedInstance;

- (void)addNewRecording:(Recording *)recording;
- (Recording *)recordingAtIndex:(NSUInteger)index;
- (void)deleteRecordingAtIndex:(NSUInteger)index;
- (NSArray *)allRecordings;

@end
