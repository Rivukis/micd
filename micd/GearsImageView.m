//
//  GearsImageView.m
//  micd
//
//  Created by Timothy Hise on 2/12/15.
//  Copyright (c) 2015 CleverKnot. All rights reserved.
//

#import "GearsImageView.h"
#import "WireTapStyleKit.h"
#import "UIColor+Palette.h"

@implementation GearsImageView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.positiveGearRotationAngle = 0;
        self.negativeGearRotationAngle = 0;
        self.image = [WireTapStyleKit imageOfGearsWithPositiveGearRotation:0 negativeGearRotation:0];
    }
    return self;
}

- (void)moveGearsWithRotationAngle:(CGFloat)angle {
    self.positiveGearRotationAngle += angle;
    self.negativeGearRotationAngle -= angle;
    self.image = [WireTapStyleKit imageOfGearsWithPositiveGearRotation:self.positiveGearRotationAngle negativeGearRotation:self.negativeGearRotationAngle];
}

@end
