#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, Version) {
    Version_0 = 0,
    Version_1_0,
};

@interface VersionController : NSObject

+ (void)restoreDefaultSettings;
+ (void)updateVersion;

@end
