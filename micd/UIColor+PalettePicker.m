#import "UIColor+PalettePicker.h"
#import "UIColor+Palette.h"
#import "Constants.h"

@implementation UIColor (PalettePicker)

- (UIColor *)colorWithType:(ColorType)colorType {
    ColorOption currentColor = [[NSUserDefaults standardUserDefaults] integerForKey:kUserDefaultsKeyMainColor];
    
    switch (currentColor) {
        case ColorOptionBlue:       return [self blueColorWithType:colorType];
    }
}

- (UIColor *)blueColorWithType:(ColorType)colorType {
    switch (colorType) {
        case ColorTypeDefault:              return [UIColor vibrantBlue];
        case ColorTypeDefaultHalfOpacity:   return [UIColor vibrantBlueHalfOpacity];
        case ColorTypeLight:                return [UIColor vibrantLightBlue];
        case ColorTypeVeryLight:            return [UIColor vibrantVeryLightBlue];
        case ColorTypeDark:                 return [UIColor vibrantDarkBlue];
        case ColorTypeDarkHalfOpacity:      return [UIColor vibrantDarkBlueHalfOpacity];
        case ColorTypeVeryDark:             return [UIColor vibrantVeryDarkBlue];
        case ColorTypeText:                 return [UIColor vibrantBlueText];
        case ColorTypeTextLight:            return [UIColor vibrantLightBlueText];
    }
}

@end
