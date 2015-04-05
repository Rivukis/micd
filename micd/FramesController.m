#import "FramesController.h"

@implementation FramesController

+ (CGRect)adjustedFrameBasedOnHeightFromOriginalFrame:(CGRect)originalFrame {
    CGRect currentScreenBounds = [FramesController currentScreenBounds];
    CGRect designedForScreenBounds = [FramesController screenDesignedForBounds];
    double currentScreenToDesignedForScreenHeightsRatio = currentScreenBounds.size.height / designedForScreenBounds.size.height;
    
    CGFloat adjustedWidth = originalFrame.size.width * currentScreenToDesignedForScreenHeightsRatio;
    CGFloat adjustedHeight = originalFrame.size.height * currentScreenToDesignedForScreenHeightsRatio;
    
    CGFloat originCenterX = originalFrame.origin.x + originalFrame.size.width/2.0f;
    CGFloat adjustedCenterX = originCenterX * currentScreenToDesignedForScreenHeightsRatio;
    
    CGFloat adjustedX = adjustedCenterX - adjustedWidth/2.0f;
    CGFloat adjustedY = originalFrame.origin.y * currentScreenToDesignedForScreenHeightsRatio;
    
    return CGRectMake(adjustedX, adjustedY, adjustedWidth, adjustedHeight);
}

+ (CGRect)adjustedFrameBasedOnWidthFromOriginalFrame:(CGRect)originalFrame {
    CGRect currentScreenBounds = [FramesController currentScreenBounds];
    CGRect designedForScreenBounds = [FramesController screenDesignedForBounds];
    double currentScreenToDesignedForScreenWidthsRatio = currentScreenBounds.size.width / designedForScreenBounds.size.width;
    
    CGFloat adjustedWidth = originalFrame.size.width * currentScreenToDesignedForScreenWidthsRatio;
    CGFloat adjustedHeight = originalFrame.size.height * currentScreenToDesignedForScreenWidthsRatio;
    
    CGFloat originCenterY = originalFrame.origin.y + originalFrame.size.height/2.0f;
    CGFloat adjustedCenterY = originCenterY * currentScreenToDesignedForScreenWidthsRatio;
    
    CGFloat adjustedX = originalFrame.origin.x * currentScreenToDesignedForScreenWidthsRatio;
    CGFloat adjustedY = adjustedCenterY - adjustedHeight/2.0f;
    
    return CGRectMake(adjustedX, adjustedY, adjustedWidth, adjustedHeight);
}

+ (CGRect)currentScreenBounds {
    return [[UIScreen mainScreen] bounds];
}

+ (CGRect)screenDesignedForBounds {
    return CGRectMake(0, 0, 375, 667);
}

@end
