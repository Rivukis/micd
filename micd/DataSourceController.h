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
@property (strong, nonatomic, readonly) NSMutableArray *recordings;

+ (DataSourceController *)sharedDataSource;
- (instancetype)init NS_UNAVAILABLE;

- (void)saveRecording:(Recording *)recording;
- (void)deleteRecording:(Recording *)recording;

- (void)saveData;

@end
