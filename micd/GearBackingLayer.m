//
//  GearBackingLayer.m
//  micd
//
//  Created by Timothy Hise on 2/10/15.
//  Copyright (c) 2015 CleverKnot. All rights reserved.
//

#import "GearBackingLayer.h"

@interface GearBackingLayer ()

@property (nonatomic, assign) CGFloat animationDuration;

@end

@implementation GearBackingLayer
// Return a basic animation
- (CABasicAnimation *) customAnimationForKey: (NSString *) key
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:key];
    animation.fromValue = [self.presentationLayer valueForKey:key];
    // Default to 0.3 second duration
    animation.duration = (_animationDuration == 0.0f) ? 0.3f : _animationDuration;
    return animation;
}

// Add a dynamic response for corner radius updates
-(id<CAAction>)actionForKey:(NSString *)key
{
    if ([key isEqualToString:@"positiveGearRotationAngle"] || [key isEqualToString:@"positiveGearRotationAngle"])
        return [self customAnimationForKey:key];
    return [super actionForKey:key];
}

@end
