//
//  GearsImageView.h
//  micd
//
//  Created by Timothy Hise on 2/12/15.
//  Copyright (c) 2015 CleverKnot. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GearsImageView : UIImageView

@property (nonatomic) CGFloat positiveGearRotationAngle;
@property (nonatomic) CGFloat negativeGearRotationAngle;

- (void)moveGearsWithRotationAngle:(CGFloat)angle;

@end
