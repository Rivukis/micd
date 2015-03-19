//
//  RecordingsSection.h
//  micd
//
//  Created by Timothy Hise on 2/27/15.
//  Copyright (c) 2015 CleverKnot. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RecordingCellModel;
@protocol RecordingCellModelDelegate;

@interface RecordingsSection : NSObject

@property (nonatomic, readonly) NSInteger numberOfCellModels;

+ (NSArray *)arrayOfSectionsForRecordings:(NSArray *)recordings ascending:(BOOL)ascending cellModelDelegate:(id<RecordingCellModelDelegate>)cellModelDelegate;

- (RecordingCellModel *)cellModelAtIndex:(NSInteger)index;
- (NSString *)dateAsString;

@end
