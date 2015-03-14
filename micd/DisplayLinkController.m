//
//  DisplayLinkController.m
//  micd
//
//  Created by Timothy Hise on 3/13/15.
//  Copyright (c) 2015 CleverKnot. All rights reserved.
//

#import "DisplayLinkController.h"
#import <QuartzCore/QuartzCore.h>

@interface DisplayLinkController ()

@property (strong, nonatomic) CADisplayLink *displayLink;
@property (strong, nonatomic) NSMutableSet *subscribers;

@end

@implementation DisplayLinkController

- (instancetype)initWithTarget:(id)target selector:(SEL)selector {
    self = [super init];
    if (self) {
        _subscribers = [NSMutableSet set];
        _displayLink = [CADisplayLink displayLinkWithTarget:target selector:selector];
        _displayLink.paused = YES;
    }
    return self;
}

- (void)addDisplayLinkToRunLoop:(NSRunLoop *)runLoop forMode:(NSString *)mode {
    [self.displayLink addToRunLoop:runLoop forMode:mode];
}

- (void)addSubscriberWithKey:(NSString *)key {
    [self.subscribers addObject:key];
    self.displayLink.paused = (self.subscribers.count == 0);
}

- (void)removeSubscriberWithKey:(NSString *)key {
    [self.subscribers removeObject:key];
    self.displayLink.paused = (self.subscribers.count == 0);
}

@end
