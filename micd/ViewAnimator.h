#import <pop/POP.h>

@interface ViewAnimator : NSObject

+ (POPSpringAnimation *)springAnimationFromFrameTo:(CGRect)fromFrame toFrame:(CGRect)toFrame;
+ (POPSpringAnimation *)springAnimationForTransformToScale:(CGSize)toScale;
    
@end
