//
//  RecordingsSection.h
//  micd
//
//  Created by Timothy Hise on 2/27/15.
//  Copyright (c) 2015 CleverKnot. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Recording;

@interface RecordingsSection : NSObject

@property (nonatomic, readonly) NSInteger numberOfRecordings;

+ (NSArray *)arrayOfSectionsForRecordings:(NSArray *)recordings;
- (Recording *)recordingAtIndex:(NSInteger)index;
- (NSString *)dateAsString;

@end
