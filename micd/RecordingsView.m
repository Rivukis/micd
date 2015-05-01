#import "RecordingsView.h"

@implementation RecordingsView

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    
    if (![super pointInside:point withEvent:event]) {
        //not the view we are concerned with
        return NO;
    }
    
    CGPoint convertedPointForPlaybackContainerView = [self.playbackAreaView convertPoint:point fromView:self];
    BOOL isInsidePlaybackContainerView = [self.playbackAreaView pointInside:convertedPointForPlaybackContainerView withEvent:event];
    
    if (!isInsidePlaybackContainerView) {
        return YES;
    }
    
    for (UIView *playerControl in self.playerControlElements) {
        CGPoint convertedPointForPlayerControl = [playerControl convertPoint:point fromView:self];
        BOOL isInsidePlayerControl = [playerControl pointInside:convertedPointForPlayerControl withEvent:event];
        
        if (isInsidePlaybackContainerView && isInsidePlayerControl && playerControl.userInteractionEnabled) {
            //hit button
            return YES;
        }
    }
    //allow pan
    return NO;
}

@end
