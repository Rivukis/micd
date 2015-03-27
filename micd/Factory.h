//
//  Factory.h
//  micd
//
//  Created by Brian Radebaugh on 3/27/15.
//  Copyright (c) 2015 CleverKnot. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol RecordingCellModelDelegate;

@interface Factory : NSObject

+ (NSArray *)arrayOfSectionsForRecordings:(NSArray *)recordings ascending:(BOOL)ascending cellModelDelegate:(id<RecordingCellModelDelegate>)cellModelDelegate;

@end
