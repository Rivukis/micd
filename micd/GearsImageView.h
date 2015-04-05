#import <UIKit/UIKit.h>

@interface GearsImageView : UIImageView

@property (nonatomic) CGFloat positiveGearRotationAngle;
@property (nonatomic) CGFloat negativeGearRotationAngle;

- (void)moveGearsWithRotationAngle:(CGFloat)angle;

@end
