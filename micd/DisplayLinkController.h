//
//  DisplayLinkController.h
//  micd
//
//  Created by Timothy Hise on 3/13/15.
//  Copyright (c) 2015 CleverKnot. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DisplayLinkController : NSObject

- (instancetype)initWithTarget:(id)target selector:(SEL)selector;
- (void)addDisplayLinkToRunLoop:(NSRunLoop *)runLoop forMode:(NSString *)mode;

- (void)addSubscriberWithKey:(NSString *)key;
- (void)removeSubscriberWithKey:(NSString *)key;

@end
