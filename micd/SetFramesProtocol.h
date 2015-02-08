#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>

typedef NS_ENUM(NSUInteger, HomeViewContollerPositionState) {
    HomeViewContollerPositionStateRecordings = 0,
    HomeViewContollerPositionStateHome,
    HomeViewContollerPositionStateSettings,
};

@protocol SetFramesProtocol <NSObject>

- (void)setFrameBasedOnState:(HomeViewContollerPositionState)state;
- (void)setInitialStateFrame;
- (void)adjustFrameBasedOnTranslation:(CGPoint)translation;

@end
