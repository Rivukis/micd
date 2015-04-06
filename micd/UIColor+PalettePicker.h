#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, ColorOption) {
    ColorOptionBlue
};

typedef NS_ENUM(NSInteger, ColorType) {
    ColorTypeDefault,
    ColorTypeDefaultHalfOpacity,
    ColorTypeLight,
    ColorTypeVeryLight,
    ColorTypeDark,
    ColorTypeDarkHalfOpacity,
    ColorTypeVeryDark,
    ColorTypeText,
    ColorTypeTextLight
};

@interface UIColor (PalettePicker)

+ (UIColor *)colorWithType:(ColorType)colorType;

@end
