#import "PresentingAnimationController.h"
#import "POP.h"

@implementation PresentingAnimationController

- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext {
    return 0.5f;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {
    
    UIView *fromView = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey].view;
    fromView.tintAdjustmentMode = UIViewTintAdjustmentModeDimmed;
    fromView.userInteractionEnabled = NO;
    
    UIView *toView = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey].view;
    toView.frame = CGRectMake(10,
                              CGRectGetHeight(transitionContext.containerView.bounds),
                              CGRectGetWidth(transitionContext.containerView.bounds) - 20.f,
                              250);
    
//    CGPoint point = CGPointMake(transitionContext.containerView.center.x, transitionContext.containerView.center.y + CGRectGetHeight(transitionContext.containerView.frame));
//    toView.center = point;
    
    [transitionContext.containerView addSubview:toView];
    
    POPSpringAnimation *backgroundColor = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerBackgroundColor];
    backgroundColor.toValue = [UIColor colorWithWhite:0 alpha:.7];
    
    POPSpringAnimation *positionAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPositionY];
    positionAnimation.toValue = @(transitionContext.containerView.bounds.size.height -135);
    positionAnimation.springBounciness = 3;
    [positionAnimation setCompletionBlock:^(POPAnimation *anim, BOOL finished) {
        [transitionContext completeTransition:YES];
    }];
    
    POPSpringAnimation *scaleAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
    scaleAnimation.springBounciness = 15;
    scaleAnimation.fromValue = [NSValue valueWithCGPoint:CGPointMake(1.2, 1.4)];
    
    [toView.layer pop_addAnimation:positionAnimation forKey:@"positionAnimation"];
    [toView.layer pop_addAnimation:scaleAnimation forKey:@"scaleAnimation"];
    [transitionContext.containerView.layer pop_addAnimation:backgroundColor forKey:@"backgroundColor"];
    
}

@end
