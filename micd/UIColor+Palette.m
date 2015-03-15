#import "UIColor+Palette.h"

@implementation UIColor (Palette)

+ (UIColor *)vibrantBlue {
    return [UIColor colorWithRed:41.0f/255.0f green:190.0f/255.0f blue:221.0f/255.0f alpha:1.000f];
}

+ (UIColor *)vibrantLightBlue {
    return [UIColor colorWithRed:111.0f/255.0f green:207.0f/255.0f blue:228.0f/255.0f alpha:1.000f];
}

+ (UIColor *)vibrantVeryLightBlue {
    return [UIColor colorWithRed:158.0f/255.0f green:220.0f/255.0f blue:255.0f/255.0f alpha:1.000f];
}

+ (UIColor *)vibrantDarkBlue {
    return [UIColor colorWithRed:2.0f/255.0f green:133.0f/255.0f blue:158.0f/255.0f alpha:1.000f];
}

+ (UIColor *)vibrantDarkBlueHalfOpacity {
    return [UIColor colorWithRed:2.0f/255.0f green:133.0f/255.0f blue:158.0f/255.0f alpha:0.5f];
}

// just like vibrantDarkBlueHalfOpacity but without the alpha actually being lowered
+ (UIColor *)vibrantVeryDarkBlue {
    return [UIColor colorWithRed:1.0f/255.0f green:67.0f/255.0f blue:79.0f/255.0f alpha:1.000f];
}

+ (UIColor *)vibrantBlueText {
    return [UIColor colorWithRed:0.380f green:0.769f blue:0.871f alpha:1.000f];
}

+ (UIColor *)vibrantLightBlueText {
    return [UIColor colorWithRed:124.0f/255.0f green:219.0f/255.0f blue:237.0f/255.0f alpha:1.000f];
}

+ (UIColor *)vibrantBlueHalfOpacity {
    return [UIColor colorWithRed:0.161f green:0.745f blue:0.867f alpha:0.500f];
}

+ (UIColor *)recordRed {
    return [UIColor colorWithRed:0.992f green:0.188f blue:0.110f alpha:1.000f];
}

+ (UIColor *)babyBlue {
    return [UIColor colorWithRed:88.0f/255.0f green:193.0f/255.0f blue:1.0f alpha:1.0f];
}

+ (UIColor *)backgroundGray {
    return [UIColor colorWithRed:16.0f/255.0f green:72.0f/255.0f blue:84.0f/255.0f alpha:1.0f];
}

+ (UIColor *)orangeComplimentary {
    return [UIColor colorWithRed:255.0f/255.0f green:217.0f/255.0f blue:131.0f/255.0f alpha:1.0f];
}


@end
