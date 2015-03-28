#import "VersionController.h"
#import "Constants.h"

@implementation VersionController

+ (void)restoreDefaultSettings {
    [VersionController setDefaultsStartingAtVersion:Version_0];
}

+ (void)updateVersion {
    Version currentVersion = [[NSUserDefaults standardUserDefaults] integerForKey:kUserDefaultsKeyCurrentVersion];
    
    [VersionController setDefaultsStartingAtVersion:currentVersion];
    
    [[NSUserDefaults standardUserDefaults] setInteger:Version_1_0 forKey:kUserDefaultsKeyCurrentVersion];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (void)setDefaultsStartingAtVersion:(Version)version {
    switch (version) {
        case Version_0:
            [VersionController setDefaultsForVersion_1_0];
        case Version_1_0:
        default:
            break;
    }
}

#pragma mark - Defaults Methods

+ (void)setDefaultsForVersion_1_0 {
    [[NSUserDefaults standardUserDefaults] setBool:NO forKey:kUserDefaultsKeyStartRecordingOnAppDidBecomeActive];
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:kUserDefaultsKeyRecordingsSavePlaybackPosition];
}

@end
