//
//  ViewMovementBehavior.h
//  micd
//
//  Created by Timothy Hise on 3/12/15.
//  Copyright (c) 2015 CleverKnot. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewMovementBehavior : UIDynamicBehavior

@property (nonatomic) CGPoint targetPoint;
@property (nonatomic) CGPoint velocity;

//- (instancetype)initWithItem:(id <UIDynamicItem>)item;

@end
