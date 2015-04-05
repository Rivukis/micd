//
//  DismissingAnimationController.m
//  micd
//
//  Created by Timothy Hise on 3/22/15.
//  Copyright (c) 2015 CleverKnot. All rights reserved.
//

#import "DismissingAnimationController.h"
#import "Pop.h"

@implementation DismissingAnimationController

- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext {
    return 0.5f;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {
    
    UIView *toView = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey].view;
    toView.tintAdjustmentMode = UIViewTintAdjustmentModeNormal;
    toView.userInteractionEnabled = YES;
    
    UIView *fromView = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey].view;
    
    POPSpringAnimation *backgroundColor = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerBackgroundColor];
    backgroundColor.toValue = [UIColor colorWithWhite:0 alpha:0];
    
    POPBasicAnimation *closeAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerPositionY];
    closeAnimation.toValue = @(toView.layer.position.y * 3);
    [closeAnimation setCompletionBlock:^(POPAnimation *anim, BOOL finished) {
        [transitionContext completeTransition:YES];
    }];
    
    [fromView.layer pop_addAnimation:closeAnimation forKey:@"closeAnimation"];
    [transitionContext.containerView.layer pop_addAnimation:backgroundColor forKey:@"background"];
}

@end
