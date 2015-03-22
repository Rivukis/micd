//
//  WireTapStyleKit.h
//  wiretap
//
//  Created by Timmietch on 3/21/15.
//  Copyright (c) 2015 cleverKnot. All rights reserved.
//
//  Generated by PaintCode (www.paintcodeapp.com)
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface WireTapStyleKit : NSObject

// iOS Controls Customization Outlets
@property(strong, nonatomic) IBOutletCollection(NSObject) NSArray* homeViewTargets;
@property(strong, nonatomic) IBOutletCollection(NSObject) NSArray* gearsCircleTargets;
@property(strong, nonatomic) IBOutletCollection(NSObject) NSArray* micdBackgroundTargets;
@property(strong, nonatomic) IBOutletCollection(NSObject) NSArray* singleRecordingCellTargets;
@property(strong, nonatomic) IBOutletCollection(NSObject) NSArray* recordingsDropdownTargets;
@property(strong, nonatomic) IBOutletCollection(NSObject) NSArray* leftRecordingCellBackgroundTargets;
@property(strong, nonatomic) IBOutletCollection(NSObject) NSArray* rightRecordingCellBackgroundTargets;
@property(strong, nonatomic) IBOutletCollection(NSObject) NSArray* leftRecordingCellDropdownTargets;
@property(strong, nonatomic) IBOutletCollection(NSObject) NSArray* rightRecordingCellDropdownTargets;
@property(strong, nonatomic) IBOutletCollection(NSObject) NSArray* pencilTargets;
@property(strong, nonatomic) IBOutletCollection(NSObject) NSArray* progressTimeIndicatorViewTargets;
@property(strong, nonatomic) IBOutletCollection(NSObject) NSArray* tableviewFaderTargets;
@property(strong, nonatomic) IBOutletCollection(NSObject) NSArray* pauseCircleButtonTargets;
@property(strong, nonatomic) IBOutletCollection(NSObject) NSArray* playCircleButtonTargets;
@property(strong, nonatomic) IBOutletCollection(NSObject) NSArray* playButtonTargets;
@property(strong, nonatomic) IBOutletCollection(NSObject) NSArray* pauseButtonTargets;
@property(strong, nonatomic) IBOutletCollection(NSObject) NSArray* thumbImageTargets;
@property(strong, nonatomic) IBOutletCollection(NSObject) NSArray* reverseDoubleArrowTargets;
@property(strong, nonatomic) IBOutletCollection(NSObject) NSArray* shareButtonTargets;
@property(strong, nonatomic) IBOutletCollection(NSObject) NSArray* editCircleTargets;
@property(strong, nonatomic) IBOutletCollection(NSObject) NSArray* micdAppIconTargets;

// Drawing Methods
+ (void)drawHomeView;
+ (void)drawGearsCircle;
+ (void)drawMicdBackground;
+ (void)drawSingleRecordingCell;
+ (void)drawRecordingsDropdown;
+ (void)drawLeftRecordingCellBackground;
+ (void)drawRightRecordingCellBackground;
+ (void)drawLeftRecordingCellDropdown;
+ (void)drawRightRecordingCellDropdown;
+ (void)drawCanvas1;
+ (void)drawCanvas2;
+ (void)drawRecordButtonWithArcEndAngle: (CGFloat)arcEndAngle arcStartAngle: (CGFloat)arcStartAngle strokeWidth: (CGFloat)strokeWidth;
+ (void)drawGearsWithPositiveGearRotation: (CGFloat)positiveGearRotation negativeGearRotation: (CGFloat)negativeGearRotation;
+ (void)drawBackgroundCordWithColor: (UIColor*)color;
+ (void)drawGripCircle;
+ (void)drawPencil;
+ (void)drawPlayAssetWithVeryDarkBlue: (UIColor*)veryDarkBlue arcStart: (CGFloat)arcStart arcEnd: (CGFloat)arcEnd;
+ (void)drawProgressTimeIndicatorView;
+ (void)drawTableviewFader;
+ (void)drawPauseCircleButton;
+ (void)drawPlayCircleButton;
+ (void)drawPlayButton;
+ (void)drawPauseButton;
+ (void)drawRewindButtonWithAmountBack: (NSString*)amountBack;
+ (void)drawForwardButtonWithAmountForward: (NSString*)amountForward;
+ (void)drawThumbImage;
+ (void)drawForwardDoubleArrowWithAmountForward: (NSString*)amountForward;
+ (void)drawReverseDoubleArrow;
+ (void)drawShareButton;
+ (void)drawEditCircle;
+ (void)drawMicdAppIcon;

// Generated Images
+ (UIImage*)imageOfHomeView;
+ (UIImage*)imageOfGearsCircle;
+ (UIImage*)imageOfMicdBackground;
+ (UIImage*)imageOfSingleRecordingCell;
+ (UIImage*)imageOfRecordingsDropdown;
+ (UIImage*)imageOfLeftRecordingCellBackground;
+ (UIImage*)imageOfRightRecordingCellBackground;
+ (UIImage*)imageOfLeftRecordingCellDropdown;
+ (UIImage*)imageOfRightRecordingCellDropdown;
+ (UIImage*)imageOfRecordButtonWithArcEndAngle: (CGFloat)arcEndAngle arcStartAngle: (CGFloat)arcStartAngle strokeWidth: (CGFloat)strokeWidth;
+ (UIImage*)imageOfGearsWithPositiveGearRotation: (CGFloat)positiveGearRotation negativeGearRotation: (CGFloat)negativeGearRotation;
+ (UIImage*)imageOfPencil;
+ (UIImage*)imageOfPlayAssetWithVeryDarkBlue: (UIColor*)veryDarkBlue arcStart: (CGFloat)arcStart arcEnd: (CGFloat)arcEnd;
+ (UIImage*)imageOfProgressTimeIndicatorView;
+ (UIImage*)imageOfTableviewFader;
+ (UIImage*)imageOfPauseCircleButton;
+ (UIImage*)imageOfPlayCircleButton;
+ (UIImage*)imageOfPlayButton;
+ (UIImage*)imageOfPauseButton;
+ (UIImage*)imageOfRewindButtonWithAmountBack: (NSString*)amountBack;
+ (UIImage*)imageOfForwardButtonWithAmountForward: (NSString*)amountForward;
+ (UIImage*)imageOfThumbImage;
+ (UIImage*)imageOfForwardDoubleArrowWithAmountForward: (NSString*)amountForward;
+ (UIImage*)imageOfReverseDoubleArrow;
+ (UIImage*)imageOfShareButton;
+ (UIImage*)imageOfEditCircle;
+ (UIImage*)imageOfMicdAppIcon;

@end



@interface UIColor (PaintCodeAdditions)

- (UIColor*)blendedColorWithFraction: (CGFloat)fraction ofColor: (UIColor*)color;

@end
