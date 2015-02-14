//
//  GearsView.m
//  micd
//
//  Created by Timothy Hise on 2/9/15.
//  Copyright (c) 2015 CleverKnot. All rights reserved.
//

#import "GearsView.h"
#import "WireTapStyleKit.h"
#import "UIColor+Palette.h"
#import "GearBackingLayer.h"

@implementation GearsView

//-(void)drawRect:(CGRect)rect {
//    [WireTapStyleKit drawGearsWithColor:[UIColor vibrantBlue] positiveGearRotation:self.positiveGearRotationAngle negativeGearRotation:self.negativeGearRotationAngle scaleX:self.scale scaleY:self.scale];
//}

+ (Class) layerClass
{
    return [GearBackingLayer class];
}

@end
