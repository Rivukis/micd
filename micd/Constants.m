//
//  CKConstants.m
//  Recorder
//
//  Created by Brian Radebaugh on 12/5/14.
//  Copyright (c) 2014 CleverKnot. All rights reserved.
//

#import "Constants.h"

@implementation Constants

+ (NSString *)documentsDirectory {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    return paths.lastObject;
}

@end
