#import "ViewAnimator.h"

@implementation ViewAnimator

+ (POPSpringAnimation *)springAnimationFromFrameTo:(CGRect)fromFrame toFrame:(CGRect)toFrame {
    POPSpringAnimation *animation = [POPSpringAnimation animationWithPropertyNamed:kPOPViewFrame];
    animation.fromValue = [NSValue valueWithCGRect:fromFrame];
    animation.toValue = [NSValue valueWithCGRect:toFrame];
    animation.springBounciness = 8;
    animation.springSpeed = 8;
    return animation;
}

+ (POPSpringAnimation *)springAnimationForTransformToScale:(CGSize)toScale {
    POPSpringAnimation *animation = [POPSpringAnimation animationWithPropertyNamed:kPOPViewScaleXY];
    animation.toValue = [NSValue valueWithCGSize:toScale];
    animation.springBounciness = 1;
    animation.springSpeed = 20;
    return animation;
}

@end
