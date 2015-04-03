#import "PopViewAnimator.h"

@implementation PopViewAnimator

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
    animation.toValue = [NSValue valueWithCGSize:CGSizeMake(0.0001, 0.0001)];
    animation.velocity = [NSValue valueWithCGPoint:CGPointMake(20, 20)];
    animation.springBounciness = 0.0f;
    
    return animation;
}

+ (POPSpringAnimation *)springAnimationButtonBounce {
    POPSpringAnimation *animation = [POPSpringAnimation animationWithPropertyNamed:kPOPViewScaleXY];
    animation.velocity = [NSValue valueWithCGPoint:CGPointMake(-10, -10)];
    animation.springBounciness = 16.f;
    
    return animation;
}

+ (POPSpringAnimation *)springAnimationCellBounce {
    POPSpringAnimation *animation = [POPSpringAnimation animationWithPropertyNamed:kPOPViewScaleXY];
    animation.velocity = [NSValue valueWithCGPoint:CGPointMake(-2, -2)];
    animation.springBounciness = 12.0f;
    
    return animation;
}


@end
