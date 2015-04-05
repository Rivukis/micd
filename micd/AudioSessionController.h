#import <Foundation/Foundation.h>

@interface AudioSessionController : NSObject

+ (AudioSessionController *)sharedAudioSessionController;
- (instancetype)init NS_UNAVAILABLE;

- (void)setupAudioSession;
- (void)setAudioSessionOutputToSpeakersIfCurrentlySetToReciever;

@end
