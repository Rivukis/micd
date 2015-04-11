#import <pop/POP.h>
#import <UIKit/UIKit.h>

@interface PopViewAnimator : NSObject

+ (POPSpringAnimation *)springAnimationFromFrameTo:(CGRect)fromFrame toFrame:(CGRect)toFrame;
+ (POPSpringAnimation *)springAnimationForTransformToScale:(CGSize)toScale;
+ (POPSpringAnimation *)springAnimationGrowFromNothing;
+ (POPSpringAnimation *)springAnimationShrinkToNothing;
+ (POPSpringAnimation *)springAnimationButtonBounce;
+ (POPSpringAnimation *)springAnimationCellBounce;
+ (POPSpringAnimation *)springRotater;
    
@end
