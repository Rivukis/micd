#import <UIKit/UIKit.h>

@interface UIColor (Palette)

+ (UIColor *)vibrantBlue;

+ (UIColor *)vibrantLightBlue;

+ (UIColor *)vibrantVeryLightBlue;

+ (UIColor *)vibrantDarkBlue;

+ (UIColor *)vibrantDarkBlueHalfOpacity;

// just like vibrantDarkBlueHalfOpacity but without the alpha actually being lowered
+ (UIColor *)vibrantVeryDarkBlue;

+ (UIColor *)vibrantBlueText;

+ (UIColor *)vibrantBlueHalfOpacity;

+ (UIColor *)vibrantLightBlueText;

+ (UIColor *)recordRed;

+ (UIColor *)babyBlue;

+ (UIColor *)backgroundGray;

+ (UIColor *)orangeComplimentary;

@end
