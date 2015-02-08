#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface WireTapStyleKit : NSObject

// Drawing Methods
+ (void)drawHomeViewWithColor: (UIColor*)color;
+ (void)drawGripCircleWithColor: (UIColor*)color;
+ (void)drawMicdBackgroundWithColor: (UIColor*)color;
+ (void)drawCanvas1WithColor: (UIColor*)color;
+ (void)drawFullViewWithColor: (UIColor*)color;
+ (void)drawBackgroundCordWithColor: (UIColor*)color;
+ (void)drawRecordButton;
+ (void)drawEmptyCIrcleWithColor: (UIColor*)color;
+ (void)drawSettingsScreenWithColor: (UIColor*)color;

// Generated Images
+ (UIImage*)imageOfFullViewWithColor: (UIColor*)color;

@end
