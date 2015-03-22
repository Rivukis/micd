#import <pop/POP.h>
#import <UIKit/UIKit.h>

@interface ViewAnimator : NSObject

+ (POPSpringAnimation *)springAnimationFromFrameTo:(CGRect)fromFrame toFrame:(CGRect)toFrame;
+ (POPSpringAnimation *)springAnimationForTransformToScale:(CGSize)toScale;
+ (POPSpringAnimation *)springAnimationGrowFromNothing;
+ (POPSpringAnimation *)springAnimationShrinkToNothing;
+ (POPSpringAnimation *)springAnimationBounce;
    
@end
