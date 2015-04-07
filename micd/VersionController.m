#import "VersionController.h"
#import "Constants.h"

@implementation VersionController

+ (void)restoreDefaultSettings {
    [VersionController setDefaultsStartingAtVersion:Version_0];
}

+ (void)updateVersion {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    Version currentVersion = [userDefaults integerForKey:kUserDefaultsKeyCurrentVersion];
    
    [VersionController setDefaultsStartingAtVersion:currentVersion];
    
    [userDefaults setInteger:Version_1_0 forKey:kUserDefaultsKeyCurrentVersion];
    [userDefaults synchronize];
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
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setInteger:0 forKey:kUserDefaultsKeyMainColor];
    [userDefaults setBool:YES forKey:kUserDefaultsKeyRecordingsSavePlaybackPosition];
    [userDefaults setBool:NO forKey:kUserDefaultsKeyStartRecordingOnAppDidBecomeActive];
    [userDefaults setInteger:15*60 forKey:kUserDefaultsKeyMaxRecordingLength];
    [userDefaults setBool:YES forKey:kUserDefaultsKeyAutoStartRecordingAfterMaximumReached];
}

@end
