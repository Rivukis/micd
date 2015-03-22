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

+ (POPSpringAnimation *)springAnimationGrowFromNothing; {
    POPSpringAnimation *animation = [POPSpringAnimation animationWithPropertyNamed:kPOPViewScaleXY];
    animation.fromValue = [NSValue valueWithCGSize:CGSizeMake(0.1, 0.1)];
    animation.toValue = [NSValue valueWithCGSize:CGSizeMake(1, 1)];
    animation.velocity = [NSValue valueWithCGPoint:CGPointMake(8, 8)];
    animation.springBounciness = 10.f;
    
    return animation;
}

+ (POPSpringAnimation *)springAnimationShrinkToNothing; {
    POPSpringAnimation *animation = [POPSpringAnimation animationWithPropertyNamed:kPOPViewScaleXY];
    animation.fromValue = [NSValue valueWithCGSize:CGSizeMake(1, 1)];
    animation.toValue = [NSValue valueWithCGSize:CGSizeMake(0.1, 0.1)];
    animation.velocity = [NSValue valueWithCGPoint:CGPointMake(8, 8)];
    animation.springBounciness = 10.f;
    
    return animation;
}

+ (POPSpringAnimation *)springAnimationBounce {
    POPSpringAnimation *animation = [POPSpringAnimation animationWithPropertyNamed:kPOPViewScaleXY];
    animation.velocity = [NSValue valueWithCGPoint:CGPointMake(10, 10)];
    animation.springBounciness = 20.f;
    
    return animation;
}

@end
