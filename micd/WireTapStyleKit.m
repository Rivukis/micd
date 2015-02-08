#import "WireTapStyleKit.h"


@implementation WireTapStyleKit

#pragma mark Initialization

+ (void)initialize
{
}

#pragma mark Drawing Methods

+ (void)drawHomeViewWithColor: (UIColor*)color
{
    //// General Declarations
    CGContextRef context = UIGraphicsGetCurrentContext();

    //// Color Declarations
    UIColor* black = [UIColor colorWithRed: 0 green: 0 blue: 0 alpha: 1];

    //// Bezier Drawing
    UIBezierPath* bezierPath = UIBezierPath.bezierPath;
    [bezierPath moveToPoint: CGPointMake(0, 1097)];
    [bezierPath addLineToPoint: CGPointMake(65, 1097)];
    [bezierPath addCurveToPoint: CGPointMake(188.45, 1194.66) controlPoint1: CGPointMake(65, 1097) controlPoint2: CGPointMake(91.45, 1195.4)];
    [bezierPath addCurveToPoint: CGPointMake(311, 1097) controlPoint1: CGPointMake(285.45, 1193.92) controlPoint2: CGPointMake(311, 1097)];
    [bezierPath addLineToPoint: CGPointMake(375, 1097)];
    [bezierPath addLineToPoint: CGPointMake(375, 2087)];
    [bezierPath addLineToPoint: CGPointMake(0, 2087)];
    [bezierPath addLineToPoint: CGPointMake(0, 1097)];
    [black setFill];
    [bezierPath fill];


    //// Bezier 3 Drawing
    CGContextSaveGState(context);
    CGContextTranslateCTM(context, 0, 308);
    CGContextRotateCTM(context, -180 * M_PI / 180);

    UIBezierPath* bezier3Path = UIBezierPath.bezierPath;
    [bezier3Path moveToPoint: CGPointMake(-375, -790)];
    [bezier3Path addLineToPoint: CGPointMake(-311.69, -790)];
    [bezier3Path addCurveToPoint: CGPointMake(-189.27, -642.35) controlPoint1: CGPointMake(-311.69, -790) controlPoint2: CGPointMake(-330.51, -642.35)];
    [bezier3Path addCurveToPoint: CGPointMake(-63.59, -790) controlPoint1: CGPointMake(-48.03, -642.35) controlPoint2: CGPointMake(-63.59, -790)];
    [bezier3Path addLineToPoint: CGPointMake(0, -790)];
    [bezier3Path addLineToPoint: CGPointMake(0, 308)];
    [bezier3Path addLineToPoint: CGPointMake(-375, 308)];
    [bezier3Path addLineToPoint: CGPointMake(-375, -790)];
    [black setFill];
    [bezier3Path fill];

    CGContextRestoreGState(context);


    //// Oval 3 Drawing
    UIBezierPath* oval3Path = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(62.5, 945, 250, 250)];
    [color setStroke];
    oval3Path.lineWidth = 6;
    [oval3Path stroke];


    //// Oval Drawing
    UIBezierPath* ovalPath = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(66.5, 949, 242, 242)];
    [UIColor.blackColor setStroke];
    ovalPath.lineWidth = 2;
    [ovalPath stroke];


    //// Bezier 2 Drawing
    CGContextSaveGState(context);
    CGContextTranslateCTM(context, 187.41, 1191.07);
    CGContextRotateCTM(context, -0.35 * M_PI / 180);

    UIBezierPath* bezier2Path = UIBezierPath.bezierPath;
    [bezier2Path moveToPoint: CGPointMake(-0.12, -1.36)];
    [bezier2Path addCurveToPoint: CGPointMake(-22.71, -3.61) controlPoint1: CGPointMake(-11.66, -1.36) controlPoint2: CGPointMake(-22.71, -3.61)];
    [bezier2Path addCurveToPoint: CGPointMake(-23.83, -0.22) controlPoint1: CGPointMake(-22.71, -3.61) controlPoint2: CGPointMake(-23.59, -1.84)];
    [bezier2Path addCurveToPoint: CGPointMake(1.01, 4.6) controlPoint1: CGPointMake(-24.08, 1.4) controlPoint2: CGPointMake(1.01, 4.6)];
    [bezier2Path addLineToPoint: CGPointMake(24.58, 0.71)];
    [bezier2Path addLineToPoint: CGPointMake(23.11, -3.26)];
    [bezier2Path addCurveToPoint: CGPointMake(-0.12, -1.36) controlPoint1: CGPointMake(23.11, -3.26) controlPoint2: CGPointMake(11.42, -1.36)];
    [bezier2Path closePath];
    [color setFill];
    [bezier2Path fill];

    CGContextRestoreGState(context);


    //// Bezier 4 Drawing
    UIBezierPath* bezier4Path = UIBezierPath.bezierPath;
    [bezier4Path moveToPoint: CGPointMake(190.4, 1168.69)];
    [bezier4Path addCurveToPoint: CGPointMake(214.5, 1189) controlPoint1: CGPointMake(202.2, 1169.88) controlPoint2: CGPointMake(211.77, 1178.11)];
    [bezier4Path addLineToPoint: CGPointMake(160.5, 1189)];
    [bezier4Path addCurveToPoint: CGPointMake(184.34, 1168.71) controlPoint1: CGPointMake(163.24, 1178.04) controlPoint2: CGPointMake(172.87, 1169.96)];
    [bezier4Path addCurveToPoint: CGPointMake(190.4, 1168.69) controlPoint1: CGPointMake(186.32, 1168.49) controlPoint2: CGPointMake(188.35, 1168.48)];
    [bezier4Path closePath];
    [black setFill];
    [bezier4Path fill];


    //// Bezier 5 Drawing
    UIBezierPath* bezier5Path = UIBezierPath.bezierPath;
    [bezier5Path moveToPoint: CGPointMake(190.19, 1171.18)];
    [bezier5Path addCurveToPoint: CGPointMake(212.5, 1190) controlPoint1: CGPointMake(201.07, 1172.29) controlPoint2: CGPointMake(209.92, 1179.91)];
    [bezier5Path addLineToPoint: CGPointMake(162.5, 1190)];
    [bezier5Path addCurveToPoint: CGPointMake(186.29, 1171.06) controlPoint1: CGPointMake(165.23, 1179.29) controlPoint2: CGPointMake(174.96, 1171.56)];
    [bezier5Path addCurveToPoint: CGPointMake(190.19, 1171.18) controlPoint1: CGPointMake(187.58, 1171.01) controlPoint2: CGPointMake(188.88, 1171.04)];
    [bezier5Path closePath];
    [color setFill];
    [bezier5Path fill];


    //// Bezier 6 Drawing
    UIBezierPath* bezier6Path = UIBezierPath.bezierPath;
    [bezier6Path moveToPoint: CGPointMake(180.61, 1181.42)];
    [bezier6Path addLineToPoint: CGPointMake(184.76, 1183.74)];
    [bezier6Path addCurveToPoint: CGPointMake(187.5, 1185.27) controlPoint1: CGPointMake(186.01, 1184.44) controlPoint2: CGPointMake(186.89, 1184.93)];
    [bezier6Path addCurveToPoint: CGPointMake(190.24, 1183.74) controlPoint1: CGPointMake(188.7, 1184.6) controlPoint2: CGPointMake(190.24, 1183.74)];
    [bezier6Path addCurveToPoint: CGPointMake(194.39, 1181.42) controlPoint1: CGPointMake(194.39, 1181.42) controlPoint2: CGPointMake(194.39, 1181.42)];
    [bezier6Path addCurveToPoint: CGPointMake(198.18, 1181.95) controlPoint1: CGPointMake(195.62, 1180.74) controlPoint2: CGPointMake(197.32, 1180.97)];
    [bezier6Path addCurveToPoint: CGPointMake(197.51, 1184.97) controlPoint1: CGPointMake(199.04, 1182.93) controlPoint2: CGPointMake(198.74, 1184.29)];
    [bezier6Path addLineToPoint: CGPointMake(193.36, 1187.29)];
    [bezier6Path addLineToPoint: CGPointMake(189.28, 1189.57)];
    [bezier6Path addCurveToPoint: CGPointMake(187.5, 1190) controlPoint1: CGPointMake(188.69, 1189.9) controlPoint2: CGPointMake(188.09, 1190.02)];
    [bezier6Path addCurveToPoint: CGPointMake(185.79, 1189.61) controlPoint1: CGPointMake(186.91, 1190.02) controlPoint2: CGPointMake(186.31, 1189.9)];
    [bezier6Path addCurveToPoint: CGPointMake(181.7, 1187.32) controlPoint1: CGPointMake(185.73, 1189.57) controlPoint2: CGPointMake(181.7, 1187.32)];
    [bezier6Path addCurveToPoint: CGPointMake(177.49, 1184.97) controlPoint1: CGPointMake(177.49, 1184.97) controlPoint2: CGPointMake(177.49, 1184.97)];
    [bezier6Path addCurveToPoint: CGPointMake(176.82, 1181.95) controlPoint1: CGPointMake(176.26, 1184.29) controlPoint2: CGPointMake(175.96, 1182.93)];
    [bezier6Path addCurveToPoint: CGPointMake(177.49, 1181.42) controlPoint1: CGPointMake(177.01, 1181.74) controlPoint2: CGPointMake(177.24, 1181.56)];
    [bezier6Path addCurveToPoint: CGPointMake(180.61, 1181.42) controlPoint1: CGPointMake(178.4, 1180.91) controlPoint2: CGPointMake(179.65, 1180.88)];
    [bezier6Path closePath];
    [black setFill];
    [bezier6Path fill];


    //// Bezier 7 Drawing
    CGContextSaveGState(context);
    CGContextTranslateCTM(context, 187.4, 948);
    CGContextRotateCTM(context, 0.35 * M_PI / 180);

    UIBezierPath* bezier7Path = UIBezierPath.bezierPath;
    [bezier7Path moveToPoint: CGPointMake(-0.11, 2.34)];
    [bezier7Path addCurveToPoint: CGPointMake(-22.71, 4.59) controlPoint1: CGPointMake(-11.65, 2.34) controlPoint2: CGPointMake(-22.71, 4.59)];
    [bezier7Path addCurveToPoint: CGPointMake(-23.83, 1.2) controlPoint1: CGPointMake(-22.71, 4.59) controlPoint2: CGPointMake(-23.58, 2.81)];
    [bezier7Path addCurveToPoint: CGPointMake(1.02, -3.62) controlPoint1: CGPointMake(-24.08, -0.42) controlPoint2: CGPointMake(1.02, -3.62)];
    [bezier7Path addLineToPoint: CGPointMake(24.59, 0.27)];
    [bezier7Path addLineToPoint: CGPointMake(23.11, 4.24)];
    [bezier7Path addCurveToPoint: CGPointMake(-0.11, 2.34) controlPoint1: CGPointMake(23.11, 4.24) controlPoint2: CGPointMake(11.42, 2.34)];
    [bezier7Path closePath];
    [color setFill];
    [bezier7Path fill];

    CGContextRestoreGState(context);


    //// Bezier 8 Drawing
    UIBezierPath* bezier8Path = UIBezierPath.bezierPath;
    [bezier8Path moveToPoint: CGPointMake(190.39, 971.23)];
    [bezier8Path addCurveToPoint: CGPointMake(214.49, 950.91) controlPoint1: CGPointMake(202.18, 970.03) controlPoint2: CGPointMake(211.76, 961.8)];
    [bezier8Path addLineToPoint: CGPointMake(160.49, 950.91)];
    [bezier8Path addCurveToPoint: CGPointMake(184.33, 971.21) controlPoint1: CGPointMake(163.22, 961.88) controlPoint2: CGPointMake(172.85, 969.95)];
    [bezier8Path addCurveToPoint: CGPointMake(190.39, 971.23) controlPoint1: CGPointMake(186.3, 971.42) controlPoint2: CGPointMake(188.33, 971.43)];
    [bezier8Path closePath];
    [black setFill];
    [bezier8Path fill];


    //// Bezier 9 Drawing
    UIBezierPath* bezier9Path = UIBezierPath.bezierPath;
    [bezier9Path moveToPoint: CGPointMake(190.18, 968.74)];
    [bezier9Path addCurveToPoint: CGPointMake(212.49, 949.91) controlPoint1: CGPointMake(201.06, 967.63) controlPoint2: CGPointMake(209.9, 960.01)];
    [bezier9Path addLineToPoint: CGPointMake(162.49, 949.91)];
    [bezier9Path addCurveToPoint: CGPointMake(186.28, 968.85) controlPoint1: CGPointMake(165.22, 960.62) controlPoint2: CGPointMake(174.95, 968.35)];
    [bezier9Path addCurveToPoint: CGPointMake(190.18, 968.74) controlPoint1: CGPointMake(187.56, 968.91) controlPoint2: CGPointMake(188.87, 968.87)];
    [bezier9Path closePath];
    [color setFill];
    [bezier9Path fill];


    //// Bezier 10 Drawing
    UIBezierPath* bezier10Path = UIBezierPath.bezierPath;
    [bezier10Path moveToPoint: CGPointMake(180.6, 958.49)];
    [bezier10Path addLineToPoint: CGPointMake(184.75, 956.17)];
    [bezier10Path addCurveToPoint: CGPointMake(187.49, 954.64) controlPoint1: CGPointMake(186, 955.47) controlPoint2: CGPointMake(186.88, 954.98)];
    [bezier10Path addCurveToPoint: CGPointMake(190.23, 956.17) controlPoint1: CGPointMake(188.69, 955.32) controlPoint2: CGPointMake(190.23, 956.17)];
    [bezier10Path addCurveToPoint: CGPointMake(194.38, 958.49) controlPoint1: CGPointMake(194.38, 958.49) controlPoint2: CGPointMake(194.38, 958.49)];
    [bezier10Path addCurveToPoint: CGPointMake(198.16, 957.96) controlPoint1: CGPointMake(195.61, 959.18) controlPoint2: CGPointMake(197.3, 958.94)];
    [bezier10Path addCurveToPoint: CGPointMake(197.5, 954.94) controlPoint1: CGPointMake(199.03, 956.98) controlPoint2: CGPointMake(198.73, 955.63)];
    [bezier10Path addLineToPoint: CGPointMake(193.35, 952.62)];
    [bezier10Path addLineToPoint: CGPointMake(189.27, 950.35)];
    [bezier10Path addCurveToPoint: CGPointMake(187.49, 949.92) controlPoint1: CGPointMake(188.68, 950.02) controlPoint2: CGPointMake(188.07, 949.89)];
    [bezier10Path addCurveToPoint: CGPointMake(185.78, 950.31) controlPoint1: CGPointMake(186.9, 949.89) controlPoint2: CGPointMake(186.3, 950.02)];
    [bezier10Path addCurveToPoint: CGPointMake(181.69, 952.59) controlPoint1: CGPointMake(185.72, 950.34) controlPoint2: CGPointMake(181.69, 952.59)];
    [bezier10Path addCurveToPoint: CGPointMake(177.48, 954.94) controlPoint1: CGPointMake(177.48, 954.94) controlPoint2: CGPointMake(177.48, 954.94)];
    [bezier10Path addCurveToPoint: CGPointMake(176.81, 957.96) controlPoint1: CGPointMake(176.25, 955.63) controlPoint2: CGPointMake(175.95, 956.98)];
    [bezier10Path addCurveToPoint: CGPointMake(177.48, 958.49) controlPoint1: CGPointMake(177, 958.17) controlPoint2: CGPointMake(177.22, 958.35)];
    [bezier10Path addCurveToPoint: CGPointMake(180.6, 958.49) controlPoint1: CGPointMake(178.39, 959) controlPoint2: CGPointMake(179.63, 959.03)];
    [bezier10Path closePath];
    [black setFill];
    [bezier10Path fill];
}

+ (void)drawGripCircleWithColor: (UIColor*)color
{
    //// Color Declarations
    UIColor* black = [UIColor colorWithRed: 0 green: 0 blue: 0 alpha: 1];

    //// Bezier Drawing
    UIBezierPath* bezierPath = UIBezierPath.bezierPath;
    [bezierPath moveToPoint: CGPointMake(28.9, 0.15)];
    [bezierPath addCurveToPoint: CGPointMake(53, 20.46) controlPoint1: CGPointMake(40.7, 1.34) controlPoint2: CGPointMake(50.27, 9.58)];
    [bezierPath addLineToPoint: CGPointMake(-1, 20.46)];
    [bezierPath addCurveToPoint: CGPointMake(22.84, 0.17) controlPoint1: CGPointMake(1.74, 9.5) controlPoint2: CGPointMake(11.37, 1.42)];
    [bezierPath addCurveToPoint: CGPointMake(28.9, 0.15) controlPoint1: CGPointMake(24.82, -0.05) controlPoint2: CGPointMake(26.85, -0.06)];
    [bezierPath closePath];
    [black setFill];
    [bezierPath fill];


    //// Bezier 4 Drawing
    UIBezierPath* bezier4Path = UIBezierPath.bezierPath;
    [bezier4Path moveToPoint: CGPointMake(28.69, 2.14)];
    [bezier4Path addCurveToPoint: CGPointMake(51, 20.96) controlPoint1: CGPointMake(39.57, 3.25) controlPoint2: CGPointMake(48.42, 10.87)];
    [bezier4Path addLineToPoint: CGPointMake(1, 20.96)];
    [bezier4Path addCurveToPoint: CGPointMake(24.79, 2.02) controlPoint1: CGPointMake(3.73, 10.25) controlPoint2: CGPointMake(13.46, 2.53)];
    [bezier4Path addCurveToPoint: CGPointMake(28.69, 2.14) controlPoint1: CGPointMake(26.08, 1.97) controlPoint2: CGPointMake(27.38, 2)];
    [bezier4Path closePath];
    [color setFill];
    [bezier4Path fill];


    //// Bezier 2 Drawing
    UIBezierPath* bezier2Path = UIBezierPath.bezierPath;
    [bezier2Path moveToPoint: CGPointMake(19.11, 12.38)];
    [bezier2Path addLineToPoint: CGPointMake(23.26, 14.7)];
    [bezier2Path addCurveToPoint: CGPointMake(26, 16.23) controlPoint1: CGPointMake(24.51, 15.4) controlPoint2: CGPointMake(25.39, 15.89)];
    [bezier2Path addCurveToPoint: CGPointMake(28.74, 14.7) controlPoint1: CGPointMake(27.2, 15.56) controlPoint2: CGPointMake(28.74, 14.7)];
    [bezier2Path addCurveToPoint: CGPointMake(32.89, 12.38) controlPoint1: CGPointMake(32.89, 12.38) controlPoint2: CGPointMake(32.89, 12.38)];
    [bezier2Path addCurveToPoint: CGPointMake(36.68, 12.92) controlPoint1: CGPointMake(34.12, 11.7) controlPoint2: CGPointMake(35.82, 11.93)];
    [bezier2Path addCurveToPoint: CGPointMake(36.01, 15.93) controlPoint1: CGPointMake(37.54, 13.9) controlPoint2: CGPointMake(37.24, 15.25)];
    [bezier2Path addLineToPoint: CGPointMake(31.86, 18.25)];
    [bezier2Path addLineToPoint: CGPointMake(27.78, 20.53)];
    [bezier2Path addCurveToPoint: CGPointMake(26, 20.96) controlPoint1: CGPointMake(27.19, 20.86) controlPoint2: CGPointMake(26.59, 20.98)];
    [bezier2Path addCurveToPoint: CGPointMake(24.29, 20.57) controlPoint1: CGPointMake(25.41, 20.98) controlPoint2: CGPointMake(24.81, 20.86)];
    [bezier2Path addCurveToPoint: CGPointMake(20.2, 18.29) controlPoint1: CGPointMake(24.23, 20.53) controlPoint2: CGPointMake(20.2, 18.29)];
    [bezier2Path addCurveToPoint: CGPointMake(15.99, 15.93) controlPoint1: CGPointMake(15.99, 15.93) controlPoint2: CGPointMake(15.99, 15.93)];
    [bezier2Path addCurveToPoint: CGPointMake(15.32, 12.92) controlPoint1: CGPointMake(14.76, 15.25) controlPoint2: CGPointMake(14.46, 13.9)];
    [bezier2Path addCurveToPoint: CGPointMake(15.99, 12.38) controlPoint1: CGPointMake(15.51, 12.7) controlPoint2: CGPointMake(15.74, 12.52)];
    [bezier2Path addCurveToPoint: CGPointMake(19.11, 12.38) controlPoint1: CGPointMake(16.9, 11.87) controlPoint2: CGPointMake(18.15, 11.85)];
    [bezier2Path closePath];
    [black setFill];
    [bezier2Path fill];
}

+ (void)drawMicdBackgroundWithColor: (UIColor*)color
{
    //// General Declarations
    CGContextRef context = UIGraphicsGetCurrentContext();

    //// Color Declarations
    UIColor* black = [UIColor colorWithRed: 0 green: 0 blue: 0 alpha: 1];

    //// micd title 2 Drawing
    UIBezierPath* micdTitle2Path = UIBezierPath.bezierPath;
    [micdTitle2Path moveToPoint: CGPointMake(166.34, 640.35)];
    [micdTitle2Path addCurveToPoint: CGPointMake(158.2, 649.62) controlPoint1: CGPointMake(166.13, 641.07) controlPoint2: CGPointMake(162.32, 649.31)];
    [micdTitle2Path addCurveToPoint: CGPointMake(157.89, 643.23) controlPoint1: CGPointMake(156.14, 649.82) controlPoint2: CGPointMake(157.07, 647.04)];
    [micdTitle2Path addCurveToPoint: CGPointMake(151.92, 622.63) controlPoint1: CGPointMake(159.75, 634.27) controlPoint2: CGPointMake(160.36, 624.38)];
    [micdTitle2Path addCurveToPoint: CGPointMake(141.72, 628.71) controlPoint1: CGPointMake(148.31, 621.91) controlPoint2: CGPointMake(144.61, 624.18)];
    [micdTitle2Path addCurveToPoint: CGPointMake(135.75, 622.63) controlPoint1: CGPointMake(140.9, 625.62) controlPoint2: CGPointMake(139.15, 623.35)];
    [micdTitle2Path addCurveToPoint: CGPointMake(123.75, 625.49) controlPoint1: CGPointMake(132.39, 621.95) controlPoint2: CGPointMake(126.52, 622.74)];
    [micdTitle2Path addCurveToPoint: CGPointMake(119.78, 628.71) controlPoint1: CGPointMake(121.59, 626.8) controlPoint2: CGPointMake(121.2, 628.79)];
    [micdTitle2Path addCurveToPoint: CGPointMake(109.72, 626.74) controlPoint1: CGPointMake(116.38, 628.52) controlPoint2: CGPointMake(111.54, 626.26)];
    [micdTitle2Path addCurveToPoint: CGPointMake(108.66, 628.98) controlPoint1: CGPointMake(107.9, 627.22) controlPoint2: CGPointMake(108.73, 628)];
    [micdTitle2Path addCurveToPoint: CGPointMake(107.73, 655.69) controlPoint1: CGPointMake(107.87, 640.42) controlPoint2: CGPointMake(107.92, 652.37)];
    [micdTitle2Path addCurveToPoint: CGPointMake(119.78, 656.52) controlPoint1: CGPointMake(107.22, 662.39) controlPoint2: CGPointMake(116.38, 665.07)];
    [micdTitle2Path addCurveToPoint: CGPointMake(125.24, 640.55) controlPoint1: CGPointMake(121.84, 651.26) controlPoint2: CGPointMake(123.59, 645.19)];
    [micdTitle2Path addCurveToPoint: CGPointMake(130.08, 642.51) controlPoint1: CGPointMake(127.82, 632.83) controlPoint2: CGPointMake(131.42, 634.58)];
    [micdTitle2Path addCurveToPoint: CGPointMake(126.89, 656.83) controlPoint1: CGPointMake(129.57, 645.29) controlPoint2: CGPointMake(127.51, 654.25)];
    [micdTitle2Path addCurveToPoint: CGPointMake(137.29, 658.58) controlPoint1: CGPointMake(125.24, 662.8) controlPoint2: CGPointMake(135.85, 663.42)];
    [micdTitle2Path addCurveToPoint: CGPointMake(140.79, 644.36) controlPoint1: CGPointMake(138.12, 655.69) controlPoint2: CGPointMake(140.28, 646.73)];
    [micdTitle2Path addCurveToPoint: CGPointMake(141.41, 640.76) controlPoint1: CGPointMake(141, 643.23) controlPoint2: CGPointMake(141.21, 641.99)];
    [micdTitle2Path addCurveToPoint: CGPointMake(146.25, 642.51) controlPoint1: CGPointMake(143.99, 633.45) controlPoint2: CGPointMake(147.7, 634.27)];
    [micdTitle2Path addCurveToPoint: CGPointMake(149.96, 661.46) controlPoint1: CGPointMake(144.19, 655.49) controlPoint2: CGPointMake(145.33, 659.92)];
    [micdTitle2Path addCurveToPoint: CGPointMake(169.12, 642.41) controlPoint1: CGPointMake(158.3, 663.11) controlPoint2: CGPointMake(167.06, 653.32)];
    [micdTitle2Path addCurveToPoint: CGPointMake(166.34, 640.35) controlPoint1: CGPointMake(170.56, 635.4) controlPoint2: CGPointMake(167.88, 635.81)];
    [micdTitle2Path closePath];
    [micdTitle2Path moveToPoint: CGPointMake(187.66, 640.24)];
    [micdTitle2Path addCurveToPoint: CGPointMake(180.76, 649.93) controlPoint1: CGPointMake(185.81, 645.39) controlPoint2: CGPointMake(183.02, 650.54)];
    [micdTitle2Path addCurveToPoint: CGPointMake(179.63, 644.57) controlPoint1: CGPointMake(179.32, 649.51) controlPoint2: CGPointMake(179.01, 647.97)];
    [micdTitle2Path addCurveToPoint: CGPointMake(181.99, 628.91) controlPoint1: CGPointMake(180.35, 639.93) controlPoint2: CGPointMake(181.38, 634.17)];
    [micdTitle2Path addCurveToPoint: CGPointMake(168.81, 627.06) controlPoint1: CGPointMake(182.51, 625.31) controlPoint2: CGPointMake(170.56, 618.1)];
    [micdTitle2Path addCurveToPoint: CGPointMake(172.52, 661.67) controlPoint1: CGPointMake(165, 650.03) controlPoint2: CGPointMake(163.25, 659.5)];
    [micdTitle2Path addCurveToPoint: CGPointMake(191.16, 642.3) controlPoint1: CGPointMake(181.79, 663.62) controlPoint2: CGPointMake(188.59, 653.12)];
    [micdTitle2Path addCurveToPoint: CGPointMake(187.66, 640.24) controlPoint1: CGPointMake(192.71, 635.3) controlPoint2: CGPointMake(189, 636.43)];
    [micdTitle2Path closePath];
    [micdTitle2Path moveToPoint: CGPointMake(182.61, 625.82)];
    [micdTitle2Path addCurveToPoint: CGPointMake(184.16, 616.55) controlPoint1: CGPointMake(182.92, 623.45) controlPoint2: CGPointMake(183.85, 618.72)];
    [micdTitle2Path addCurveToPoint: CGPointMake(171.28, 614.8) controlPoint1: CGPointMake(184.57, 613.05) controlPoint2: CGPointMake(173.03, 605.84)];
    [micdTitle2Path addCurveToPoint: CGPointMake(169.94, 622.12) controlPoint1: CGPointMake(170.87, 617.38) controlPoint2: CGPointMake(170.36, 619.85)];
    [micdTitle2Path addCurveToPoint: CGPointMake(182.61, 625.82) controlPoint1: CGPointMake(172.93, 617.58) controlPoint2: CGPointMake(181.99, 622.12)];
    [micdTitle2Path closePath];
    [micdTitle2Path moveToPoint: CGPointMake(223.71, 641.07)];
    [micdTitle2Path addCurveToPoint: CGPointMake(205.27, 653.74) controlPoint1: CGPointMake(220, 651.06) controlPoint2: CGPointMake(213.31, 654.87)];
    [micdTitle2Path addCurveToPoint: CGPointMake(205.27, 635.71) controlPoint1: CGPointMake(193.32, 652.19) controlPoint2: CGPointMake(195.69, 634.68)];
    [micdTitle2Path addCurveToPoint: CGPointMake(204.96, 641.69) controlPoint1: CGPointMake(207.44, 636.02) controlPoint2: CGPointMake(207.64, 638.39)];
    [micdTitle2Path addCurveToPoint: CGPointMake(216.5, 640.04) controlPoint1: CGPointMake(202.29, 644.47) controlPoint2: CGPointMake(210.83, 649.72)];
    [micdTitle2Path addCurveToPoint: CGPointMake(207.74, 622.73) controlPoint1: CGPointMake(220.62, 632.83) controlPoint2: CGPointMake(219.59, 623.45)];
    [micdTitle2Path addCurveToPoint: CGPointMake(186.32, 643.33) controlPoint1: CGPointMake(196.52, 621.91) controlPoint2: CGPointMake(186.42, 631.18)];
    [micdTitle2Path addCurveToPoint: CGPointMake(208.26, 661.67) controlPoint1: CGPointMake(186.22, 653.84) controlPoint2: CGPointMake(193.94, 663.32)];
    [micdTitle2Path addCurveToPoint: CGPointMake(227.52, 642.61) controlPoint1: CGPointMake(218.77, 660.53) controlPoint2: CGPointMake(225.36, 651.99)];
    [micdTitle2Path addCurveToPoint: CGPointMake(223.71, 641.07) controlPoint1: CGPointMake(228.96, 636.12) controlPoint2: CGPointMake(225.46, 635.3)];
    [micdTitle2Path closePath];
    [micdTitle2Path moveToPoint: CGPointMake(263.88, 650.75)];
    [micdTitle2Path addCurveToPoint: CGPointMake(262.44, 645.39) controlPoint1: CGPointMake(262.03, 650.44) controlPoint2: CGPointMake(262.23, 648.59)];
    [micdTitle2Path addCurveToPoint: CGPointMake(267.9, 603.16) controlPoint1: CGPointMake(263.16, 637.77) controlPoint2: CGPointMake(267.28, 607.08)];
    [micdTitle2Path addCurveToPoint: CGPointMake(254.51, 602.65) controlPoint1: CGPointMake(269.13, 595.85) controlPoint2: CGPointMake(255.43, 595.13)];
    [micdTitle2Path addCurveToPoint: CGPointMake(251.62, 625.62) controlPoint1: CGPointMake(253.27, 610.89) controlPoint2: CGPointMake(252.65, 615.83)];
    [micdTitle2Path addCurveToPoint: CGPointMake(243.49, 622.94) controlPoint1: CGPointMake(249.36, 624.18) controlPoint2: CGPointMake(246.68, 623.25)];
    [micdTitle2Path addCurveToPoint: CGPointMake(238.85, 661.77) controlPoint1: CGPointMake(216.6, 620.67) controlPoint2: CGPointMake(214.95, 659.61)];
    [micdTitle2Path addCurveToPoint: CGPointMake(251.21, 657.44) controlPoint1: CGPointMake(244.82, 662.29) controlPoint2: CGPointMake(249.15, 660.23)];
    [micdTitle2Path addCurveToPoint: CGPointMake(255.74, 661.46) controlPoint1: CGPointMake(252.14, 659.61) controlPoint2: CGPointMake(253.68, 660.95)];
    [micdTitle2Path addCurveToPoint: CGPointMake(263.88, 650.75) controlPoint1: CGPointMake(264.19, 663.93) controlPoint2: CGPointMake(266.15, 651.06)];
    [micdTitle2Path closePath];
    [micdTitle2Path moveToPoint: CGPointMake(239.37, 653.94)];
    [micdTitle2Path addCurveToPoint: CGPointMake(242.76, 636.02) controlPoint1: CGPointMake(227.01, 652.4) controlPoint2: CGPointMake(229.48, 633.96)];
    [micdTitle2Path addCurveToPoint: CGPointMake(239.37, 653.94) controlPoint1: CGPointMake(253.99, 637.77) controlPoint2: CGPointMake(250.7, 655.28)];
    [micdTitle2Path closePath];
    [color setFill];
    [micdTitle2Path fill];


    //// Oval 2 Drawing
    CGContextSaveGState(context);
    CGContextTranslateCTM(context, 101.71, 624.16);
    CGContextRotateCTM(context, 2.83 * M_PI / 180);

    UIBezierPath* oval2Path = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(7.81, -0.31, 11, 5)];
    [black setFill];
    [oval2Path fill];

    CGContextRestoreGState(context);


    //// Rectangle Drawing
    UIBezierPath* rectanglePath = UIBezierPath.bezierPath;
    [rectanglePath moveToPoint: CGPointMake(168.5, 65.57)];
    [rectanglePath addCurveToPoint: CGPointMake(153.81, 74.31) controlPoint1: CGPointMake(169.4, 70.25) controlPoint2: CGPointMake(155.25, 66.36)];
    [rectanglePath addCurveToPoint: CGPointMake(163.1, 82.59) controlPoint1: CGPointMake(153.21, 77.59) controlPoint2: CGPointMake(164.32, 80.09)];
    [rectanglePath addCurveToPoint: CGPointMake(146.98, 88.4) controlPoint1: CGPointMake(162.21, 84.41) controlPoint2: CGPointMake(148.04, 86.35)];
    [rectanglePath addCurveToPoint: CGPointMake(120.41, 192.84) controlPoint1: CGPointMake(133.53, 114.5) controlPoint2: CGPointMake(121.23, 158.2)];
    [rectanglePath addCurveToPoint: CGPointMake(145.3, 319.07) controlPoint1: CGPointMake(119.69, 223.22) controlPoint2: CGPointMake(145.55, 275.14)];
    [rectanglePath addCurveToPoint: CGPointMake(117.16, 439.96) controlPoint1: CGPointMake(145.03, 366.74) controlPoint2: CGPointMake(124.08, 424.06)];
    [rectanglePath addCurveToPoint: CGPointMake(112.91, 536.75) controlPoint1: CGPointMake(110.19, 455.95) controlPoint2: CGPointMake(100.26, 471.97)];
    [rectanglePath addCurveToPoint: CGPointMake(112.91, 598.24) controlPoint1: CGPointMake(114.58, 553.26) controlPoint2: CGPointMake(112.91, 598.24)];
    [rectanglePath addLineToPoint: CGPointMake(117.95, 598.24)];
    [rectanglePath addCurveToPoint: CGPointMake(117.34, 536.45) controlPoint1: CGPointMake(117.95, 598.24) controlPoint2: CGPointMake(119.1, 560.56)];
    [rectanglePath addCurveToPoint: CGPointMake(123.66, 439.67) controlPoint1: CGPointMake(104.1, 464.17) controlPoint2: CGPointMake(119.35, 450.49)];
    [rectanglePath addCurveToPoint: CGPointMake(151.92, 319.32) controlPoint1: CGPointMake(127.43, 434.84) controlPoint2: CGPointMake(151.6, 364.62)];
    [rectanglePath addCurveToPoint: CGPointMake(126.41, 193.08) controlPoint1: CGPointMake(152.19, 279.54) controlPoint2: CGPointMake(126.96, 228.74)];
    [rectanglePath addCurveToPoint: CGPointMake(148.6, 90.85) controlPoint1: CGPointMake(125.85, 157.43) controlPoint2: CGPointMake(135.67, 117.17)];
    [rectanglePath addCurveToPoint: CGPointMake(165.47, 83.22) controlPoint1: CGPointMake(144.02, 91.02) controlPoint2: CGPointMake(163.86, 86.68)];
    [rectanglePath addCurveToPoint: CGPointMake(156.42, 74.31) controlPoint1: CGPointMake(166.75, 80.47) controlPoint2: CGPointMake(157.89, 77.16)];
    [rectanglePath addCurveToPoint: CGPointMake(172.58, 65.94) controlPoint1: CGPointMake(153.14, 67.94) controlPoint2: CGPointMake(172.3, 70.81)];
    [rectanglePath addCurveToPoint: CGPointMake(176.92, 56.89) controlPoint1: CGPointMake(172.96, 59.36) controlPoint2: CGPointMake(176.92, 56.89)];
    [rectanglePath addLineToPoint: CGPointMake(168.08, 56.89)];
    [rectanglePath addCurveToPoint: CGPointMake(168.5, 65.57) controlPoint1: CGPointMake(168.08, 56.89) controlPoint2: CGPointMake(167.19, 58.72)];
    [rectanglePath closePath];
    [color setFill];
    [rectanglePath fill];


    //// micd title Drawing
    UIBezierPath* micdTitlePath = UIBezierPath.bezierPath;
    [micdTitlePath moveToPoint: CGPointMake(166.43, 46.79)];
    [micdTitlePath addCurveToPoint: CGPointMake(158.29, 56.06) controlPoint1: CGPointMake(166.23, 47.51) controlPoint2: CGPointMake(162.41, 55.75)];
    [micdTitlePath addCurveToPoint: CGPointMake(157.99, 49.67) controlPoint1: CGPointMake(156.23, 56.26) controlPoint2: CGPointMake(157.16, 53.48)];
    [micdTitlePath addCurveToPoint: CGPointMake(152.01, 29.07) controlPoint1: CGPointMake(159.84, 40.71) controlPoint2: CGPointMake(160.46, 30.82)];
    [micdTitlePath addCurveToPoint: CGPointMake(141.81, 35.15) controlPoint1: CGPointMake(148.41, 28.35) controlPoint2: CGPointMake(144.7, 30.62)];
    [micdTitlePath addCurveToPoint: CGPointMake(135.84, 29.07) controlPoint1: CGPointMake(140.99, 32.06) controlPoint2: CGPointMake(139.24, 29.79)];
    [micdTitlePath addCurveToPoint: CGPointMake(121.83, 41.43) controlPoint1: CGPointMake(130.28, 27.94) controlPoint2: CGPointMake(125.13, 32.57)];
    [micdTitlePath addCurveToPoint: CGPointMake(123.38, 33.3) controlPoint1: CGPointMake(122.14, 39.37) controlPoint2: CGPointMake(123.48, 34.74)];
    [micdTitlePath addCurveToPoint: CGPointMake(110.3, 32.27) controlPoint1: CGPointMake(122.66, 29.59) controlPoint2: CGPointMake(110.91, 26.19)];
    [micdTitlePath addCurveToPoint: CGPointMake(107.82, 62.14) controlPoint1: CGPointMake(109.27, 44.52) controlPoint2: CGPointMake(108.03, 58.53)];
    [micdTitlePath addCurveToPoint: CGPointMake(119.88, 62.96) controlPoint1: CGPointMake(107.31, 68.83) controlPoint2: CGPointMake(116.48, 71.51)];
    [micdTitlePath addCurveToPoint: CGPointMake(125.33, 46.99) controlPoint1: CGPointMake(121.94, 57.71) controlPoint2: CGPointMake(123.69, 51.63)];
    [micdTitlePath addCurveToPoint: CGPointMake(130.18, 48.95) controlPoint1: CGPointMake(127.91, 39.27) controlPoint2: CGPointMake(131.51, 41.02)];
    [micdTitlePath addCurveToPoint: CGPointMake(126.98, 63.27) controlPoint1: CGPointMake(129.66, 51.73) controlPoint2: CGPointMake(127.6, 60.69)];
    [micdTitlePath addCurveToPoint: CGPointMake(137.39, 65.02) controlPoint1: CGPointMake(125.33, 69.24) controlPoint2: CGPointMake(135.94, 69.86)];
    [micdTitlePath addCurveToPoint: CGPointMake(140.89, 50.81) controlPoint1: CGPointMake(138.21, 62.14) controlPoint2: CGPointMake(140.37, 53.17)];
    [micdTitlePath addCurveToPoint: CGPointMake(141.51, 47.2) controlPoint1: CGPointMake(141.09, 49.67) controlPoint2: CGPointMake(141.3, 48.44)];
    [micdTitlePath addCurveToPoint: CGPointMake(146.35, 48.95) controlPoint1: CGPointMake(144.08, 39.89) controlPoint2: CGPointMake(147.79, 40.71)];
    [micdTitlePath addCurveToPoint: CGPointMake(150.05, 67.9) controlPoint1: CGPointMake(144.29, 61.93) controlPoint2: CGPointMake(145.42, 66.36)];
    [micdTitlePath addCurveToPoint: CGPointMake(169.21, 48.85) controlPoint1: CGPointMake(158.4, 69.55) controlPoint2: CGPointMake(167.15, 59.77)];
    [micdTitlePath addCurveToPoint: CGPointMake(166.43, 46.79) controlPoint1: CGPointMake(170.65, 41.84) controlPoint2: CGPointMake(167.98, 42.26)];
    [micdTitlePath closePath];
    [micdTitlePath moveToPoint: CGPointMake(187.75, 46.69)];
    [micdTitlePath addCurveToPoint: CGPointMake(180.85, 56.37) controlPoint1: CGPointMake(185.9, 51.84) controlPoint2: CGPointMake(183.12, 56.99)];
    [micdTitlePath addCurveToPoint: CGPointMake(179.72, 51.01) controlPoint1: CGPointMake(179.41, 55.96) controlPoint2: CGPointMake(179.1, 54.41)];
    [micdTitlePath addCurveToPoint: CGPointMake(182.09, 35.36) controlPoint1: CGPointMake(180.44, 46.38) controlPoint2: CGPointMake(181.47, 40.61)];
    [micdTitlePath addCurveToPoint: CGPointMake(168.9, 33.5) controlPoint1: CGPointMake(182.6, 31.75) controlPoint2: CGPointMake(170.65, 24.54)];
    [micdTitlePath addCurveToPoint: CGPointMake(172.61, 68.11) controlPoint1: CGPointMake(165.09, 56.47) controlPoint2: CGPointMake(163.34, 65.95)];
    [micdTitlePath addCurveToPoint: CGPointMake(191.25, 48.75) controlPoint1: CGPointMake(181.88, 70.07) controlPoint2: CGPointMake(188.68, 59.56)];
    [micdTitlePath addCurveToPoint: CGPointMake(187.75, 46.69) controlPoint1: CGPointMake(192.8, 41.74) controlPoint2: CGPointMake(189.09, 42.87)];
    [micdTitlePath closePath];
    [micdTitlePath moveToPoint: CGPointMake(182.71, 32.27)];
    [micdTitlePath addCurveToPoint: CGPointMake(184.25, 23) controlPoint1: CGPointMake(183.01, 29.9) controlPoint2: CGPointMake(183.94, 25.16)];
    [micdTitlePath addCurveToPoint: CGPointMake(171.38, 21.24) controlPoint1: CGPointMake(184.66, 19.49) controlPoint2: CGPointMake(173.13, 12.28)];
    [micdTitlePath addCurveToPoint: CGPointMake(170.04, 28.56) controlPoint1: CGPointMake(170.96, 23.82) controlPoint2: CGPointMake(170.45, 26.29)];
    [micdTitlePath addCurveToPoint: CGPointMake(182.71, 32.27) controlPoint1: CGPointMake(173.02, 24.03) controlPoint2: CGPointMake(182.09, 28.56)];
    [micdTitlePath closePath];
    [micdTitlePath moveToPoint: CGPointMake(223.8, 47.51)];
    [micdTitlePath addCurveToPoint: CGPointMake(205.37, 60.18) controlPoint1: CGPointMake(220.09, 57.5) controlPoint2: CGPointMake(213.4, 61.31)];
    [micdTitlePath addCurveToPoint: CGPointMake(205.37, 42.15) controlPoint1: CGPointMake(193.42, 58.63) controlPoint2: CGPointMake(195.79, 41.12)];
    [micdTitlePath addCurveToPoint: CGPointMake(205.06, 48.13) controlPoint1: CGPointMake(207.53, 42.46) controlPoint2: CGPointMake(207.73, 44.83)];
    [micdTitlePath addCurveToPoint: CGPointMake(216.59, 46.48) controlPoint1: CGPointMake(202.38, 50.91) controlPoint2: CGPointMake(210.93, 56.16)];
    [micdTitlePath addCurveToPoint: CGPointMake(207.84, 29.18) controlPoint1: CGPointMake(220.71, 39.27) controlPoint2: CGPointMake(219.68, 29.9)];
    [micdTitlePath addCurveToPoint: CGPointMake(186.41, 49.78) controlPoint1: CGPointMake(196.61, 28.35) controlPoint2: CGPointMake(186.52, 37.62)];
    [micdTitlePath addCurveToPoint: CGPointMake(208.35, 68.11) controlPoint1: CGPointMake(186.31, 60.28) controlPoint2: CGPointMake(194.04, 69.76)];
    [micdTitlePath addCurveToPoint: CGPointMake(227.61, 49.05) controlPoint1: CGPointMake(218.86, 66.98) controlPoint2: CGPointMake(225.45, 58.43)];
    [micdTitlePath addCurveToPoint: CGPointMake(223.8, 47.51) controlPoint1: CGPointMake(229.06, 42.57) controlPoint2: CGPointMake(225.55, 41.74)];
    [micdTitlePath closePath];
    [micdTitlePath moveToPoint: CGPointMake(263.97, 57.19)];
    [micdTitlePath addCurveToPoint: CGPointMake(262.53, 51.84) controlPoint1: CGPointMake(262.12, 56.88) controlPoint2: CGPointMake(262.32, 55.03)];
    [micdTitlePath addCurveToPoint: CGPointMake(267.99, 9.61) controlPoint1: CGPointMake(263.25, 44.21) controlPoint2: CGPointMake(267.37, 13.52)];
    [micdTitlePath addCurveToPoint: CGPointMake(254.6, 9.09) controlPoint1: CGPointMake(269.23, 2.29) controlPoint2: CGPointMake(255.53, 1.57)];
    [micdTitlePath addCurveToPoint: CGPointMake(251.72, 32.06) controlPoint1: CGPointMake(253.36, 17.33) controlPoint2: CGPointMake(252.75, 22.27)];
    [micdTitlePath addCurveToPoint: CGPointMake(243.58, 29.38) controlPoint1: CGPointMake(249.45, 30.62) controlPoint2: CGPointMake(246.77, 29.69)];
    [micdTitlePath addCurveToPoint: CGPointMake(238.94, 68.21) controlPoint1: CGPointMake(216.7, 27.12) controlPoint2: CGPointMake(215.05, 66.05)];
    [micdTitlePath addCurveToPoint: CGPointMake(251.3, 63.89) controlPoint1: CGPointMake(244.92, 68.73) controlPoint2: CGPointMake(249.24, 66.67)];
    [micdTitlePath addCurveToPoint: CGPointMake(255.84, 67.9) controlPoint1: CGPointMake(252.23, 66.05) controlPoint2: CGPointMake(253.78, 67.39)];
    [micdTitlePath addCurveToPoint: CGPointMake(263.97, 57.19) controlPoint1: CGPointMake(264.28, 70.38) controlPoint2: CGPointMake(266.24, 57.5)];
    [micdTitlePath closePath];
    [micdTitlePath moveToPoint: CGPointMake(239.46, 60.38)];
    [micdTitlePath addCurveToPoint: CGPointMake(242.86, 42.46) controlPoint1: CGPointMake(227.1, 58.84) controlPoint2: CGPointMake(229.57, 40.4)];
    [micdTitlePath addCurveToPoint: CGPointMake(239.46, 60.38) controlPoint1: CGPointMake(254.08, 44.21) controlPoint2: CGPointMake(250.79, 61.72)];
    [micdTitlePath closePath];
    [color setFill];
    [micdTitlePath fill];


    //// Group 2
    {
        //// Bezier Drawing
        CGContextSaveGState(context);
        CGContextTranslateCTM(context, 172.05, 22.31);
        CGContextRotateCTM(context, 10.26 * M_PI / 180);

        UIBezierPath* bezierPath = UIBezierPath.bezierPath;
        [bezierPath moveToPoint: CGPointMake(0.5, -4)];
        [bezierPath addCurveToPoint: CGPointMake(0, -4.5) controlPoint1: CGPointMake(0.5, -4.27) controlPoint2: CGPointMake(0.28, -4.5)];
        [bezierPath addCurveToPoint: CGPointMake(-0.5, -4) controlPoint1: CGPointMake(-0.28, -4.5) controlPoint2: CGPointMake(-0.5, -4.27)];
        [bezierPath addCurveToPoint: CGPointMake(0, -3.5) controlPoint1: CGPointMake(-0.5, -3.72) controlPoint2: CGPointMake(-0.28, -3.5)];
        [bezierPath addCurveToPoint: CGPointMake(0.5, -4) controlPoint1: CGPointMake(0.28, -3.5) controlPoint2: CGPointMake(0.5, -3.72)];
        [bezierPath closePath];
        [bezierPath moveToPoint: CGPointMake(0.5, -2.46)];
        [bezierPath addCurveToPoint: CGPointMake(0, -2.96) controlPoint1: CGPointMake(0.5, -2.74) controlPoint2: CGPointMake(0.28, -2.96)];
        [bezierPath addCurveToPoint: CGPointMake(-0.5, -2.46) controlPoint1: CGPointMake(-0.28, -2.96) controlPoint2: CGPointMake(-0.5, -2.74)];
        [bezierPath addCurveToPoint: CGPointMake(0, -1.96) controlPoint1: CGPointMake(-0.5, -2.18) controlPoint2: CGPointMake(-0.28, -1.96)];
        [bezierPath addCurveToPoint: CGPointMake(0.5, -2.46) controlPoint1: CGPointMake(0.28, -1.96) controlPoint2: CGPointMake(0.5, -2.18)];
        [bezierPath closePath];
        [bezierPath moveToPoint: CGPointMake(0.5, -0.84)];
        [bezierPath addCurveToPoint: CGPointMake(0, -1.34) controlPoint1: CGPointMake(0.5, -1.12) controlPoint2: CGPointMake(0.28, -1.34)];
        [bezierPath addCurveToPoint: CGPointMake(-0.5, -0.84) controlPoint1: CGPointMake(-0.28, -1.34) controlPoint2: CGPointMake(-0.5, -1.12)];
        [bezierPath addCurveToPoint: CGPointMake(0, -0.34) controlPoint1: CGPointMake(-0.5, -0.56) controlPoint2: CGPointMake(-0.28, -0.34)];
        [bezierPath addCurveToPoint: CGPointMake(0.5, -0.84) controlPoint1: CGPointMake(0.28, -0.34) controlPoint2: CGPointMake(0.5, -0.56)];
        [bezierPath closePath];
        [bezierPath moveToPoint: CGPointMake(0.5, 0.7)];
        [bezierPath addCurveToPoint: CGPointMake(0, 0.2) controlPoint1: CGPointMake(0.5, 0.42) controlPoint2: CGPointMake(0.28, 0.2)];
        [bezierPath addCurveToPoint: CGPointMake(-0.5, 0.7) controlPoint1: CGPointMake(-0.28, 0.2) controlPoint2: CGPointMake(-0.5, 0.42)];
        [bezierPath addCurveToPoint: CGPointMake(0, 1.2) controlPoint1: CGPointMake(-0.5, 0.98) controlPoint2: CGPointMake(-0.28, 1.2)];
        [bezierPath addCurveToPoint: CGPointMake(0.5, 0.7) controlPoint1: CGPointMake(0.28, 1.2) controlPoint2: CGPointMake(0.5, 0.98)];
        [bezierPath closePath];
        [bezierPath moveToPoint: CGPointMake(0.5, 2.38)];
        [bezierPath addCurveToPoint: CGPointMake(0, 1.88) controlPoint1: CGPointMake(0.5, 2.1) controlPoint2: CGPointMake(0.28, 1.88)];
        [bezierPath addCurveToPoint: CGPointMake(-0.5, 2.38) controlPoint1: CGPointMake(-0.28, 1.88) controlPoint2: CGPointMake(-0.5, 2.1)];
        [bezierPath addCurveToPoint: CGPointMake(0, 2.88) controlPoint1: CGPointMake(-0.5, 2.65) controlPoint2: CGPointMake(-0.28, 2.88)];
        [bezierPath addCurveToPoint: CGPointMake(0.5, 2.38) controlPoint1: CGPointMake(0.28, 2.88) controlPoint2: CGPointMake(0.5, 2.65)];
        [bezierPath closePath];
        [bezierPath moveToPoint: CGPointMake(0.5, 4)];
        [bezierPath addCurveToPoint: CGPointMake(0, 3.5) controlPoint1: CGPointMake(0.5, 3.72) controlPoint2: CGPointMake(0.28, 3.5)];
        [bezierPath addCurveToPoint: CGPointMake(-0.5, 4) controlPoint1: CGPointMake(-0.28, 3.5) controlPoint2: CGPointMake(-0.5, 3.72)];
        [bezierPath addCurveToPoint: CGPointMake(0, 4.5) controlPoint1: CGPointMake(-0.5, 4.27) controlPoint2: CGPointMake(-0.28, 4.5)];
        [bezierPath addCurveToPoint: CGPointMake(0.5, 4) controlPoint1: CGPointMake(0.28, 4.5) controlPoint2: CGPointMake(0.5, 4.27)];
        [bezierPath closePath];
        [black setFill];
        [bezierPath fill];

        CGContextRestoreGState(context);


        //// Bezier 2 Drawing
        CGContextSaveGState(context);
        CGContextTranslateCTM(context, 173.84, 21.76);
        CGContextRotateCTM(context, 10.26 * M_PI / 180);

        UIBezierPath* bezier2Path = UIBezierPath.bezierPath;
        [bezier2Path moveToPoint: CGPointMake(0.5, -4)];
        [bezier2Path addCurveToPoint: CGPointMake(0, -4.5) controlPoint1: CGPointMake(0.5, -4.27) controlPoint2: CGPointMake(0.28, -4.5)];
        [bezier2Path addCurveToPoint: CGPointMake(-0.5, -4) controlPoint1: CGPointMake(-0.28, -4.5) controlPoint2: CGPointMake(-0.5, -4.27)];
        [bezier2Path addCurveToPoint: CGPointMake(0, -3.5) controlPoint1: CGPointMake(-0.5, -3.72) controlPoint2: CGPointMake(-0.28, -3.5)];
        [bezier2Path addCurveToPoint: CGPointMake(0.5, -4) controlPoint1: CGPointMake(0.28, -3.5) controlPoint2: CGPointMake(0.5, -3.72)];
        [bezier2Path closePath];
        [bezier2Path moveToPoint: CGPointMake(0.5, -2.46)];
        [bezier2Path addCurveToPoint: CGPointMake(0, -2.96) controlPoint1: CGPointMake(0.5, -2.74) controlPoint2: CGPointMake(0.28, -2.96)];
        [bezier2Path addCurveToPoint: CGPointMake(-0.5, -2.46) controlPoint1: CGPointMake(-0.28, -2.96) controlPoint2: CGPointMake(-0.5, -2.74)];
        [bezier2Path addCurveToPoint: CGPointMake(0, -1.96) controlPoint1: CGPointMake(-0.5, -2.18) controlPoint2: CGPointMake(-0.28, -1.96)];
        [bezier2Path addCurveToPoint: CGPointMake(0.5, -2.46) controlPoint1: CGPointMake(0.28, -1.96) controlPoint2: CGPointMake(0.5, -2.18)];
        [bezier2Path closePath];
        [bezier2Path moveToPoint: CGPointMake(0.5, -0.84)];
        [bezier2Path addCurveToPoint: CGPointMake(0, -1.34) controlPoint1: CGPointMake(0.5, -1.12) controlPoint2: CGPointMake(0.28, -1.34)];
        [bezier2Path addCurveToPoint: CGPointMake(-0.5, -0.84) controlPoint1: CGPointMake(-0.28, -1.34) controlPoint2: CGPointMake(-0.5, -1.12)];
        [bezier2Path addCurveToPoint: CGPointMake(0, -0.34) controlPoint1: CGPointMake(-0.5, -0.56) controlPoint2: CGPointMake(-0.28, -0.34)];
        [bezier2Path addCurveToPoint: CGPointMake(0.5, -0.84) controlPoint1: CGPointMake(0.28, -0.34) controlPoint2: CGPointMake(0.5, -0.56)];
        [bezier2Path closePath];
        [bezier2Path moveToPoint: CGPointMake(0.5, 0.7)];
        [bezier2Path addCurveToPoint: CGPointMake(0, 0.2) controlPoint1: CGPointMake(0.5, 0.42) controlPoint2: CGPointMake(0.28, 0.2)];
        [bezier2Path addCurveToPoint: CGPointMake(-0.5, 0.7) controlPoint1: CGPointMake(-0.28, 0.2) controlPoint2: CGPointMake(-0.5, 0.42)];
        [bezier2Path addCurveToPoint: CGPointMake(0, 1.2) controlPoint1: CGPointMake(-0.5, 0.98) controlPoint2: CGPointMake(-0.28, 1.2)];
        [bezier2Path addCurveToPoint: CGPointMake(0.5, 0.7) controlPoint1: CGPointMake(0.28, 1.2) controlPoint2: CGPointMake(0.5, 0.98)];
        [bezier2Path closePath];
        [bezier2Path moveToPoint: CGPointMake(0.5, 2.38)];
        [bezier2Path addCurveToPoint: CGPointMake(0, 1.88) controlPoint1: CGPointMake(0.5, 2.1) controlPoint2: CGPointMake(0.28, 1.88)];
        [bezier2Path addCurveToPoint: CGPointMake(-0.5, 2.38) controlPoint1: CGPointMake(-0.28, 1.88) controlPoint2: CGPointMake(-0.5, 2.1)];
        [bezier2Path addCurveToPoint: CGPointMake(0, 2.88) controlPoint1: CGPointMake(-0.5, 2.65) controlPoint2: CGPointMake(-0.28, 2.88)];
        [bezier2Path addCurveToPoint: CGPointMake(0.5, 2.38) controlPoint1: CGPointMake(0.28, 2.88) controlPoint2: CGPointMake(0.5, 2.65)];
        [bezier2Path closePath];
        [bezier2Path moveToPoint: CGPointMake(0.5, 4)];
        [bezier2Path addCurveToPoint: CGPointMake(0, 3.5) controlPoint1: CGPointMake(0.5, 3.72) controlPoint2: CGPointMake(0.28, 3.5)];
        [bezier2Path addCurveToPoint: CGPointMake(-0.5, 4) controlPoint1: CGPointMake(-0.28, 3.5) controlPoint2: CGPointMake(-0.5, 3.72)];
        [bezier2Path addCurveToPoint: CGPointMake(0, 4.5) controlPoint1: CGPointMake(-0.5, 4.27) controlPoint2: CGPointMake(-0.28, 4.5)];
        [bezier2Path addCurveToPoint: CGPointMake(0.5, 4) controlPoint1: CGPointMake(0.28, 4.5) controlPoint2: CGPointMake(0.5, 4.27)];
        [bezier2Path closePath];
        [black setFill];
        [bezier2Path fill];

        CGContextRestoreGState(context);


        //// Bezier 3 Drawing
        CGContextSaveGState(context);
        CGContextTranslateCTM(context, 175.63, 21.66);
        CGContextRotateCTM(context, 10.26 * M_PI / 180);

        UIBezierPath* bezier3Path = UIBezierPath.bezierPath;
        [bezier3Path moveToPoint: CGPointMake(0.5, -4)];
        [bezier3Path addCurveToPoint: CGPointMake(0, -4.5) controlPoint1: CGPointMake(0.5, -4.27) controlPoint2: CGPointMake(0.28, -4.5)];
        [bezier3Path addCurveToPoint: CGPointMake(-0.5, -4) controlPoint1: CGPointMake(-0.28, -4.5) controlPoint2: CGPointMake(-0.5, -4.27)];
        [bezier3Path addCurveToPoint: CGPointMake(0, -3.5) controlPoint1: CGPointMake(-0.5, -3.72) controlPoint2: CGPointMake(-0.28, -3.5)];
        [bezier3Path addCurveToPoint: CGPointMake(0.5, -4) controlPoint1: CGPointMake(0.28, -3.5) controlPoint2: CGPointMake(0.5, -3.72)];
        [bezier3Path closePath];
        [bezier3Path moveToPoint: CGPointMake(0.5, -2.46)];
        [bezier3Path addCurveToPoint: CGPointMake(0, -2.96) controlPoint1: CGPointMake(0.5, -2.74) controlPoint2: CGPointMake(0.28, -2.96)];
        [bezier3Path addCurveToPoint: CGPointMake(-0.5, -2.46) controlPoint1: CGPointMake(-0.28, -2.96) controlPoint2: CGPointMake(-0.5, -2.74)];
        [bezier3Path addCurveToPoint: CGPointMake(0, -1.96) controlPoint1: CGPointMake(-0.5, -2.18) controlPoint2: CGPointMake(-0.28, -1.96)];
        [bezier3Path addCurveToPoint: CGPointMake(0.5, -2.46) controlPoint1: CGPointMake(0.28, -1.96) controlPoint2: CGPointMake(0.5, -2.18)];
        [bezier3Path closePath];
        [bezier3Path moveToPoint: CGPointMake(0.5, -0.84)];
        [bezier3Path addCurveToPoint: CGPointMake(0, -1.34) controlPoint1: CGPointMake(0.5, -1.12) controlPoint2: CGPointMake(0.28, -1.34)];
        [bezier3Path addCurveToPoint: CGPointMake(-0.5, -0.84) controlPoint1: CGPointMake(-0.28, -1.34) controlPoint2: CGPointMake(-0.5, -1.12)];
        [bezier3Path addCurveToPoint: CGPointMake(0, -0.34) controlPoint1: CGPointMake(-0.5, -0.56) controlPoint2: CGPointMake(-0.28, -0.34)];
        [bezier3Path addCurveToPoint: CGPointMake(0.5, -0.84) controlPoint1: CGPointMake(0.28, -0.34) controlPoint2: CGPointMake(0.5, -0.56)];
        [bezier3Path closePath];
        [bezier3Path moveToPoint: CGPointMake(0.5, 0.7)];
        [bezier3Path addCurveToPoint: CGPointMake(0, 0.2) controlPoint1: CGPointMake(0.5, 0.42) controlPoint2: CGPointMake(0.28, 0.2)];
        [bezier3Path addCurveToPoint: CGPointMake(-0.5, 0.7) controlPoint1: CGPointMake(-0.28, 0.2) controlPoint2: CGPointMake(-0.5, 0.42)];
        [bezier3Path addCurveToPoint: CGPointMake(0, 1.2) controlPoint1: CGPointMake(-0.5, 0.98) controlPoint2: CGPointMake(-0.28, 1.2)];
        [bezier3Path addCurveToPoint: CGPointMake(0.5, 0.7) controlPoint1: CGPointMake(0.28, 1.2) controlPoint2: CGPointMake(0.5, 0.98)];
        [bezier3Path closePath];
        [bezier3Path moveToPoint: CGPointMake(0.5, 2.38)];
        [bezier3Path addCurveToPoint: CGPointMake(0, 1.88) controlPoint1: CGPointMake(0.5, 2.1) controlPoint2: CGPointMake(0.28, 1.88)];
        [bezier3Path addCurveToPoint: CGPointMake(-0.5, 2.38) controlPoint1: CGPointMake(-0.28, 1.88) controlPoint2: CGPointMake(-0.5, 2.1)];
        [bezier3Path addCurveToPoint: CGPointMake(0, 2.88) controlPoint1: CGPointMake(-0.5, 2.65) controlPoint2: CGPointMake(-0.28, 2.88)];
        [bezier3Path addCurveToPoint: CGPointMake(0.5, 2.38) controlPoint1: CGPointMake(0.28, 2.88) controlPoint2: CGPointMake(0.5, 2.65)];
        [bezier3Path closePath];
        [bezier3Path moveToPoint: CGPointMake(0.5, 4)];
        [bezier3Path addCurveToPoint: CGPointMake(0, 3.5) controlPoint1: CGPointMake(0.5, 3.72) controlPoint2: CGPointMake(0.28, 3.5)];
        [bezier3Path addCurveToPoint: CGPointMake(-0.5, 4) controlPoint1: CGPointMake(-0.28, 3.5) controlPoint2: CGPointMake(-0.5, 3.72)];
        [bezier3Path addCurveToPoint: CGPointMake(0, 4.5) controlPoint1: CGPointMake(-0.5, 4.27) controlPoint2: CGPointMake(-0.28, 4.5)];
        [bezier3Path addCurveToPoint: CGPointMake(0.5, 4) controlPoint1: CGPointMake(0.28, 4.5) controlPoint2: CGPointMake(0.5, 4.27)];
        [bezier3Path closePath];
        [black setFill];
        [bezier3Path fill];

        CGContextRestoreGState(context);


        //// Bezier 4 Drawing
        CGContextSaveGState(context);
        CGContextTranslateCTM(context, 177.45, 22.15);
        CGContextRotateCTM(context, 10.26 * M_PI / 180);

        UIBezierPath* bezier4Path = UIBezierPath.bezierPath;
        [bezier4Path moveToPoint: CGPointMake(0.5, -4)];
        [bezier4Path addCurveToPoint: CGPointMake(0, -4.5) controlPoint1: CGPointMake(0.5, -4.27) controlPoint2: CGPointMake(0.28, -4.5)];
        [bezier4Path addCurveToPoint: CGPointMake(-0.5, -4) controlPoint1: CGPointMake(-0.28, -4.5) controlPoint2: CGPointMake(-0.5, -4.27)];
        [bezier4Path addCurveToPoint: CGPointMake(0, -3.5) controlPoint1: CGPointMake(-0.5, -3.72) controlPoint2: CGPointMake(-0.28, -3.5)];
        [bezier4Path addCurveToPoint: CGPointMake(0.5, -4) controlPoint1: CGPointMake(0.28, -3.5) controlPoint2: CGPointMake(0.5, -3.72)];
        [bezier4Path closePath];
        [bezier4Path moveToPoint: CGPointMake(0.5, -2.46)];
        [bezier4Path addCurveToPoint: CGPointMake(0, -2.96) controlPoint1: CGPointMake(0.5, -2.74) controlPoint2: CGPointMake(0.28, -2.96)];
        [bezier4Path addCurveToPoint: CGPointMake(-0.5, -2.46) controlPoint1: CGPointMake(-0.28, -2.96) controlPoint2: CGPointMake(-0.5, -2.74)];
        [bezier4Path addCurveToPoint: CGPointMake(0, -1.96) controlPoint1: CGPointMake(-0.5, -2.18) controlPoint2: CGPointMake(-0.28, -1.96)];
        [bezier4Path addCurveToPoint: CGPointMake(0.5, -2.46) controlPoint1: CGPointMake(0.28, -1.96) controlPoint2: CGPointMake(0.5, -2.18)];
        [bezier4Path closePath];
        [bezier4Path moveToPoint: CGPointMake(0.5, -0.84)];
        [bezier4Path addCurveToPoint: CGPointMake(0, -1.34) controlPoint1: CGPointMake(0.5, -1.12) controlPoint2: CGPointMake(0.28, -1.34)];
        [bezier4Path addCurveToPoint: CGPointMake(-0.5, -0.84) controlPoint1: CGPointMake(-0.28, -1.34) controlPoint2: CGPointMake(-0.5, -1.12)];
        [bezier4Path addCurveToPoint: CGPointMake(0, -0.34) controlPoint1: CGPointMake(-0.5, -0.56) controlPoint2: CGPointMake(-0.28, -0.34)];
        [bezier4Path addCurveToPoint: CGPointMake(0.5, -0.84) controlPoint1: CGPointMake(0.28, -0.34) controlPoint2: CGPointMake(0.5, -0.56)];
        [bezier4Path closePath];
        [bezier4Path moveToPoint: CGPointMake(0.5, 0.7)];
        [bezier4Path addCurveToPoint: CGPointMake(0, 0.2) controlPoint1: CGPointMake(0.5, 0.42) controlPoint2: CGPointMake(0.28, 0.2)];
        [bezier4Path addCurveToPoint: CGPointMake(-0.5, 0.7) controlPoint1: CGPointMake(-0.28, 0.2) controlPoint2: CGPointMake(-0.5, 0.42)];
        [bezier4Path addCurveToPoint: CGPointMake(0, 1.2) controlPoint1: CGPointMake(-0.5, 0.98) controlPoint2: CGPointMake(-0.28, 1.2)];
        [bezier4Path addCurveToPoint: CGPointMake(0.5, 0.7) controlPoint1: CGPointMake(0.28, 1.2) controlPoint2: CGPointMake(0.5, 0.98)];
        [bezier4Path closePath];
        [bezier4Path moveToPoint: CGPointMake(0.5, 2.38)];
        [bezier4Path addCurveToPoint: CGPointMake(0, 1.88) controlPoint1: CGPointMake(0.5, 2.1) controlPoint2: CGPointMake(0.28, 1.88)];
        [bezier4Path addCurveToPoint: CGPointMake(-0.5, 2.38) controlPoint1: CGPointMake(-0.28, 1.88) controlPoint2: CGPointMake(-0.5, 2.1)];
        [bezier4Path addCurveToPoint: CGPointMake(0, 2.88) controlPoint1: CGPointMake(-0.5, 2.65) controlPoint2: CGPointMake(-0.28, 2.88)];
        [bezier4Path addCurveToPoint: CGPointMake(0.5, 2.38) controlPoint1: CGPointMake(0.28, 2.88) controlPoint2: CGPointMake(0.5, 2.65)];
        [bezier4Path closePath];
        [bezier4Path moveToPoint: CGPointMake(0.5, 4)];
        [bezier4Path addCurveToPoint: CGPointMake(0, 3.5) controlPoint1: CGPointMake(0.5, 3.72) controlPoint2: CGPointMake(0.28, 3.5)];
        [bezier4Path addCurveToPoint: CGPointMake(-0.5, 4) controlPoint1: CGPointMake(-0.28, 3.5) controlPoint2: CGPointMake(-0.5, 3.72)];
        [bezier4Path addCurveToPoint: CGPointMake(0, 4.5) controlPoint1: CGPointMake(-0.5, 4.27) controlPoint2: CGPointMake(-0.28, 4.5)];
        [bezier4Path addCurveToPoint: CGPointMake(0.5, 4) controlPoint1: CGPointMake(0.28, 4.5) controlPoint2: CGPointMake(0.5, 4.27)];
        [bezier4Path closePath];
        [black setFill];
        [bezier4Path fill];

        CGContextRestoreGState(context);


        //// Bezier 5 Drawing
        CGContextSaveGState(context);
        CGContextTranslateCTM(context, 179.34, 23);
        CGContextRotateCTM(context, 10.26 * M_PI / 180);

        UIBezierPath* bezier5Path = UIBezierPath.bezierPath;
        [bezier5Path moveToPoint: CGPointMake(0.5, -4)];
        [bezier5Path addCurveToPoint: CGPointMake(0, -4.5) controlPoint1: CGPointMake(0.5, -4.27) controlPoint2: CGPointMake(0.28, -4.5)];
        [bezier5Path addCurveToPoint: CGPointMake(-0.5, -4) controlPoint1: CGPointMake(-0.28, -4.5) controlPoint2: CGPointMake(-0.5, -4.27)];
        [bezier5Path addCurveToPoint: CGPointMake(0, -3.5) controlPoint1: CGPointMake(-0.5, -3.72) controlPoint2: CGPointMake(-0.28, -3.5)];
        [bezier5Path addCurveToPoint: CGPointMake(0.5, -4) controlPoint1: CGPointMake(0.28, -3.5) controlPoint2: CGPointMake(0.5, -3.72)];
        [bezier5Path closePath];
        [bezier5Path moveToPoint: CGPointMake(0.5, -2.46)];
        [bezier5Path addCurveToPoint: CGPointMake(0, -2.96) controlPoint1: CGPointMake(0.5, -2.74) controlPoint2: CGPointMake(0.28, -2.96)];
        [bezier5Path addCurveToPoint: CGPointMake(-0.5, -2.46) controlPoint1: CGPointMake(-0.28, -2.96) controlPoint2: CGPointMake(-0.5, -2.74)];
        [bezier5Path addCurveToPoint: CGPointMake(0, -1.96) controlPoint1: CGPointMake(-0.5, -2.18) controlPoint2: CGPointMake(-0.28, -1.96)];
        [bezier5Path addCurveToPoint: CGPointMake(0.5, -2.46) controlPoint1: CGPointMake(0.28, -1.96) controlPoint2: CGPointMake(0.5, -2.18)];
        [bezier5Path closePath];
        [bezier5Path moveToPoint: CGPointMake(0.5, -0.84)];
        [bezier5Path addCurveToPoint: CGPointMake(0, -1.34) controlPoint1: CGPointMake(0.5, -1.12) controlPoint2: CGPointMake(0.28, -1.34)];
        [bezier5Path addCurveToPoint: CGPointMake(-0.5, -0.84) controlPoint1: CGPointMake(-0.28, -1.34) controlPoint2: CGPointMake(-0.5, -1.12)];
        [bezier5Path addCurveToPoint: CGPointMake(0, -0.34) controlPoint1: CGPointMake(-0.5, -0.56) controlPoint2: CGPointMake(-0.28, -0.34)];
        [bezier5Path addCurveToPoint: CGPointMake(0.5, -0.84) controlPoint1: CGPointMake(0.28, -0.34) controlPoint2: CGPointMake(0.5, -0.56)];
        [bezier5Path closePath];
        [bezier5Path moveToPoint: CGPointMake(0.5, 0.7)];
        [bezier5Path addCurveToPoint: CGPointMake(0, 0.2) controlPoint1: CGPointMake(0.5, 0.42) controlPoint2: CGPointMake(0.28, 0.2)];
        [bezier5Path addCurveToPoint: CGPointMake(-0.5, 0.7) controlPoint1: CGPointMake(-0.28, 0.2) controlPoint2: CGPointMake(-0.5, 0.42)];
        [bezier5Path addCurveToPoint: CGPointMake(0, 1.2) controlPoint1: CGPointMake(-0.5, 0.98) controlPoint2: CGPointMake(-0.28, 1.2)];
        [bezier5Path addCurveToPoint: CGPointMake(0.5, 0.7) controlPoint1: CGPointMake(0.28, 1.2) controlPoint2: CGPointMake(0.5, 0.98)];
        [bezier5Path closePath];
        [bezier5Path moveToPoint: CGPointMake(0.5, 2.38)];
        [bezier5Path addCurveToPoint: CGPointMake(0, 1.88) controlPoint1: CGPointMake(0.5, 2.1) controlPoint2: CGPointMake(0.28, 1.88)];
        [bezier5Path addCurveToPoint: CGPointMake(-0.5, 2.38) controlPoint1: CGPointMake(-0.28, 1.88) controlPoint2: CGPointMake(-0.5, 2.1)];
        [bezier5Path addCurveToPoint: CGPointMake(0, 2.88) controlPoint1: CGPointMake(-0.5, 2.65) controlPoint2: CGPointMake(-0.28, 2.88)];
        [bezier5Path addCurveToPoint: CGPointMake(0.5, 2.38) controlPoint1: CGPointMake(0.28, 2.88) controlPoint2: CGPointMake(0.5, 2.65)];
        [bezier5Path closePath];
        [bezier5Path moveToPoint: CGPointMake(0.5, 4)];
        [bezier5Path addCurveToPoint: CGPointMake(0, 3.5) controlPoint1: CGPointMake(0.5, 3.72) controlPoint2: CGPointMake(0.28, 3.5)];
        [bezier5Path addCurveToPoint: CGPointMake(-0.5, 4) controlPoint1: CGPointMake(-0.28, 3.5) controlPoint2: CGPointMake(-0.5, 3.72)];
        [bezier5Path addCurveToPoint: CGPointMake(0, 4.5) controlPoint1: CGPointMake(-0.5, 4.27) controlPoint2: CGPointMake(-0.28, 4.5)];
        [bezier5Path addCurveToPoint: CGPointMake(0.5, 4) controlPoint1: CGPointMake(0.28, 4.5) controlPoint2: CGPointMake(0.5, 4.27)];
        [bezier5Path closePath];
        [black setFill];
        [bezier5Path fill];

        CGContextRestoreGState(context);


        //// Bezier 6 Drawing
        CGContextSaveGState(context);
        CGContextTranslateCTM(context, 181.1, 24.22);
        CGContextRotateCTM(context, 10.26 * M_PI / 180);

        UIBezierPath* bezier6Path = UIBezierPath.bezierPath;
        [bezier6Path moveToPoint: CGPointMake(0.5, -4)];
        [bezier6Path addCurveToPoint: CGPointMake(0, -4.5) controlPoint1: CGPointMake(0.5, -4.27) controlPoint2: CGPointMake(0.28, -4.5)];
        [bezier6Path addCurveToPoint: CGPointMake(-0.5, -4) controlPoint1: CGPointMake(-0.28, -4.5) controlPoint2: CGPointMake(-0.5, -4.27)];
        [bezier6Path addCurveToPoint: CGPointMake(0, -3.5) controlPoint1: CGPointMake(-0.5, -3.72) controlPoint2: CGPointMake(-0.28, -3.5)];
        [bezier6Path addCurveToPoint: CGPointMake(0.5, -4) controlPoint1: CGPointMake(0.28, -3.5) controlPoint2: CGPointMake(0.5, -3.72)];
        [bezier6Path closePath];
        [bezier6Path moveToPoint: CGPointMake(0.5, -2.46)];
        [bezier6Path addCurveToPoint: CGPointMake(0, -2.96) controlPoint1: CGPointMake(0.5, -2.74) controlPoint2: CGPointMake(0.28, -2.96)];
        [bezier6Path addCurveToPoint: CGPointMake(-0.5, -2.46) controlPoint1: CGPointMake(-0.28, -2.96) controlPoint2: CGPointMake(-0.5, -2.74)];
        [bezier6Path addCurveToPoint: CGPointMake(0, -1.96) controlPoint1: CGPointMake(-0.5, -2.18) controlPoint2: CGPointMake(-0.28, -1.96)];
        [bezier6Path addCurveToPoint: CGPointMake(0.5, -2.46) controlPoint1: CGPointMake(0.28, -1.96) controlPoint2: CGPointMake(0.5, -2.18)];
        [bezier6Path closePath];
        [bezier6Path moveToPoint: CGPointMake(0.5, -0.84)];
        [bezier6Path addCurveToPoint: CGPointMake(0, -1.34) controlPoint1: CGPointMake(0.5, -1.12) controlPoint2: CGPointMake(0.28, -1.34)];
        [bezier6Path addCurveToPoint: CGPointMake(-0.5, -0.84) controlPoint1: CGPointMake(-0.28, -1.34) controlPoint2: CGPointMake(-0.5, -1.12)];
        [bezier6Path addCurveToPoint: CGPointMake(0, -0.34) controlPoint1: CGPointMake(-0.5, -0.56) controlPoint2: CGPointMake(-0.28, -0.34)];
        [bezier6Path addCurveToPoint: CGPointMake(0.5, -0.84) controlPoint1: CGPointMake(0.28, -0.34) controlPoint2: CGPointMake(0.5, -0.56)];
        [bezier6Path closePath];
        [bezier6Path moveToPoint: CGPointMake(0.5, 0.7)];
        [bezier6Path addCurveToPoint: CGPointMake(0, 0.2) controlPoint1: CGPointMake(0.5, 0.42) controlPoint2: CGPointMake(0.28, 0.2)];
        [bezier6Path addCurveToPoint: CGPointMake(-0.5, 0.7) controlPoint1: CGPointMake(-0.28, 0.2) controlPoint2: CGPointMake(-0.5, 0.42)];
        [bezier6Path addCurveToPoint: CGPointMake(0, 1.2) controlPoint1: CGPointMake(-0.5, 0.98) controlPoint2: CGPointMake(-0.28, 1.2)];
        [bezier6Path addCurveToPoint: CGPointMake(0.5, 0.7) controlPoint1: CGPointMake(0.28, 1.2) controlPoint2: CGPointMake(0.5, 0.98)];
        [bezier6Path closePath];
        [bezier6Path moveToPoint: CGPointMake(0.5, 2.38)];
        [bezier6Path addCurveToPoint: CGPointMake(0, 1.88) controlPoint1: CGPointMake(0.5, 2.1) controlPoint2: CGPointMake(0.28, 1.88)];
        [bezier6Path addCurveToPoint: CGPointMake(-0.5, 2.38) controlPoint1: CGPointMake(-0.28, 1.88) controlPoint2: CGPointMake(-0.5, 2.1)];
        [bezier6Path addCurveToPoint: CGPointMake(0, 2.88) controlPoint1: CGPointMake(-0.5, 2.65) controlPoint2: CGPointMake(-0.28, 2.88)];
        [bezier6Path addCurveToPoint: CGPointMake(0.5, 2.38) controlPoint1: CGPointMake(0.28, 2.88) controlPoint2: CGPointMake(0.5, 2.65)];
        [bezier6Path closePath];
        [bezier6Path moveToPoint: CGPointMake(0.5, 4)];
        [bezier6Path addCurveToPoint: CGPointMake(0, 3.5) controlPoint1: CGPointMake(0.5, 3.72) controlPoint2: CGPointMake(0.28, 3.5)];
        [bezier6Path addCurveToPoint: CGPointMake(-0.5, 4) controlPoint1: CGPointMake(-0.28, 3.5) controlPoint2: CGPointMake(-0.5, 3.72)];
        [bezier6Path addCurveToPoint: CGPointMake(0, 4.5) controlPoint1: CGPointMake(-0.5, 4.27) controlPoint2: CGPointMake(-0.28, 4.5)];
        [bezier6Path addCurveToPoint: CGPointMake(0.5, 4) controlPoint1: CGPointMake(0.28, 4.5) controlPoint2: CGPointMake(0.5, 4.27)];
        [bezier6Path closePath];
        [black setFill];
        [bezier6Path fill];

        CGContextRestoreGState(context);


        //// Bezier 7 Drawing
        CGContextSaveGState(context);
        CGContextTranslateCTM(context, 182.73, 25.93);
        CGContextRotateCTM(context, 10.26 * M_PI / 180);

        UIBezierPath* bezier7Path = UIBezierPath.bezierPath;
        [bezier7Path moveToPoint: CGPointMake(0.5, -4)];
        [bezier7Path addCurveToPoint: CGPointMake(0, -4.5) controlPoint1: CGPointMake(0.5, -4.27) controlPoint2: CGPointMake(0.28, -4.5)];
        [bezier7Path addCurveToPoint: CGPointMake(-0.5, -4) controlPoint1: CGPointMake(-0.28, -4.5) controlPoint2: CGPointMake(-0.5, -4.27)];
        [bezier7Path addCurveToPoint: CGPointMake(0, -3.5) controlPoint1: CGPointMake(-0.5, -3.72) controlPoint2: CGPointMake(-0.28, -3.5)];
        [bezier7Path addCurveToPoint: CGPointMake(0.5, -4) controlPoint1: CGPointMake(0.28, -3.5) controlPoint2: CGPointMake(0.5, -3.72)];
        [bezier7Path closePath];
        [bezier7Path moveToPoint: CGPointMake(0.5, -2.46)];
        [bezier7Path addCurveToPoint: CGPointMake(0, -2.96) controlPoint1: CGPointMake(0.5, -2.74) controlPoint2: CGPointMake(0.28, -2.96)];
        [bezier7Path addCurveToPoint: CGPointMake(-0.5, -2.46) controlPoint1: CGPointMake(-0.28, -2.96) controlPoint2: CGPointMake(-0.5, -2.74)];
        [bezier7Path addCurveToPoint: CGPointMake(0, -1.96) controlPoint1: CGPointMake(-0.5, -2.18) controlPoint2: CGPointMake(-0.28, -1.96)];
        [bezier7Path addCurveToPoint: CGPointMake(0.5, -2.46) controlPoint1: CGPointMake(0.28, -1.96) controlPoint2: CGPointMake(0.5, -2.18)];
        [bezier7Path closePath];
        [bezier7Path moveToPoint: CGPointMake(0.5, -0.84)];
        [bezier7Path addCurveToPoint: CGPointMake(0, -1.34) controlPoint1: CGPointMake(0.5, -1.12) controlPoint2: CGPointMake(0.28, -1.34)];
        [bezier7Path addCurveToPoint: CGPointMake(-0.5, -0.84) controlPoint1: CGPointMake(-0.28, -1.34) controlPoint2: CGPointMake(-0.5, -1.12)];
        [bezier7Path addCurveToPoint: CGPointMake(0, -0.34) controlPoint1: CGPointMake(-0.5, -0.56) controlPoint2: CGPointMake(-0.28, -0.34)];
        [bezier7Path addCurveToPoint: CGPointMake(0.5, -0.84) controlPoint1: CGPointMake(0.28, -0.34) controlPoint2: CGPointMake(0.5, -0.56)];
        [bezier7Path closePath];
        [bezier7Path moveToPoint: CGPointMake(0.5, 0.7)];
        [bezier7Path addCurveToPoint: CGPointMake(0, 0.2) controlPoint1: CGPointMake(0.5, 0.42) controlPoint2: CGPointMake(0.28, 0.2)];
        [bezier7Path addCurveToPoint: CGPointMake(-0.5, 0.7) controlPoint1: CGPointMake(-0.28, 0.2) controlPoint2: CGPointMake(-0.5, 0.42)];
        [bezier7Path addCurveToPoint: CGPointMake(0, 1.2) controlPoint1: CGPointMake(-0.5, 0.98) controlPoint2: CGPointMake(-0.28, 1.2)];
        [bezier7Path addCurveToPoint: CGPointMake(0.5, 0.7) controlPoint1: CGPointMake(0.28, 1.2) controlPoint2: CGPointMake(0.5, 0.98)];
        [bezier7Path closePath];
        [bezier7Path moveToPoint: CGPointMake(0.5, 2.38)];
        [bezier7Path addCurveToPoint: CGPointMake(0, 1.88) controlPoint1: CGPointMake(0.5, 2.1) controlPoint2: CGPointMake(0.28, 1.88)];
        [bezier7Path addCurveToPoint: CGPointMake(-0.5, 2.38) controlPoint1: CGPointMake(-0.28, 1.88) controlPoint2: CGPointMake(-0.5, 2.1)];
        [bezier7Path addCurveToPoint: CGPointMake(0, 2.88) controlPoint1: CGPointMake(-0.5, 2.65) controlPoint2: CGPointMake(-0.28, 2.88)];
        [bezier7Path addCurveToPoint: CGPointMake(0.5, 2.38) controlPoint1: CGPointMake(0.28, 2.88) controlPoint2: CGPointMake(0.5, 2.65)];
        [bezier7Path closePath];
        [bezier7Path moveToPoint: CGPointMake(0.5, 4)];
        [bezier7Path addCurveToPoint: CGPointMake(0, 3.5) controlPoint1: CGPointMake(0.5, 3.72) controlPoint2: CGPointMake(0.28, 3.5)];
        [bezier7Path addCurveToPoint: CGPointMake(-0.5, 4) controlPoint1: CGPointMake(-0.28, 3.5) controlPoint2: CGPointMake(-0.5, 3.72)];
        [bezier7Path addCurveToPoint: CGPointMake(0, 4.5) controlPoint1: CGPointMake(-0.5, 4.27) controlPoint2: CGPointMake(-0.28, 4.5)];
        [bezier7Path addCurveToPoint: CGPointMake(0.5, 4) controlPoint1: CGPointMake(0.28, 4.5) controlPoint2: CGPointMake(0.5, 4.27)];
        [bezier7Path closePath];
        [black setFill];
        [bezier7Path fill];

        CGContextRestoreGState(context);
    }


    //// micd title 3 Drawing
    CGContextSaveGState(context);
    CGContextTranslateCTM(context, 226.44, 5.14);
    CGContextRotateCTM(context, -73.67 * M_PI / 180);

    UIBezierPath* micdTitle3Path = UIBezierPath.bezierPath;
    [micdTitle3Path moveToPoint: CGPointMake(-21.57, -6.62)];
    [micdTitle3Path addCurveToPoint: CGPointMake(-26.89, 3) controlPoint1: CGPointMake(-21.5, 0.31) controlPoint2: CGPointMake(-28.43, 1.54)];
    [micdTitle3Path addCurveToPoint: CGPointMake(-15.03, -5.62) controlPoint1: CGPointMake(-25.35, 4.47) controlPoint2: CGPointMake(-16.42, 0.85)];
    [micdTitle3Path addCurveToPoint: CGPointMake(-21.57, -6.62) controlPoint1: CGPointMake(-13.64, -12.01) controlPoint2: CGPointMake(-21.65, -12.86)];
    [micdTitle3Path closePath];
    [color setFill];
    [micdTitle3Path fill];

    CGContextRestoreGState(context);


    //// Group
    {
        //// Bezier 8 Drawing
        CGContextSaveGState(context);
        CGContextTranslateCTM(context, 171.96, 616.1);
        CGContextRotateCTM(context, 10.26 * M_PI / 180);

        UIBezierPath* bezier8Path = UIBezierPath.bezierPath;
        [bezier8Path moveToPoint: CGPointMake(0.5, -4)];
        [bezier8Path addCurveToPoint: CGPointMake(0, -4.5) controlPoint1: CGPointMake(0.5, -4.27) controlPoint2: CGPointMake(0.28, -4.5)];
        [bezier8Path addCurveToPoint: CGPointMake(-0.5, -4) controlPoint1: CGPointMake(-0.28, -4.5) controlPoint2: CGPointMake(-0.5, -4.27)];
        [bezier8Path addCurveToPoint: CGPointMake(0, -3.5) controlPoint1: CGPointMake(-0.5, -3.72) controlPoint2: CGPointMake(-0.28, -3.5)];
        [bezier8Path addCurveToPoint: CGPointMake(0.5, -4) controlPoint1: CGPointMake(0.28, -3.5) controlPoint2: CGPointMake(0.5, -3.72)];
        [bezier8Path closePath];
        [bezier8Path moveToPoint: CGPointMake(0.5, -2.46)];
        [bezier8Path addCurveToPoint: CGPointMake(0, -2.96) controlPoint1: CGPointMake(0.5, -2.74) controlPoint2: CGPointMake(0.28, -2.96)];
        [bezier8Path addCurveToPoint: CGPointMake(-0.5, -2.46) controlPoint1: CGPointMake(-0.28, -2.96) controlPoint2: CGPointMake(-0.5, -2.74)];
        [bezier8Path addCurveToPoint: CGPointMake(0, -1.96) controlPoint1: CGPointMake(-0.5, -2.18) controlPoint2: CGPointMake(-0.28, -1.96)];
        [bezier8Path addCurveToPoint: CGPointMake(0.5, -2.46) controlPoint1: CGPointMake(0.28, -1.96) controlPoint2: CGPointMake(0.5, -2.18)];
        [bezier8Path closePath];
        [bezier8Path moveToPoint: CGPointMake(0.5, -0.84)];
        [bezier8Path addCurveToPoint: CGPointMake(0, -1.34) controlPoint1: CGPointMake(0.5, -1.12) controlPoint2: CGPointMake(0.28, -1.34)];
        [bezier8Path addCurveToPoint: CGPointMake(-0.5, -0.84) controlPoint1: CGPointMake(-0.28, -1.34) controlPoint2: CGPointMake(-0.5, -1.12)];
        [bezier8Path addCurveToPoint: CGPointMake(0, -0.34) controlPoint1: CGPointMake(-0.5, -0.56) controlPoint2: CGPointMake(-0.28, -0.34)];
        [bezier8Path addCurveToPoint: CGPointMake(0.5, -0.84) controlPoint1: CGPointMake(0.28, -0.34) controlPoint2: CGPointMake(0.5, -0.56)];
        [bezier8Path closePath];
        [bezier8Path moveToPoint: CGPointMake(0.5, 0.7)];
        [bezier8Path addCurveToPoint: CGPointMake(0, 0.2) controlPoint1: CGPointMake(0.5, 0.42) controlPoint2: CGPointMake(0.28, 0.2)];
        [bezier8Path addCurveToPoint: CGPointMake(-0.5, 0.7) controlPoint1: CGPointMake(-0.28, 0.2) controlPoint2: CGPointMake(-0.5, 0.42)];
        [bezier8Path addCurveToPoint: CGPointMake(0, 1.2) controlPoint1: CGPointMake(-0.5, 0.98) controlPoint2: CGPointMake(-0.28, 1.2)];
        [bezier8Path addCurveToPoint: CGPointMake(0.5, 0.7) controlPoint1: CGPointMake(0.28, 1.2) controlPoint2: CGPointMake(0.5, 0.98)];
        [bezier8Path closePath];
        [bezier8Path moveToPoint: CGPointMake(0.5, 2.38)];
        [bezier8Path addCurveToPoint: CGPointMake(0, 1.88) controlPoint1: CGPointMake(0.5, 2.1) controlPoint2: CGPointMake(0.28, 1.88)];
        [bezier8Path addCurveToPoint: CGPointMake(-0.5, 2.38) controlPoint1: CGPointMake(-0.28, 1.88) controlPoint2: CGPointMake(-0.5, 2.1)];
        [bezier8Path addCurveToPoint: CGPointMake(0, 2.88) controlPoint1: CGPointMake(-0.5, 2.65) controlPoint2: CGPointMake(-0.28, 2.88)];
        [bezier8Path addCurveToPoint: CGPointMake(0.5, 2.38) controlPoint1: CGPointMake(0.28, 2.88) controlPoint2: CGPointMake(0.5, 2.65)];
        [bezier8Path closePath];
        [bezier8Path moveToPoint: CGPointMake(0.5, 4)];
        [bezier8Path addCurveToPoint: CGPointMake(0, 3.5) controlPoint1: CGPointMake(0.5, 3.72) controlPoint2: CGPointMake(0.28, 3.5)];
        [bezier8Path addCurveToPoint: CGPointMake(-0.5, 4) controlPoint1: CGPointMake(-0.28, 3.5) controlPoint2: CGPointMake(-0.5, 3.72)];
        [bezier8Path addCurveToPoint: CGPointMake(0, 4.5) controlPoint1: CGPointMake(-0.5, 4.27) controlPoint2: CGPointMake(-0.28, 4.5)];
        [bezier8Path addCurveToPoint: CGPointMake(0.5, 4) controlPoint1: CGPointMake(0.28, 4.5) controlPoint2: CGPointMake(0.5, 4.27)];
        [bezier8Path closePath];
        [black setFill];
        [bezier8Path fill];

        CGContextRestoreGState(context);


        //// Bezier 9 Drawing
        CGContextSaveGState(context);
        CGContextTranslateCTM(context, 173.74, 615.55);
        CGContextRotateCTM(context, 10.26 * M_PI / 180);

        UIBezierPath* bezier9Path = UIBezierPath.bezierPath;
        [bezier9Path moveToPoint: CGPointMake(0.5, -4)];
        [bezier9Path addCurveToPoint: CGPointMake(0, -4.5) controlPoint1: CGPointMake(0.5, -4.27) controlPoint2: CGPointMake(0.28, -4.5)];
        [bezier9Path addCurveToPoint: CGPointMake(-0.5, -4) controlPoint1: CGPointMake(-0.28, -4.5) controlPoint2: CGPointMake(-0.5, -4.27)];
        [bezier9Path addCurveToPoint: CGPointMake(0, -3.5) controlPoint1: CGPointMake(-0.5, -3.72) controlPoint2: CGPointMake(-0.28, -3.5)];
        [bezier9Path addCurveToPoint: CGPointMake(0.5, -4) controlPoint1: CGPointMake(0.28, -3.5) controlPoint2: CGPointMake(0.5, -3.72)];
        [bezier9Path closePath];
        [bezier9Path moveToPoint: CGPointMake(0.5, -2.46)];
        [bezier9Path addCurveToPoint: CGPointMake(0, -2.96) controlPoint1: CGPointMake(0.5, -2.74) controlPoint2: CGPointMake(0.28, -2.96)];
        [bezier9Path addCurveToPoint: CGPointMake(-0.5, -2.46) controlPoint1: CGPointMake(-0.28, -2.96) controlPoint2: CGPointMake(-0.5, -2.74)];
        [bezier9Path addCurveToPoint: CGPointMake(0, -1.96) controlPoint1: CGPointMake(-0.5, -2.18) controlPoint2: CGPointMake(-0.28, -1.96)];
        [bezier9Path addCurveToPoint: CGPointMake(0.5, -2.46) controlPoint1: CGPointMake(0.28, -1.96) controlPoint2: CGPointMake(0.5, -2.18)];
        [bezier9Path closePath];
        [bezier9Path moveToPoint: CGPointMake(0.5, -0.84)];
        [bezier9Path addCurveToPoint: CGPointMake(0, -1.34) controlPoint1: CGPointMake(0.5, -1.12) controlPoint2: CGPointMake(0.28, -1.34)];
        [bezier9Path addCurveToPoint: CGPointMake(-0.5, -0.84) controlPoint1: CGPointMake(-0.28, -1.34) controlPoint2: CGPointMake(-0.5, -1.12)];
        [bezier9Path addCurveToPoint: CGPointMake(0, -0.34) controlPoint1: CGPointMake(-0.5, -0.56) controlPoint2: CGPointMake(-0.28, -0.34)];
        [bezier9Path addCurveToPoint: CGPointMake(0.5, -0.84) controlPoint1: CGPointMake(0.28, -0.34) controlPoint2: CGPointMake(0.5, -0.56)];
        [bezier9Path closePath];
        [bezier9Path moveToPoint: CGPointMake(0.5, 0.7)];
        [bezier9Path addCurveToPoint: CGPointMake(0, 0.2) controlPoint1: CGPointMake(0.5, 0.42) controlPoint2: CGPointMake(0.28, 0.2)];
        [bezier9Path addCurveToPoint: CGPointMake(-0.5, 0.7) controlPoint1: CGPointMake(-0.28, 0.2) controlPoint2: CGPointMake(-0.5, 0.42)];
        [bezier9Path addCurveToPoint: CGPointMake(0, 1.2) controlPoint1: CGPointMake(-0.5, 0.98) controlPoint2: CGPointMake(-0.28, 1.2)];
        [bezier9Path addCurveToPoint: CGPointMake(0.5, 0.7) controlPoint1: CGPointMake(0.28, 1.2) controlPoint2: CGPointMake(0.5, 0.98)];
        [bezier9Path closePath];
        [bezier9Path moveToPoint: CGPointMake(0.5, 2.38)];
        [bezier9Path addCurveToPoint: CGPointMake(0, 1.88) controlPoint1: CGPointMake(0.5, 2.1) controlPoint2: CGPointMake(0.28, 1.88)];
        [bezier9Path addCurveToPoint: CGPointMake(-0.5, 2.38) controlPoint1: CGPointMake(-0.28, 1.88) controlPoint2: CGPointMake(-0.5, 2.1)];
        [bezier9Path addCurveToPoint: CGPointMake(0, 2.88) controlPoint1: CGPointMake(-0.5, 2.65) controlPoint2: CGPointMake(-0.28, 2.88)];
        [bezier9Path addCurveToPoint: CGPointMake(0.5, 2.38) controlPoint1: CGPointMake(0.28, 2.88) controlPoint2: CGPointMake(0.5, 2.65)];
        [bezier9Path closePath];
        [bezier9Path moveToPoint: CGPointMake(0.5, 4)];
        [bezier9Path addCurveToPoint: CGPointMake(0, 3.5) controlPoint1: CGPointMake(0.5, 3.72) controlPoint2: CGPointMake(0.28, 3.5)];
        [bezier9Path addCurveToPoint: CGPointMake(-0.5, 4) controlPoint1: CGPointMake(-0.28, 3.5) controlPoint2: CGPointMake(-0.5, 3.72)];
        [bezier9Path addCurveToPoint: CGPointMake(0, 4.5) controlPoint1: CGPointMake(-0.5, 4.27) controlPoint2: CGPointMake(-0.28, 4.5)];
        [bezier9Path addCurveToPoint: CGPointMake(0.5, 4) controlPoint1: CGPointMake(0.28, 4.5) controlPoint2: CGPointMake(0.5, 4.27)];
        [bezier9Path closePath];
        [black setFill];
        [bezier9Path fill];

        CGContextRestoreGState(context);


        //// Bezier 10 Drawing
        CGContextSaveGState(context);
        CGContextTranslateCTM(context, 175.54, 615.46);
        CGContextRotateCTM(context, 10.26 * M_PI / 180);

        UIBezierPath* bezier10Path = UIBezierPath.bezierPath;
        [bezier10Path moveToPoint: CGPointMake(0.5, -4)];
        [bezier10Path addCurveToPoint: CGPointMake(0, -4.5) controlPoint1: CGPointMake(0.5, -4.27) controlPoint2: CGPointMake(0.28, -4.5)];
        [bezier10Path addCurveToPoint: CGPointMake(-0.5, -4) controlPoint1: CGPointMake(-0.28, -4.5) controlPoint2: CGPointMake(-0.5, -4.27)];
        [bezier10Path addCurveToPoint: CGPointMake(0, -3.5) controlPoint1: CGPointMake(-0.5, -3.72) controlPoint2: CGPointMake(-0.28, -3.5)];
        [bezier10Path addCurveToPoint: CGPointMake(0.5, -4) controlPoint1: CGPointMake(0.28, -3.5) controlPoint2: CGPointMake(0.5, -3.72)];
        [bezier10Path closePath];
        [bezier10Path moveToPoint: CGPointMake(0.5, -2.46)];
        [bezier10Path addCurveToPoint: CGPointMake(0, -2.96) controlPoint1: CGPointMake(0.5, -2.74) controlPoint2: CGPointMake(0.28, -2.96)];
        [bezier10Path addCurveToPoint: CGPointMake(-0.5, -2.46) controlPoint1: CGPointMake(-0.28, -2.96) controlPoint2: CGPointMake(-0.5, -2.74)];
        [bezier10Path addCurveToPoint: CGPointMake(0, -1.96) controlPoint1: CGPointMake(-0.5, -2.18) controlPoint2: CGPointMake(-0.28, -1.96)];
        [bezier10Path addCurveToPoint: CGPointMake(0.5, -2.46) controlPoint1: CGPointMake(0.28, -1.96) controlPoint2: CGPointMake(0.5, -2.18)];
        [bezier10Path closePath];
        [bezier10Path moveToPoint: CGPointMake(0.5, -0.84)];
        [bezier10Path addCurveToPoint: CGPointMake(0, -1.34) controlPoint1: CGPointMake(0.5, -1.12) controlPoint2: CGPointMake(0.28, -1.34)];
        [bezier10Path addCurveToPoint: CGPointMake(-0.5, -0.84) controlPoint1: CGPointMake(-0.28, -1.34) controlPoint2: CGPointMake(-0.5, -1.12)];
        [bezier10Path addCurveToPoint: CGPointMake(0, -0.34) controlPoint1: CGPointMake(-0.5, -0.56) controlPoint2: CGPointMake(-0.28, -0.34)];
        [bezier10Path addCurveToPoint: CGPointMake(0.5, -0.84) controlPoint1: CGPointMake(0.28, -0.34) controlPoint2: CGPointMake(0.5, -0.56)];
        [bezier10Path closePath];
        [bezier10Path moveToPoint: CGPointMake(0.5, 0.7)];
        [bezier10Path addCurveToPoint: CGPointMake(0, 0.2) controlPoint1: CGPointMake(0.5, 0.42) controlPoint2: CGPointMake(0.28, 0.2)];
        [bezier10Path addCurveToPoint: CGPointMake(-0.5, 0.7) controlPoint1: CGPointMake(-0.28, 0.2) controlPoint2: CGPointMake(-0.5, 0.42)];
        [bezier10Path addCurveToPoint: CGPointMake(0, 1.2) controlPoint1: CGPointMake(-0.5, 0.98) controlPoint2: CGPointMake(-0.28, 1.2)];
        [bezier10Path addCurveToPoint: CGPointMake(0.5, 0.7) controlPoint1: CGPointMake(0.28, 1.2) controlPoint2: CGPointMake(0.5, 0.98)];
        [bezier10Path closePath];
        [bezier10Path moveToPoint: CGPointMake(0.5, 2.38)];
        [bezier10Path addCurveToPoint: CGPointMake(0, 1.88) controlPoint1: CGPointMake(0.5, 2.1) controlPoint2: CGPointMake(0.28, 1.88)];
        [bezier10Path addCurveToPoint: CGPointMake(-0.5, 2.38) controlPoint1: CGPointMake(-0.28, 1.88) controlPoint2: CGPointMake(-0.5, 2.1)];
        [bezier10Path addCurveToPoint: CGPointMake(0, 2.88) controlPoint1: CGPointMake(-0.5, 2.65) controlPoint2: CGPointMake(-0.28, 2.88)];
        [bezier10Path addCurveToPoint: CGPointMake(0.5, 2.38) controlPoint1: CGPointMake(0.28, 2.88) controlPoint2: CGPointMake(0.5, 2.65)];
        [bezier10Path closePath];
        [bezier10Path moveToPoint: CGPointMake(0.5, 4)];
        [bezier10Path addCurveToPoint: CGPointMake(0, 3.5) controlPoint1: CGPointMake(0.5, 3.72) controlPoint2: CGPointMake(0.28, 3.5)];
        [bezier10Path addCurveToPoint: CGPointMake(-0.5, 4) controlPoint1: CGPointMake(-0.28, 3.5) controlPoint2: CGPointMake(-0.5, 3.72)];
        [bezier10Path addCurveToPoint: CGPointMake(0, 4.5) controlPoint1: CGPointMake(-0.5, 4.27) controlPoint2: CGPointMake(-0.28, 4.5)];
        [bezier10Path addCurveToPoint: CGPointMake(0.5, 4) controlPoint1: CGPointMake(0.28, 4.5) controlPoint2: CGPointMake(0.5, 4.27)];
        [bezier10Path closePath];
        [black setFill];
        [bezier10Path fill];

        CGContextRestoreGState(context);


        //// Bezier 11 Drawing
        CGContextSaveGState(context);
        CGContextTranslateCTM(context, 177.36, 615.95);
        CGContextRotateCTM(context, 10.26 * M_PI / 180);

        UIBezierPath* bezier11Path = UIBezierPath.bezierPath;
        [bezier11Path moveToPoint: CGPointMake(0.5, -4)];
        [bezier11Path addCurveToPoint: CGPointMake(0, -4.5) controlPoint1: CGPointMake(0.5, -4.27) controlPoint2: CGPointMake(0.28, -4.5)];
        [bezier11Path addCurveToPoint: CGPointMake(-0.5, -4) controlPoint1: CGPointMake(-0.28, -4.5) controlPoint2: CGPointMake(-0.5, -4.27)];
        [bezier11Path addCurveToPoint: CGPointMake(0, -3.5) controlPoint1: CGPointMake(-0.5, -3.72) controlPoint2: CGPointMake(-0.28, -3.5)];
        [bezier11Path addCurveToPoint: CGPointMake(0.5, -4) controlPoint1: CGPointMake(0.28, -3.5) controlPoint2: CGPointMake(0.5, -3.72)];
        [bezier11Path closePath];
        [bezier11Path moveToPoint: CGPointMake(0.5, -2.46)];
        [bezier11Path addCurveToPoint: CGPointMake(0, -2.96) controlPoint1: CGPointMake(0.5, -2.74) controlPoint2: CGPointMake(0.28, -2.96)];
        [bezier11Path addCurveToPoint: CGPointMake(-0.5, -2.46) controlPoint1: CGPointMake(-0.28, -2.96) controlPoint2: CGPointMake(-0.5, -2.74)];
        [bezier11Path addCurveToPoint: CGPointMake(0, -1.96) controlPoint1: CGPointMake(-0.5, -2.18) controlPoint2: CGPointMake(-0.28, -1.96)];
        [bezier11Path addCurveToPoint: CGPointMake(0.5, -2.46) controlPoint1: CGPointMake(0.28, -1.96) controlPoint2: CGPointMake(0.5, -2.18)];
        [bezier11Path closePath];
        [bezier11Path moveToPoint: CGPointMake(0.5, -0.84)];
        [bezier11Path addCurveToPoint: CGPointMake(0, -1.34) controlPoint1: CGPointMake(0.5, -1.12) controlPoint2: CGPointMake(0.28, -1.34)];
        [bezier11Path addCurveToPoint: CGPointMake(-0.5, -0.84) controlPoint1: CGPointMake(-0.28, -1.34) controlPoint2: CGPointMake(-0.5, -1.12)];
        [bezier11Path addCurveToPoint: CGPointMake(0, -0.34) controlPoint1: CGPointMake(-0.5, -0.56) controlPoint2: CGPointMake(-0.28, -0.34)];
        [bezier11Path addCurveToPoint: CGPointMake(0.5, -0.84) controlPoint1: CGPointMake(0.28, -0.34) controlPoint2: CGPointMake(0.5, -0.56)];
        [bezier11Path closePath];
        [bezier11Path moveToPoint: CGPointMake(0.5, 0.7)];
        [bezier11Path addCurveToPoint: CGPointMake(0, 0.2) controlPoint1: CGPointMake(0.5, 0.42) controlPoint2: CGPointMake(0.28, 0.2)];
        [bezier11Path addCurveToPoint: CGPointMake(-0.5, 0.7) controlPoint1: CGPointMake(-0.28, 0.2) controlPoint2: CGPointMake(-0.5, 0.42)];
        [bezier11Path addCurveToPoint: CGPointMake(0, 1.2) controlPoint1: CGPointMake(-0.5, 0.98) controlPoint2: CGPointMake(-0.28, 1.2)];
        [bezier11Path addCurveToPoint: CGPointMake(0.5, 0.7) controlPoint1: CGPointMake(0.28, 1.2) controlPoint2: CGPointMake(0.5, 0.98)];
        [bezier11Path closePath];
        [bezier11Path moveToPoint: CGPointMake(0.5, 2.38)];
        [bezier11Path addCurveToPoint: CGPointMake(0, 1.88) controlPoint1: CGPointMake(0.5, 2.1) controlPoint2: CGPointMake(0.28, 1.88)];
        [bezier11Path addCurveToPoint: CGPointMake(-0.5, 2.38) controlPoint1: CGPointMake(-0.28, 1.88) controlPoint2: CGPointMake(-0.5, 2.1)];
        [bezier11Path addCurveToPoint: CGPointMake(0, 2.88) controlPoint1: CGPointMake(-0.5, 2.65) controlPoint2: CGPointMake(-0.28, 2.88)];
        [bezier11Path addCurveToPoint: CGPointMake(0.5, 2.38) controlPoint1: CGPointMake(0.28, 2.88) controlPoint2: CGPointMake(0.5, 2.65)];
        [bezier11Path closePath];
        [bezier11Path moveToPoint: CGPointMake(0.5, 4)];
        [bezier11Path addCurveToPoint: CGPointMake(0, 3.5) controlPoint1: CGPointMake(0.5, 3.72) controlPoint2: CGPointMake(0.28, 3.5)];
        [bezier11Path addCurveToPoint: CGPointMake(-0.5, 4) controlPoint1: CGPointMake(-0.28, 3.5) controlPoint2: CGPointMake(-0.5, 3.72)];
        [bezier11Path addCurveToPoint: CGPointMake(0, 4.5) controlPoint1: CGPointMake(-0.5, 4.27) controlPoint2: CGPointMake(-0.28, 4.5)];
        [bezier11Path addCurveToPoint: CGPointMake(0.5, 4) controlPoint1: CGPointMake(0.28, 4.5) controlPoint2: CGPointMake(0.5, 4.27)];
        [bezier11Path closePath];
        [black setFill];
        [bezier11Path fill];

        CGContextRestoreGState(context);


        //// Bezier 12 Drawing
        CGContextSaveGState(context);
        CGContextTranslateCTM(context, 179.25, 616.8);
        CGContextRotateCTM(context, 10.26 * M_PI / 180);

        UIBezierPath* bezier12Path = UIBezierPath.bezierPath;
        [bezier12Path moveToPoint: CGPointMake(0.5, -4)];
        [bezier12Path addCurveToPoint: CGPointMake(0, -4.5) controlPoint1: CGPointMake(0.5, -4.27) controlPoint2: CGPointMake(0.28, -4.5)];
        [bezier12Path addCurveToPoint: CGPointMake(-0.5, -4) controlPoint1: CGPointMake(-0.28, -4.5) controlPoint2: CGPointMake(-0.5, -4.27)];
        [bezier12Path addCurveToPoint: CGPointMake(0, -3.5) controlPoint1: CGPointMake(-0.5, -3.72) controlPoint2: CGPointMake(-0.28, -3.5)];
        [bezier12Path addCurveToPoint: CGPointMake(0.5, -4) controlPoint1: CGPointMake(0.28, -3.5) controlPoint2: CGPointMake(0.5, -3.72)];
        [bezier12Path closePath];
        [bezier12Path moveToPoint: CGPointMake(0.5, -2.46)];
        [bezier12Path addCurveToPoint: CGPointMake(0, -2.96) controlPoint1: CGPointMake(0.5, -2.74) controlPoint2: CGPointMake(0.28, -2.96)];
        [bezier12Path addCurveToPoint: CGPointMake(-0.5, -2.46) controlPoint1: CGPointMake(-0.28, -2.96) controlPoint2: CGPointMake(-0.5, -2.74)];
        [bezier12Path addCurveToPoint: CGPointMake(0, -1.96) controlPoint1: CGPointMake(-0.5, -2.18) controlPoint2: CGPointMake(-0.28, -1.96)];
        [bezier12Path addCurveToPoint: CGPointMake(0.5, -2.46) controlPoint1: CGPointMake(0.28, -1.96) controlPoint2: CGPointMake(0.5, -2.18)];
        [bezier12Path closePath];
        [bezier12Path moveToPoint: CGPointMake(0.5, -0.84)];
        [bezier12Path addCurveToPoint: CGPointMake(0, -1.34) controlPoint1: CGPointMake(0.5, -1.12) controlPoint2: CGPointMake(0.28, -1.34)];
        [bezier12Path addCurveToPoint: CGPointMake(-0.5, -0.84) controlPoint1: CGPointMake(-0.28, -1.34) controlPoint2: CGPointMake(-0.5, -1.12)];
        [bezier12Path addCurveToPoint: CGPointMake(0, -0.34) controlPoint1: CGPointMake(-0.5, -0.56) controlPoint2: CGPointMake(-0.28, -0.34)];
        [bezier12Path addCurveToPoint: CGPointMake(0.5, -0.84) controlPoint1: CGPointMake(0.28, -0.34) controlPoint2: CGPointMake(0.5, -0.56)];
        [bezier12Path closePath];
        [bezier12Path moveToPoint: CGPointMake(0.5, 0.7)];
        [bezier12Path addCurveToPoint: CGPointMake(0, 0.2) controlPoint1: CGPointMake(0.5, 0.42) controlPoint2: CGPointMake(0.28, 0.2)];
        [bezier12Path addCurveToPoint: CGPointMake(-0.5, 0.7) controlPoint1: CGPointMake(-0.28, 0.2) controlPoint2: CGPointMake(-0.5, 0.42)];
        [bezier12Path addCurveToPoint: CGPointMake(0, 1.2) controlPoint1: CGPointMake(-0.5, 0.98) controlPoint2: CGPointMake(-0.28, 1.2)];
        [bezier12Path addCurveToPoint: CGPointMake(0.5, 0.7) controlPoint1: CGPointMake(0.28, 1.2) controlPoint2: CGPointMake(0.5, 0.98)];
        [bezier12Path closePath];
        [bezier12Path moveToPoint: CGPointMake(0.5, 2.38)];
        [bezier12Path addCurveToPoint: CGPointMake(0, 1.88) controlPoint1: CGPointMake(0.5, 2.1) controlPoint2: CGPointMake(0.28, 1.88)];
        [bezier12Path addCurveToPoint: CGPointMake(-0.5, 2.38) controlPoint1: CGPointMake(-0.28, 1.88) controlPoint2: CGPointMake(-0.5, 2.1)];
        [bezier12Path addCurveToPoint: CGPointMake(0, 2.88) controlPoint1: CGPointMake(-0.5, 2.65) controlPoint2: CGPointMake(-0.28, 2.88)];
        [bezier12Path addCurveToPoint: CGPointMake(0.5, 2.38) controlPoint1: CGPointMake(0.28, 2.88) controlPoint2: CGPointMake(0.5, 2.65)];
        [bezier12Path closePath];
        [bezier12Path moveToPoint: CGPointMake(0.5, 4)];
        [bezier12Path addCurveToPoint: CGPointMake(0, 3.5) controlPoint1: CGPointMake(0.5, 3.72) controlPoint2: CGPointMake(0.28, 3.5)];
        [bezier12Path addCurveToPoint: CGPointMake(-0.5, 4) controlPoint1: CGPointMake(-0.28, 3.5) controlPoint2: CGPointMake(-0.5, 3.72)];
        [bezier12Path addCurveToPoint: CGPointMake(0, 4.5) controlPoint1: CGPointMake(-0.5, 4.27) controlPoint2: CGPointMake(-0.28, 4.5)];
        [bezier12Path addCurveToPoint: CGPointMake(0.5, 4) controlPoint1: CGPointMake(0.28, 4.5) controlPoint2: CGPointMake(0.5, 4.27)];
        [bezier12Path closePath];
        [black setFill];
        [bezier12Path fill];

        CGContextRestoreGState(context);


        //// Bezier 13 Drawing
        CGContextSaveGState(context);
        CGContextTranslateCTM(context, 181.01, 618.02);
        CGContextRotateCTM(context, 10.26 * M_PI / 180);

        UIBezierPath* bezier13Path = UIBezierPath.bezierPath;
        [bezier13Path moveToPoint: CGPointMake(0.5, -4)];
        [bezier13Path addCurveToPoint: CGPointMake(0, -4.5) controlPoint1: CGPointMake(0.5, -4.27) controlPoint2: CGPointMake(0.28, -4.5)];
        [bezier13Path addCurveToPoint: CGPointMake(-0.5, -4) controlPoint1: CGPointMake(-0.28, -4.5) controlPoint2: CGPointMake(-0.5, -4.27)];
        [bezier13Path addCurveToPoint: CGPointMake(0, -3.5) controlPoint1: CGPointMake(-0.5, -3.72) controlPoint2: CGPointMake(-0.28, -3.5)];
        [bezier13Path addCurveToPoint: CGPointMake(0.5, -4) controlPoint1: CGPointMake(0.28, -3.5) controlPoint2: CGPointMake(0.5, -3.72)];
        [bezier13Path closePath];
        [bezier13Path moveToPoint: CGPointMake(0.5, -2.46)];
        [bezier13Path addCurveToPoint: CGPointMake(0, -2.96) controlPoint1: CGPointMake(0.5, -2.74) controlPoint2: CGPointMake(0.28, -2.96)];
        [bezier13Path addCurveToPoint: CGPointMake(-0.5, -2.46) controlPoint1: CGPointMake(-0.28, -2.96) controlPoint2: CGPointMake(-0.5, -2.74)];
        [bezier13Path addCurveToPoint: CGPointMake(0, -1.96) controlPoint1: CGPointMake(-0.5, -2.18) controlPoint2: CGPointMake(-0.28, -1.96)];
        [bezier13Path addCurveToPoint: CGPointMake(0.5, -2.46) controlPoint1: CGPointMake(0.28, -1.96) controlPoint2: CGPointMake(0.5, -2.18)];
        [bezier13Path closePath];
        [bezier13Path moveToPoint: CGPointMake(0.5, -0.84)];
        [bezier13Path addCurveToPoint: CGPointMake(0, -1.34) controlPoint1: CGPointMake(0.5, -1.12) controlPoint2: CGPointMake(0.28, -1.34)];
        [bezier13Path addCurveToPoint: CGPointMake(-0.5, -0.84) controlPoint1: CGPointMake(-0.28, -1.34) controlPoint2: CGPointMake(-0.5, -1.12)];
        [bezier13Path addCurveToPoint: CGPointMake(0, -0.34) controlPoint1: CGPointMake(-0.5, -0.56) controlPoint2: CGPointMake(-0.28, -0.34)];
        [bezier13Path addCurveToPoint: CGPointMake(0.5, -0.84) controlPoint1: CGPointMake(0.28, -0.34) controlPoint2: CGPointMake(0.5, -0.56)];
        [bezier13Path closePath];
        [bezier13Path moveToPoint: CGPointMake(0.5, 0.7)];
        [bezier13Path addCurveToPoint: CGPointMake(0, 0.2) controlPoint1: CGPointMake(0.5, 0.42) controlPoint2: CGPointMake(0.28, 0.2)];
        [bezier13Path addCurveToPoint: CGPointMake(-0.5, 0.7) controlPoint1: CGPointMake(-0.28, 0.2) controlPoint2: CGPointMake(-0.5, 0.42)];
        [bezier13Path addCurveToPoint: CGPointMake(0, 1.2) controlPoint1: CGPointMake(-0.5, 0.98) controlPoint2: CGPointMake(-0.28, 1.2)];
        [bezier13Path addCurveToPoint: CGPointMake(0.5, 0.7) controlPoint1: CGPointMake(0.28, 1.2) controlPoint2: CGPointMake(0.5, 0.98)];
        [bezier13Path closePath];
        [bezier13Path moveToPoint: CGPointMake(0.5, 2.38)];
        [bezier13Path addCurveToPoint: CGPointMake(0, 1.88) controlPoint1: CGPointMake(0.5, 2.1) controlPoint2: CGPointMake(0.28, 1.88)];
        [bezier13Path addCurveToPoint: CGPointMake(-0.5, 2.38) controlPoint1: CGPointMake(-0.28, 1.88) controlPoint2: CGPointMake(-0.5, 2.1)];
        [bezier13Path addCurveToPoint: CGPointMake(0, 2.88) controlPoint1: CGPointMake(-0.5, 2.65) controlPoint2: CGPointMake(-0.28, 2.88)];
        [bezier13Path addCurveToPoint: CGPointMake(0.5, 2.38) controlPoint1: CGPointMake(0.28, 2.88) controlPoint2: CGPointMake(0.5, 2.65)];
        [bezier13Path closePath];
        [bezier13Path moveToPoint: CGPointMake(0.5, 4)];
        [bezier13Path addCurveToPoint: CGPointMake(0, 3.5) controlPoint1: CGPointMake(0.5, 3.72) controlPoint2: CGPointMake(0.28, 3.5)];
        [bezier13Path addCurveToPoint: CGPointMake(-0.5, 4) controlPoint1: CGPointMake(-0.28, 3.5) controlPoint2: CGPointMake(-0.5, 3.72)];
        [bezier13Path addCurveToPoint: CGPointMake(0, 4.5) controlPoint1: CGPointMake(-0.5, 4.27) controlPoint2: CGPointMake(-0.28, 4.5)];
        [bezier13Path addCurveToPoint: CGPointMake(0.5, 4) controlPoint1: CGPointMake(0.28, 4.5) controlPoint2: CGPointMake(0.5, 4.27)];
        [bezier13Path closePath];
        [black setFill];
        [bezier13Path fill];

        CGContextRestoreGState(context);


        //// Bezier 14 Drawing
        CGContextSaveGState(context);
        CGContextTranslateCTM(context, 182.64, 619.73);
        CGContextRotateCTM(context, 10.26 * M_PI / 180);

        UIBezierPath* bezier14Path = UIBezierPath.bezierPath;
        [bezier14Path moveToPoint: CGPointMake(0.5, -4)];
        [bezier14Path addCurveToPoint: CGPointMake(0, -4.5) controlPoint1: CGPointMake(0.5, -4.27) controlPoint2: CGPointMake(0.28, -4.5)];
        [bezier14Path addCurveToPoint: CGPointMake(-0.5, -4) controlPoint1: CGPointMake(-0.28, -4.5) controlPoint2: CGPointMake(-0.5, -4.27)];
        [bezier14Path addCurveToPoint: CGPointMake(0, -3.5) controlPoint1: CGPointMake(-0.5, -3.72) controlPoint2: CGPointMake(-0.28, -3.5)];
        [bezier14Path addCurveToPoint: CGPointMake(0.5, -4) controlPoint1: CGPointMake(0.28, -3.5) controlPoint2: CGPointMake(0.5, -3.72)];
        [bezier14Path closePath];
        [bezier14Path moveToPoint: CGPointMake(0.5, -2.46)];
        [bezier14Path addCurveToPoint: CGPointMake(0, -2.96) controlPoint1: CGPointMake(0.5, -2.74) controlPoint2: CGPointMake(0.28, -2.96)];
        [bezier14Path addCurveToPoint: CGPointMake(-0.5, -2.46) controlPoint1: CGPointMake(-0.28, -2.96) controlPoint2: CGPointMake(-0.5, -2.74)];
        [bezier14Path addCurveToPoint: CGPointMake(0, -1.96) controlPoint1: CGPointMake(-0.5, -2.18) controlPoint2: CGPointMake(-0.28, -1.96)];
        [bezier14Path addCurveToPoint: CGPointMake(0.5, -2.46) controlPoint1: CGPointMake(0.28, -1.96) controlPoint2: CGPointMake(0.5, -2.18)];
        [bezier14Path closePath];
        [bezier14Path moveToPoint: CGPointMake(0.5, -0.84)];
        [bezier14Path addCurveToPoint: CGPointMake(0, -1.34) controlPoint1: CGPointMake(0.5, -1.12) controlPoint2: CGPointMake(0.28, -1.34)];
        [bezier14Path addCurveToPoint: CGPointMake(-0.5, -0.84) controlPoint1: CGPointMake(-0.28, -1.34) controlPoint2: CGPointMake(-0.5, -1.12)];
        [bezier14Path addCurveToPoint: CGPointMake(0, -0.34) controlPoint1: CGPointMake(-0.5, -0.56) controlPoint2: CGPointMake(-0.28, -0.34)];
        [bezier14Path addCurveToPoint: CGPointMake(0.5, -0.84) controlPoint1: CGPointMake(0.28, -0.34) controlPoint2: CGPointMake(0.5, -0.56)];
        [bezier14Path closePath];
        [bezier14Path moveToPoint: CGPointMake(0.5, 0.7)];
        [bezier14Path addCurveToPoint: CGPointMake(0, 0.2) controlPoint1: CGPointMake(0.5, 0.42) controlPoint2: CGPointMake(0.28, 0.2)];
        [bezier14Path addCurveToPoint: CGPointMake(-0.5, 0.7) controlPoint1: CGPointMake(-0.28, 0.2) controlPoint2: CGPointMake(-0.5, 0.42)];
        [bezier14Path addCurveToPoint: CGPointMake(0, 1.2) controlPoint1: CGPointMake(-0.5, 0.98) controlPoint2: CGPointMake(-0.28, 1.2)];
        [bezier14Path addCurveToPoint: CGPointMake(0.5, 0.7) controlPoint1: CGPointMake(0.28, 1.2) controlPoint2: CGPointMake(0.5, 0.98)];
        [bezier14Path closePath];
        [bezier14Path moveToPoint: CGPointMake(0.5, 2.38)];
        [bezier14Path addCurveToPoint: CGPointMake(0, 1.88) controlPoint1: CGPointMake(0.5, 2.1) controlPoint2: CGPointMake(0.28, 1.88)];
        [bezier14Path addCurveToPoint: CGPointMake(-0.5, 2.38) controlPoint1: CGPointMake(-0.28, 1.88) controlPoint2: CGPointMake(-0.5, 2.1)];
        [bezier14Path addCurveToPoint: CGPointMake(0, 2.88) controlPoint1: CGPointMake(-0.5, 2.65) controlPoint2: CGPointMake(-0.28, 2.88)];
        [bezier14Path addCurveToPoint: CGPointMake(0.5, 2.38) controlPoint1: CGPointMake(0.28, 2.88) controlPoint2: CGPointMake(0.5, 2.65)];
        [bezier14Path closePath];
        [bezier14Path moveToPoint: CGPointMake(0.5, 4)];
        [bezier14Path addCurveToPoint: CGPointMake(0, 3.5) controlPoint1: CGPointMake(0.5, 3.72) controlPoint2: CGPointMake(0.28, 3.5)];
        [bezier14Path addCurveToPoint: CGPointMake(-0.5, 4) controlPoint1: CGPointMake(-0.28, 3.5) controlPoint2: CGPointMake(-0.5, 3.72)];
        [bezier14Path addCurveToPoint: CGPointMake(0, 4.5) controlPoint1: CGPointMake(-0.5, 4.27) controlPoint2: CGPointMake(-0.28, 4.5)];
        [bezier14Path addCurveToPoint: CGPointMake(0.5, 4) controlPoint1: CGPointMake(0.28, 4.5) controlPoint2: CGPointMake(0.5, 4.27)];
        [bezier14Path closePath];
        [black setFill];
        [bezier14Path fill];

        CGContextRestoreGState(context);
    }


    //// micd title 4 Drawing
    CGContextSaveGState(context);
    CGContextTranslateCTM(context, 226.35, 598.94);
    CGContextRotateCTM(context, -73.67 * M_PI / 180);

    UIBezierPath* micdTitle4Path = UIBezierPath.bezierPath;
    [micdTitle4Path moveToPoint: CGPointMake(-21.57, -6.62)];
    [micdTitle4Path addCurveToPoint: CGPointMake(-26.89, 3) controlPoint1: CGPointMake(-21.5, 0.31) controlPoint2: CGPointMake(-28.43, 1.54)];
    [micdTitle4Path addCurveToPoint: CGPointMake(-15.03, -5.62) controlPoint1: CGPointMake(-25.35, 4.47) controlPoint2: CGPointMake(-16.42, 0.85)];
    [micdTitle4Path addCurveToPoint: CGPointMake(-21.57, -6.62) controlPoint1: CGPointMake(-13.64, -12.01) controlPoint2: CGPointMake(-21.65, -12.86)];
    [micdTitle4Path closePath];
    [color setFill];
    [micdTitle4Path fill];

    CGContextRestoreGState(context);


    //// Group 3
    {
        //// Rectangle 4 Drawing
        UIBezierPath* rectangle4Path = [UIBezierPath bezierPathWithRect: CGRectMake(109.88, 601.51, 11.75, 19)];
        [color setFill];
        [rectangle4Path fill];
        [black setStroke];
        rectangle4Path.lineWidth = 1;
        [rectangle4Path stroke];


        //// Rectangle 6 Drawing
        UIBezierPath* rectangle6Path = UIBezierPath.bezierPath;
        [rectangle6Path moveToPoint: CGPointMake(111.33, 627.7)];
        [rectangle6Path addLineToPoint: CGPointMake(113.57, 628.58)];
        [rectangle6Path addLineToPoint: CGPointMake(115.72, 628.92)];
        [rectangle6Path addLineToPoint: CGPointMake(118.19, 628.63)];
        [rectangle6Path addLineToPoint: CGPointMake(120.18, 627.7)];
        [rectangle6Path addLineToPoint: CGPointMake(120.18, 623.36)];
        [rectangle6Path addLineToPoint: CGPointMake(111.33, 623.36)];
        [rectangle6Path addLineToPoint: CGPointMake(111.33, 627.7)];
        [rectangle6Path closePath];
        [color setFill];
        [rectangle6Path fill];
        [black setStroke];
        rectangle6Path.lineWidth = 0.5;
        [rectangle6Path stroke];


        //// Rectangle 3 Drawing
        UIBezierPath* rectangle3Path = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(107.71, 598.22, 16.29, 4.35) cornerRadius: 2];
        [color setFill];
        [rectangle3Path fill];


        //// Rectangle 5 Drawing
        CGContextSaveGState(context);
        CGContextTranslateCTM(context, 115.42, 622.59);
        CGContextRotateCTM(context, -0.08 * M_PI / 180);

        UIBezierPath* rectangle5Path = UIBezierPath.bezierPath;
        [rectangle5Path moveToPoint: CGPointMake(-5.58, 2.89)];
        [rectangle5Path addLineToPoint: CGPointMake(6.57, 3.02)];
        [rectangle5Path addCurveToPoint: CGPointMake(7.41, -3.02) controlPoint1: CGPointMake(6.57, 3.02) controlPoint2: CGPointMake(8.9, -2.95)];
        [rectangle5Path addCurveToPoint: CGPointMake(-6.51, -3.02) controlPoint1: CGPointMake(5.93, -3.09) controlPoint2: CGPointMake(-5.21, -3.13)];
        [rectangle5Path addCurveToPoint: CGPointMake(-5.58, 2.89) controlPoint1: CGPointMake(-7.81, -2.91) controlPoint2: CGPointMake(-5.58, 2.89)];
        [rectangle5Path closePath];
        [color setFill];
        [rectangle5Path fill];
        [black setStroke];
        rectangle5Path.lineWidth = 0.5;
        [rectangle5Path stroke];

        CGContextRestoreGState(context);


        //// Rectangle 2 Drawing
        UIBezierPath* rectangle2Path = UIBezierPath.bezierPath;
        [rectangle2Path moveToPoint: CGPointMake(109.89, 598.72)];
        [rectangle2Path addLineToPoint: CGPointMake(121.63, 598.72)];
        [rectangle2Path addCurveToPoint: CGPointMake(119.28, 587.49) controlPoint1: CGPointMake(121.63, 598.72) controlPoint2: CGPointMake(121.68, 590.3)];
        [rectangle2Path addCurveToPoint: CGPointMake(112.01, 587.49) controlPoint1: CGPointMake(115.68, 587.39) controlPoint2: CGPointMake(115.35, 587.51)];
        [rectangle2Path addCurveToPoint: CGPointMake(109.89, 598.72) controlPoint1: CGPointMake(109.66, 590.3) controlPoint2: CGPointMake(109.89, 598.72)];
        [rectangle2Path closePath];
        [color setFill];
        [rectangle2Path fill];


        //// Bezier 18 Drawing
        UIBezierPath* bezier18Path = UIBezierPath.bezierPath;
        [bezier18Path moveToPoint: CGPointMake(122.94, 597.91)];
        [bezier18Path addCurveToPoint: CGPointMake(122.94, 598.41) controlPoint1: CGPointMake(122.94, 598.07) controlPoint2: CGPointMake(122.94, 598.24)];
        [bezier18Path addCurveToPoint: CGPointMake(108.5, 598.53) controlPoint1: CGPointMake(118.39, 598) controlPoint2: CGPointMake(112.85, 598.04)];
        [bezier18Path addCurveToPoint: CGPointMake(108.5, 598.03) controlPoint1: CGPointMake(108.5, 598.36) controlPoint2: CGPointMake(108.5, 598.19)];
        [bezier18Path addCurveToPoint: CGPointMake(122.94, 597.91) controlPoint1: CGPointMake(112.86, 597.54) controlPoint2: CGPointMake(118.4, 597.5)];
        [bezier18Path closePath];
        [black setFill];
        [bezier18Path fill];


        //// Bezier 16 Drawing
        UIBezierPath* bezier16Path = UIBezierPath.bezierPath;
        [bezier16Path moveToPoint: CGPointMake(123.33, 602.74)];
        [bezier16Path addCurveToPoint: CGPointMake(108.58, 602.78) controlPoint1: CGPointMake(118.79, 603.17) controlPoint2: CGPointMake(113.19, 603.18)];
        [bezier16Path addLineToPoint: CGPointMake(108.58, 602.27)];
        [bezier16Path addCurveToPoint: CGPointMake(123.33, 602.24) controlPoint1: CGPointMake(113.18, 602.68) controlPoint2: CGPointMake(118.77, 602.67)];
        [bezier16Path addCurveToPoint: CGPointMake(123.33, 602.74) controlPoint1: CGPointMake(123.33, 602.41) controlPoint2: CGPointMake(123.33, 602.58)];
        [bezier16Path closePath];
        [black setFill];
        [bezier16Path fill];


        //// Bezier 17 Drawing
        CGContextSaveGState(context);
        CGContextTranslateCTM(context, 115.89, 625.66);
        CGContextRotateCTM(context, 0.04 * M_PI / 180);

        UIBezierPath* bezier17Path = UIBezierPath.bezierPath;
        [bezier17Path moveToPoint: CGPointMake(6.18, 0.08)];
        [bezier17Path addCurveToPoint: CGPointMake(-5.79, 0.12) controlPoint1: CGPointMake(2.49, 0.51) controlPoint2: CGPointMake(-2.05, 0.52)];
        [bezier17Path addLineToPoint: CGPointMake(-5.79, -0.39)];
        [bezier17Path addCurveToPoint: CGPointMake(6.18, -0.41) controlPoint1: CGPointMake(-2.06, 0.02) controlPoint2: CGPointMake(2.48, 0.01)];
        [bezier17Path addCurveToPoint: CGPointMake(6.18, 0.08) controlPoint1: CGPointMake(6.18, -0.24) controlPoint2: CGPointMake(6.18, -0.08)];
        [bezier17Path closePath];
        [black setFill];
        [bezier17Path fill];

        CGContextRestoreGState(context);


        //// Bezier 20 Drawing
        UIBezierPath* bezier20Path = UIBezierPath.bezierPath;
        [bezier20Path moveToPoint: CGPointMake(120.2, 587.47)];
        [bezier20Path addCurveToPoint: CGPointMake(120.2, 587.97) controlPoint1: CGPointMake(120.2, 587.64) controlPoint2: CGPointMake(120.2, 587.8)];
        [bezier20Path addCurveToPoint: CGPointMake(110.65, 588.1) controlPoint1: CGPointMake(117.19, 587.56) controlPoint2: CGPointMake(113.52, 587.61)];
        [bezier20Path addCurveToPoint: CGPointMake(110.65, 587.59) controlPoint1: CGPointMake(110.65, 587.92) controlPoint2: CGPointMake(110.65, 587.75)];
        [bezier20Path addCurveToPoint: CGPointMake(120.2, 587.47) controlPoint1: CGPointMake(113.53, 587.1) controlPoint2: CGPointMake(117.2, 587.07)];
        [bezier20Path closePath];
        [black setFill];
        [bezier20Path fill];
    }
}

+ (void)drawCanvas1WithColor: (UIColor*)color
{
    //// General Declarations
    CGContextRef context = UIGraphicsGetCurrentContext();

    //// Color Declarations
    UIColor* black = [UIColor colorWithRed: 0 green: 0 blue: 0 alpha: 1];
    UIColor* red = [UIColor colorWithRed: 0.992 green: 0.188 blue: 0.11 alpha: 1];

    //// Oval 4 Drawing
    UIBezierPath* oval4Path = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(167.5, 78.68, 45, 45)];
    [color setFill];
    [oval4Path fill];


    //// Bezier 3 Drawing
    CGContextSaveGState(context);
    CGContextTranslateCTM(context, -0, -671.64);
    CGContextRotateCTM(context, -180 * M_PI / 180);

    UIBezierPath* bezier3Path = UIBezierPath.bezierPath;
    [bezier3Path moveToPoint: CGPointMake(-375, -667)];
    [bezier3Path addLineToPoint: CGPointMake(-310, -667)];
    [bezier3Path addCurveToPoint: CGPointMake(-189, -514.5) controlPoint1: CGPointMake(-310, -667) controlPoint2: CGPointMake(-324, -514.5)];
    [bezier3Path addCurveToPoint: CGPointMake(-64, -667) controlPoint1: CGPointMake(-54, -514.5) controlPoint2: CGPointMake(-64, -667)];
    [bezier3Path addLineToPoint: CGPointMake(0, -667)];
    [bezier3Path addLineToPoint: CGPointMake(0, 60)];
    [bezier3Path addLineToPoint: CGPointMake(-375, 60)];
    [bezier3Path addLineToPoint: CGPointMake(-375, -667)];
    [black setFill];
    [bezier3Path fill];
    [UIColor.whiteColor setStroke];
    bezier3Path.lineWidth = 1;
    [bezier3Path stroke];

    CGContextRestoreGState(context);


    //// Group 2
    {
        //// micd title 2 Drawing
        CGRect micdTitle2Rect = CGRectMake(85.54, 0, 208.92, 92.46);
        {
            NSString* textContent = @"micd";
            NSMutableParagraphStyle* micdTitle2Style = NSMutableParagraphStyle.defaultParagraphStyle.mutableCopy;
            micdTitle2Style.alignment = NSTextAlignmentCenter;

            NSDictionary* micdTitle2FontAttributes = @{NSFontAttributeName: [UIFont fontWithName: @"RookiesShowtimes" size: 103], NSForegroundColorAttributeName: color, NSParagraphStyleAttributeName: micdTitle2Style};

            CGFloat micdTitle2TextHeight = [textContent boundingRectWithSize: CGSizeMake(micdTitle2Rect.size.width, INFINITY)  options: NSStringDrawingUsesLineFragmentOrigin attributes: micdTitle2FontAttributes context: nil].size.height;
            CGContextSaveGState(context);
            CGContextClipToRect(context, micdTitle2Rect);
            [textContent drawInRect: CGRectMake(CGRectGetMinX(micdTitle2Rect), CGRectGetMinY(micdTitle2Rect) + (CGRectGetHeight(micdTitle2Rect) - micdTitle2TextHeight) / 2, CGRectGetWidth(micdTitle2Rect), micdTitle2TextHeight) withAttributes: micdTitle2FontAttributes];
            CGContextRestoreGState(context);
        }


        //// Rectangle 4 Drawing
        UIBezierPath* rectangle4Path = UIBezierPath.bezierPath;
        [rectangle4Path moveToPoint: CGPointMake(164.58, 88.48)];
        [rectangle4Path addCurveToPoint: CGPointMake(122.13, 194.76) controlPoint1: CGPointMake(152.35, 110.2) controlPoint2: CGPointMake(123.1, 153.66)];
        [rectangle4Path addCurveToPoint: CGPointMake(194.71, 294.14) controlPoint1: CGPointMake(120.63, 258.12) controlPoint2: CGPointMake(194.75, 223.7)];
        [rectangle4Path addCurveToPoint: CGPointMake(128.13, 425.67) controlPoint1: CGPointMake(194.67, 355.57) controlPoint2: CGPointMake(133.04, 373.98)];
        [rectangle4Path addCurveToPoint: CGPointMake(167.19, 492.27) controlPoint1: CGPointMake(126.9, 438.6) controlPoint2: CGPointMake(138.16, 472.84)];
        [rectangle4Path addCurveToPoint: CGPointMake(252.55, 534.03) controlPoint1: CGPointMake(187.81, 506.06) controlPoint2: CGPointMake(236.93, 522.91)];
        [rectangle4Path addCurveToPoint: CGPointMake(274.08, 567.65) controlPoint1: CGPointMake(266.08, 543.66) controlPoint2: CGPointMake(271.77, 559.46)];
        [rectangle4Path addCurveToPoint: CGPointMake(269.11, 644.69) controlPoint1: CGPointMake(285.95, 609.83) controlPoint2: CGPointMake(269.11, 644.69)];
        [rectangle4Path addLineToPoint: CGPointMake(272.26, 647.55)];
        [rectangle4Path addCurveToPoint: CGPointMake(277.14, 564.57) controlPoint1: CGPointMake(272.26, 647.55) controlPoint2: CGPointMake(289.05, 607.04)];
        [rectangle4Path addCurveToPoint: CGPointMake(255.06, 530.76) controlPoint1: CGPointMake(274.8, 556.21) controlPoint2: CGPointMake(268.84, 540.36)];
        [rectangle4Path addCurveToPoint: CGPointMake(169.79, 489) controlPoint1: CGPointMake(241.34, 521.21) controlPoint2: CGPointMake(187.95, 500.9)];
        [rectangle4Path addCurveToPoint: CGPointMake(133.12, 426.08) controlPoint1: CGPointMake(138.76, 468.66) controlPoint2: CGPointMake(132.21, 440.6)];
        [rectangle4Path addCurveToPoint: CGPointMake(200.69, 294.64) controlPoint1: CGPointMake(136.72, 368.02) controlPoint2: CGPointMake(200.65, 356.23)];
        [rectangle4Path addCurveToPoint: CGPointMake(128.13, 195) controlPoint1: CGPointMake(200.74, 224.3) controlPoint2: CGPointMake(126.63, 258.49)];
        [rectangle4Path addCurveToPoint: CGPointMake(167.19, 88.48) controlPoint1: CGPointMake(129.12, 153.18) controlPoint2: CGPointMake(154.95, 110.05)];
        [rectangle4Path addCurveToPoint: CGPointMake(178.64, 58.81) controlPoint1: CGPointMake(173.53, 77.31) controlPoint2: CGPointMake(178.64, 58.81)];
        [rectangle4Path addLineToPoint: CGPointMake(169.79, 58.81)];
        [rectangle4Path addCurveToPoint: CGPointMake(164.58, 88.48) controlPoint1: CGPointMake(169.79, 58.81) controlPoint2: CGPointMake(171.21, 76.72)];
        [rectangle4Path closePath];
        [color setFill];
        [rectangle4Path fill];


        //// micd title 3 Drawing
        CGRect micdTitle3Rect = CGRectMake(85.54, 593.39, 208.92, 92.46);
        {
            NSString* textContent = @"micd";
            NSMutableParagraphStyle* micdTitle3Style = NSMutableParagraphStyle.defaultParagraphStyle.mutableCopy;
            micdTitle3Style.alignment = NSTextAlignmentCenter;

            NSDictionary* micdTitle3FontAttributes = @{NSFontAttributeName: [UIFont fontWithName: @"RookiesShowtimes" size: 103], NSForegroundColorAttributeName: color, NSParagraphStyleAttributeName: micdTitle3Style};

            CGFloat micdTitle3TextHeight = [textContent boundingRectWithSize: CGSizeMake(micdTitle3Rect.size.width, INFINITY)  options: NSStringDrawingUsesLineFragmentOrigin attributes: micdTitle3FontAttributes context: nil].size.height;
            CGContextSaveGState(context);
            CGContextClipToRect(context, micdTitle3Rect);
            [textContent drawInRect: CGRectMake(CGRectGetMinX(micdTitle3Rect), CGRectGetMinY(micdTitle3Rect) + (CGRectGetHeight(micdTitle3Rect) - micdTitle3TextHeight) / 2, CGRectGetWidth(micdTitle3Rect), micdTitle3TextHeight) withAttributes: micdTitle3FontAttributes];
            CGContextRestoreGState(context);
        }
    }


    //// micd title Drawing
    CGRect micdTitleRect = CGRectMake(85.54, -1.03, 208.92, 92.46);
    {
        NSString* textContent = @"micd";
        NSMutableParagraphStyle* micdTitleStyle = NSMutableParagraphStyle.defaultParagraphStyle.mutableCopy;
        micdTitleStyle.alignment = NSTextAlignmentCenter;

        NSDictionary* micdTitleFontAttributes = @{NSFontAttributeName: [UIFont fontWithName: @"RookiesShowtimes" size: 103], NSForegroundColorAttributeName: color, NSParagraphStyleAttributeName: micdTitleStyle};

        CGFloat micdTitleTextHeight = [textContent boundingRectWithSize: CGSizeMake(micdTitleRect.size.width, INFINITY)  options: NSStringDrawingUsesLineFragmentOrigin attributes: micdTitleFontAttributes context: nil].size.height;
        CGContextSaveGState(context);
        CGContextClipToRect(context, micdTitleRect);
        [textContent drawInRect: CGRectMake(CGRectGetMinX(micdTitleRect), CGRectGetMinY(micdTitleRect) + (CGRectGetHeight(micdTitleRect) - micdTitleTextHeight) / 2, CGRectGetWidth(micdTitleRect), micdTitleTextHeight) withAttributes: micdTitleFontAttributes];
        CGContextRestoreGState(context);
    }


    //// Text 2 Drawing
    UIBezierPath* text2Path = UIBezierPath.bezierPath;
    [text2Path moveToPoint: CGPointMake(128.62, 634.94)];
    [text2Path addLineToPoint: CGPointMake(132.5, 615.54)];
    [text2Path addLineToPoint: CGPointMake(136.3, 615.54)];
    [text2Path addLineToPoint: CGPointMake(140.28, 634.94)];
    [text2Path addLineToPoint: CGPointMake(140.33, 634.94)];
    [text2Path addLineToPoint: CGPointMake(143.74, 615.54)];
    [text2Path addLineToPoint: CGPointMake(147.86, 615.54)];
    [text2Path addLineToPoint: CGPointMake(142.73, 639.64)];
    [text2Path addLineToPoint: CGPointMake(138.02, 639.64)];
    [text2Path addLineToPoint: CGPointMake(134.33, 621.4)];
    [text2Path addLineToPoint: CGPointMake(134.28, 621.4)];
    [text2Path addLineToPoint: CGPointMake(130.54, 639.64)];
    [text2Path addLineToPoint: CGPointMake(125.98, 639.64)];
    [text2Path addLineToPoint: CGPointMake(120.98, 615.54)];
    [text2Path addLineToPoint: CGPointMake(124.6, 615.64)];
    [text2Path moveToPoint: CGPointMake(156.94, 608.39)];
    [text2Path addCurveToPoint: CGPointMake(156.19, 610.36) controlPoint1: CGPointMake(156.94, 609.19) controlPoint2: CGPointMake(156.69, 609.85)];
    [text2Path addCurveToPoint: CGPointMake(154.39, 611.13) controlPoint1: CGPointMake(155.7, 610.87) controlPoint2: CGPointMake(155.1, 611.13)];
    [text2Path addCurveToPoint: CGPointMake(152.57, 610.36) controlPoint1: CGPointMake(153.66, 611.13) controlPoint2: CGPointMake(153.05, 610.87)];
    [text2Path addCurveToPoint: CGPointMake(151.85, 608.39) controlPoint1: CGPointMake(152.09, 609.85) controlPoint2: CGPointMake(151.85, 609.19)];
    [text2Path addCurveToPoint: CGPointMake(152.57, 606.45) controlPoint1: CGPointMake(151.85, 607.62) controlPoint2: CGPointMake(152.09, 606.98)];
    [text2Path addCurveToPoint: CGPointMake(154.39, 605.66) controlPoint1: CGPointMake(153.05, 605.92) controlPoint2: CGPointMake(153.66, 605.66)];
    [text2Path addCurveToPoint: CGPointMake(156.22, 606.45) controlPoint1: CGPointMake(155.13, 605.66) controlPoint2: CGPointMake(155.74, 605.92)];
    [text2Path addCurveToPoint: CGPointMake(156.94, 608.39) controlPoint1: CGPointMake(156.7, 606.98) controlPoint2: CGPointMake(156.94, 607.62)];
    [text2Path closePath];
    [text2Path moveToPoint: CGPointMake(152.33, 639.64)];
    [text2Path addLineToPoint: CGPointMake(152.33, 615.54)];
    [text2Path addLineToPoint: CGPointMake(156.41, 615.54)];
    [text2Path addLineToPoint: CGPointMake(156.41, 639.64)];
    [text2Path addLineToPoint: CGPointMake(152.33, 639.64)];
    [text2Path closePath];
    [text2Path moveToPoint: CGPointMake(167.64, 620.54)];
    [text2Path addCurveToPoint: CGPointMake(169.66, 616.12) controlPoint1: CGPointMake(168.06, 618.52) controlPoint2: CGPointMake(168.73, 617.05)];
    [text2Path addCurveToPoint: CGPointMake(172.87, 614.73) controlPoint1: CGPointMake(170.58, 615.19) controlPoint2: CGPointMake(171.66, 614.73)];
    [text2Path addCurveToPoint: CGPointMake(173.45, 614.78) controlPoint1: CGPointMake(173.13, 614.73) controlPoint2: CGPointMake(173.32, 614.74)];
    [text2Path addLineToPoint: CGPointMake(173.26, 619.05)];
    [text2Path addCurveToPoint: CGPointMake(172.87, 618.98) controlPoint1: CGPointMake(173.13, 619.02) controlPoint2: CGPointMake(173, 618.99)];
    [text2Path addCurveToPoint: CGPointMake(172.44, 618.95) controlPoint1: CGPointMake(172.74, 618.96) controlPoint2: CGPointMake(172.6, 618.95)];
    [text2Path addCurveToPoint: CGPointMake(170.4, 619.7) controlPoint1: CGPointMake(171.67, 618.95) controlPoint2: CGPointMake(170.99, 619.2)];
    [text2Path addCurveToPoint: CGPointMake(168.91, 621.64) controlPoint1: CGPointMake(169.81, 620.19) controlPoint2: CGPointMake(169.31, 620.84)];
    [text2Path addCurveToPoint: CGPointMake(168, 624.35) controlPoint1: CGPointMake(168.51, 622.44) controlPoint2: CGPointMake(168.21, 623.34)];
    [text2Path addCurveToPoint: CGPointMake(167.69, 627.45) controlPoint1: CGPointMake(167.79, 625.36) controlPoint2: CGPointMake(167.69, 626.39)];
    [text2Path addLineToPoint: CGPointMake(167.69, 639.64)];
    [text2Path addLineToPoint: CGPointMake(163.56, 639.64)];
    [text2Path addLineToPoint: CGPointMake(163.56, 621.64)];
    [text2Path addCurveToPoint: CGPointMake(163.51, 618.54) controlPoint1: CGPointMake(163.56, 620.68) controlPoint2: CGPointMake(163.54, 619.65)];
    [text2Path addCurveToPoint: CGPointMake(163.37, 615.54) controlPoint1: CGPointMake(163.48, 617.44) controlPoint2: CGPointMake(163.43, 616.44)];
    [text2Path addLineToPoint: CGPointMake(167.26, 615.54)];
    [text2Path addCurveToPoint: CGPointMake(167.47, 618.04) controlPoint1: CGPointMake(167.35, 616.34) controlPoint2: CGPointMake(167.42, 617.18)];
    [text2Path addCurveToPoint: CGPointMake(167.54, 620.54) controlPoint1: CGPointMake(167.52, 618.9) controlPoint2: CGPointMake(167.54, 619.74)];
    [text2Path addLineToPoint: CGPointMake(167.64, 620.54)];
    [text2Path closePath];
    [text2Path moveToPoint: CGPointMake(179.64, 628.65)];
    [text2Path addCurveToPoint: CGPointMake(179.95, 631.86) controlPoint1: CGPointMake(179.64, 629.8) controlPoint2: CGPointMake(179.74, 630.87)];
    [text2Path addCurveToPoint: CGPointMake(180.86, 634.46) controlPoint1: CGPointMake(180.16, 632.86) controlPoint2: CGPointMake(180.46, 633.72)];
    [text2Path addCurveToPoint: CGPointMake(182.38, 636.18) controlPoint1: CGPointMake(181.26, 635.19) controlPoint2: CGPointMake(181.77, 635.77)];
    [text2Path addCurveToPoint: CGPointMake(184.49, 636.81) controlPoint1: CGPointMake(182.98, 636.6) controlPoint2: CGPointMake(183.69, 636.81)];
    [text2Path addCurveToPoint: CGPointMake(187.08, 635.8) controlPoint1: CGPointMake(185.58, 636.81) controlPoint2: CGPointMake(186.44, 636.47)];
    [text2Path addCurveToPoint: CGPointMake(188.62, 633.4) controlPoint1: CGPointMake(187.72, 635.13) controlPoint2: CGPointMake(188.23, 634.33)];
    [text2Path addLineToPoint: CGPointMake(191.69, 635.18)];
    [text2Path addCurveToPoint: CGPointMake(188.93, 638.97) controlPoint1: CGPointMake(191.05, 636.71) controlPoint2: CGPointMake(190.13, 637.98)];
    [text2Path addCurveToPoint: CGPointMake(184.34, 640.46) controlPoint1: CGPointMake(187.73, 639.96) controlPoint2: CGPointMake(186.2, 640.46)];
    [text2Path addCurveToPoint: CGPointMake(177.86, 637.07) controlPoint1: CGPointMake(181.59, 640.46) controlPoint2: CGPointMake(179.43, 639.33)];
    [text2Path addCurveToPoint: CGPointMake(175.51, 627.64) controlPoint1: CGPointMake(176.3, 634.82) controlPoint2: CGPointMake(175.51, 631.67)];
    [text2Path addCurveToPoint: CGPointMake(176.14, 622.38) controlPoint1: CGPointMake(175.51, 625.72) controlPoint2: CGPointMake(175.72, 623.97)];
    [text2Path addCurveToPoint: CGPointMake(177.91, 618.3) controlPoint1: CGPointMake(176.55, 620.8) controlPoint2: CGPointMake(177.14, 619.44)];
    [text2Path addCurveToPoint: CGPointMake(180.7, 615.66) controlPoint1: CGPointMake(178.68, 617.17) controlPoint2: CGPointMake(179.61, 616.29)];
    [text2Path addCurveToPoint: CGPointMake(184.3, 614.73) controlPoint1: CGPointMake(181.78, 615.04) controlPoint2: CGPointMake(182.98, 614.73)];
    [text2Path addCurveToPoint: CGPointMake(188.04, 615.66) controlPoint1: CGPointMake(185.77, 614.73) controlPoint2: CGPointMake(187.02, 615.04)];
    [text2Path addCurveToPoint: CGPointMake(190.56, 618.21) controlPoint1: CGPointMake(189.06, 616.29) controlPoint2: CGPointMake(189.9, 617.14)];
    [text2Path addCurveToPoint: CGPointMake(191.98, 622) controlPoint1: CGPointMake(191.22, 619.28) controlPoint2: CGPointMake(191.69, 620.54)];
    [text2Path addCurveToPoint: CGPointMake(192.41, 626.68) controlPoint1: CGPointMake(192.26, 623.46) controlPoint2: CGPointMake(192.41, 625.02)];
    [text2Path addLineToPoint: CGPointMake(192.41, 628.65)];
    [text2Path addLineToPoint: CGPointMake(179.64, 628.65)];
    [text2Path closePath];
    [text2Path moveToPoint: CGPointMake(188.28, 625.34)];
    [text2Path addCurveToPoint: CGPointMake(187.3, 620.22) controlPoint1: CGPointMake(188.28, 623.22) controlPoint2: CGPointMake(187.95, 621.52)];
    [text2Path addCurveToPoint: CGPointMake(184.2, 618.28) controlPoint1: CGPointMake(186.64, 618.93) controlPoint2: CGPointMake(185.61, 618.28)];
    [text2Path addCurveToPoint: CGPointMake(182.11, 619.02) controlPoint1: CGPointMake(183.37, 618.28) controlPoint2: CGPointMake(182.67, 618.53)];
    [text2Path addCurveToPoint: CGPointMake(180.74, 620.85) controlPoint1: CGPointMake(181.55, 619.52) controlPoint2: CGPointMake(181.1, 620.13)];
    [text2Path addCurveToPoint: CGPointMake(179.98, 623.15) controlPoint1: CGPointMake(180.39, 621.57) controlPoint2: CGPointMake(180.14, 622.34)];
    [text2Path addCurveToPoint: CGPointMake(179.74, 625.34) controlPoint1: CGPointMake(179.82, 623.97) controlPoint2: CGPointMake(179.74, 624.7)];
    [text2Path addLineToPoint: CGPointMake(188.28, 625.34)];
    [text2Path closePath];
    [text2Path moveToPoint: CGPointMake(215.64, 639.59)];
    [text2Path addCurveToPoint: CGPointMake(214.25, 640.07) controlPoint1: CGPointMake(215.29, 639.78) controlPoint2: CGPointMake(214.82, 639.94)];
    [text2Path addCurveToPoint: CGPointMake(212.52, 640.26) controlPoint1: CGPointMake(213.67, 640.2) controlPoint2: CGPointMake(213.1, 640.26)];
    [text2Path addCurveToPoint: CGPointMake(208.56, 638.49) controlPoint1: CGPointMake(210.66, 640.26) controlPoint2: CGPointMake(209.34, 639.67)];
    [text2Path addCurveToPoint: CGPointMake(207.38, 633.54) controlPoint1: CGPointMake(207.78, 637.3) controlPoint2: CGPointMake(207.38, 635.66)];
    [text2Path addLineToPoint: CGPointMake(207.38, 618.86)];
    [text2Path addLineToPoint: CGPointMake(204.31, 618.86)];
    [text2Path addLineToPoint: CGPointMake(204.31, 615.54)];
    [text2Path addLineToPoint: CGPointMake(207.34, 615.54)];
    [text2Path addLineToPoint: CGPointMake(207.34, 609.11)];
    [text2Path addLineToPoint: CGPointMake(211.32, 609.11)];
    [text2Path addLineToPoint: CGPointMake(211.32, 615.54)];
    [text2Path addLineToPoint: CGPointMake(215.59, 615.54)];
    [text2Path addLineToPoint: CGPointMake(215.59, 618.86)];
    [text2Path addLineToPoint: CGPointMake(211.32, 618.86)];
    [text2Path addLineToPoint: CGPointMake(211.32, 632.73)];
    [text2Path addCurveToPoint: CGPointMake(211.94, 635.78) controlPoint1: CGPointMake(211.32, 634.14) controlPoint2: CGPointMake(211.53, 635.15)];
    [text2Path addCurveToPoint: CGPointMake(213.82, 636.71) controlPoint1: CGPointMake(212.36, 636.4) controlPoint2: CGPointMake(212.98, 636.71)];
    [text2Path addCurveToPoint: CGPointMake(214.73, 636.59) controlPoint1: CGPointMake(214.1, 636.71) controlPoint2: CGPointMake(214.41, 636.67)];
    [text2Path addCurveToPoint: CGPointMake(215.54, 636.33) controlPoint1: CGPointMake(215.05, 636.51) controlPoint2: CGPointMake(215.32, 636.42)];
    [text2Path addLineToPoint: CGPointMake(215.64, 639.59)];
    [text2Path closePath];
    [text2Path moveToPoint: CGPointMake(232.09, 639.64)];
    [text2Path addCurveToPoint: CGPointMake(231.8, 637.43) controlPoint1: CGPointMake(231.96, 638.9) controlPoint2: CGPointMake(231.86, 638.17)];
    [text2Path addCurveToPoint: CGPointMake(231.7, 635.66) controlPoint1: CGPointMake(231.74, 636.7) controlPoint2: CGPointMake(231.7, 636.1)];
    [text2Path addLineToPoint: CGPointMake(231.61, 635.66)];
    [text2Path addCurveToPoint: CGPointMake(229.71, 639.04) controlPoint1: CGPointMake(231.26, 637.1) controlPoint2: CGPointMake(230.62, 638.22)];
    [text2Path addCurveToPoint: CGPointMake(225.94, 640.26) controlPoint1: CGPointMake(228.8, 639.86) controlPoint2: CGPointMake(227.54, 640.26)];
    [text2Path addCurveToPoint: CGPointMake(223.88, 639.88) controlPoint1: CGPointMake(225.27, 640.26) controlPoint2: CGPointMake(224.58, 640.14)];
    [text2Path addCurveToPoint: CGPointMake(221.98, 638.63) controlPoint1: CGPointMake(223.18, 639.62) controlPoint2: CGPointMake(222.54, 639.21)];
    [text2Path addCurveToPoint: CGPointMake(220.59, 636.42) controlPoint1: CGPointMake(221.42, 638.06) controlPoint2: CGPointMake(220.96, 637.32)];
    [text2Path addCurveToPoint: CGPointMake(220.04, 633.11) controlPoint1: CGPointMake(220.22, 635.53) controlPoint2: CGPointMake(220.04, 634.42)];
    [text2Path addCurveToPoint: CGPointMake(220.98, 628.86) controlPoint1: CGPointMake(220.04, 631.38) controlPoint2: CGPointMake(220.35, 629.97)];
    [text2Path addCurveToPoint: CGPointMake(223.33, 626.27) controlPoint1: CGPointMake(221.6, 627.76) controlPoint2: CGPointMake(222.38, 626.9)];
    [text2Path addCurveToPoint: CGPointMake(226.47, 625) controlPoint1: CGPointMake(224.27, 625.65) controlPoint2: CGPointMake(225.32, 625.22)];
    [text2Path addCurveToPoint: CGPointMake(229.78, 624.66) controlPoint1: CGPointMake(227.62, 624.78) controlPoint2: CGPointMake(228.73, 624.66)];
    [text2Path addLineToPoint: CGPointMake(231.37, 624.66)];
    [text2Path addLineToPoint: CGPointMake(231.37, 623.61)];
    [text2Path addCurveToPoint: CGPointMake(230.29, 619.5) controlPoint1: CGPointMake(231.37, 621.72) controlPoint2: CGPointMake(231.01, 620.35)];
    [text2Path addCurveToPoint: CGPointMake(227.38, 618.23) controlPoint1: CGPointMake(229.57, 618.66) controlPoint2: CGPointMake(228.6, 618.23)];
    [text2Path addCurveToPoint: CGPointMake(224.89, 618.9) controlPoint1: CGPointMake(226.49, 618.23) controlPoint2: CGPointMake(225.66, 618.46)];
    [text2Path addCurveToPoint: CGPointMake(222.92, 620.68) controlPoint1: CGPointMake(224.12, 619.35) controlPoint2: CGPointMake(223.46, 619.94)];
    [text2Path addLineToPoint: CGPointMake(220.86, 618.14)];
    [text2Path addCurveToPoint: CGPointMake(223.98, 615.62) controlPoint1: CGPointMake(221.66, 617.05) controlPoint2: CGPointMake(222.7, 616.21)];
    [text2Path addCurveToPoint: CGPointMake(227.77, 614.73) controlPoint1: CGPointMake(225.26, 615.02) controlPoint2: CGPointMake(226.52, 614.73)];
    [text2Path addCurveToPoint: CGPointMake(231.25, 615.4) controlPoint1: CGPointMake(229.14, 614.73) controlPoint2: CGPointMake(230.3, 614.95)];
    [text2Path addCurveToPoint: CGPointMake(233.53, 617.37) controlPoint1: CGPointMake(232.19, 615.85) controlPoint2: CGPointMake(232.95, 616.5)];
    [text2Path addCurveToPoint: CGPointMake(234.75, 620.56) controlPoint1: CGPointMake(234.1, 618.23) controlPoint2: CGPointMake(234.51, 619.3)];
    [text2Path addCurveToPoint: CGPointMake(235.11, 624.86) controlPoint1: CGPointMake(234.99, 621.82) controlPoint2: CGPointMake(235.11, 623.26)];
    [text2Path addLineToPoint: CGPointMake(235.11, 634.6)];
    [text2Path addCurveToPoint: CGPointMake(235.21, 637.31) controlPoint1: CGPointMake(235.11, 635.43) controlPoint2: CGPointMake(235.14, 636.34)];
    [text2Path addCurveToPoint: CGPointMake(235.45, 639.64) controlPoint1: CGPointMake(235.27, 638.29) controlPoint2: CGPointMake(235.35, 639.06)];
    [text2Path addLineToPoint: CGPointMake(232.09, 639.64)];
    [text2Path closePath];
    [text2Path moveToPoint: CGPointMake(231.46, 627.78)];
    [text2Path addLineToPoint: CGPointMake(229.69, 627.78)];
    [text2Path addCurveToPoint: CGPointMake(227.55, 627.98) controlPoint1: CGPointMake(228.95, 627.78) controlPoint2: CGPointMake(228.24, 627.85)];
    [text2Path addCurveToPoint: CGPointMake(225.7, 628.72) controlPoint1: CGPointMake(226.86, 628.1) controlPoint2: CGPointMake(226.25, 628.35)];
    [text2Path addCurveToPoint: CGPointMake(224.38, 630.23) controlPoint1: CGPointMake(225.16, 629.09) controlPoint2: CGPointMake(224.72, 629.59)];
    [text2Path addCurveToPoint: CGPointMake(223.88, 632.68) controlPoint1: CGPointMake(224.05, 630.87) controlPoint2: CGPointMake(223.88, 631.69)];
    [text2Path addCurveToPoint: CGPointMake(224.84, 635.92) controlPoint1: CGPointMake(223.88, 634.15) controlPoint2: CGPointMake(224.2, 635.23)];
    [text2Path addCurveToPoint: CGPointMake(227.05, 636.95) controlPoint1: CGPointMake(225.48, 636.61) controlPoint2: CGPointMake(226.22, 636.95)];
    [text2Path addCurveToPoint: CGPointMake(229.14, 636.21) controlPoint1: CGPointMake(227.88, 636.95) controlPoint2: CGPointMake(228.58, 636.7)];
    [text2Path addCurveToPoint: CGPointMake(230.5, 634.31) controlPoint1: CGPointMake(229.7, 635.71) controlPoint2: CGPointMake(230.15, 635.08)];
    [text2Path addCurveToPoint: CGPointMake(231.25, 631.79) controlPoint1: CGPointMake(230.86, 633.54) controlPoint2: CGPointMake(231.1, 632.7)];
    [text2Path addCurveToPoint: CGPointMake(231.46, 629.18) controlPoint1: CGPointMake(231.39, 630.88) controlPoint2: CGPointMake(231.46, 630.01)];
    [text2Path addLineToPoint: CGPointMake(231.46, 627.78)];
    [text2Path closePath];
    [text2Path moveToPoint: CGPointMake(243.62, 615.54)];
    [text2Path addLineToPoint: CGPointMake(243.62, 619.29)];
    [text2Path addLineToPoint: CGPointMake(243.72, 619.29)];
    [text2Path addCurveToPoint: CGPointMake(245.57, 616.02) controlPoint1: CGPointMake(244.1, 617.98) controlPoint2: CGPointMake(244.72, 616.89)];
    [text2Path addCurveToPoint: CGPointMake(249.34, 614.73) controlPoint1: CGPointMake(246.42, 615.16) controlPoint2: CGPointMake(247.67, 614.73)];
    [text2Path addCurveToPoint: CGPointMake(252.6, 615.71) controlPoint1: CGPointMake(250.55, 614.73) controlPoint2: CGPointMake(251.64, 615.06)];
    [text2Path addCurveToPoint: CGPointMake(255.02, 618.42) controlPoint1: CGPointMake(253.56, 616.37) controlPoint2: CGPointMake(254.37, 617.27)];
    [text2Path addCurveToPoint: CGPointMake(256.51, 622.53) controlPoint1: CGPointMake(255.68, 619.58) controlPoint2: CGPointMake(256.18, 620.94)];
    [text2Path addCurveToPoint: CGPointMake(257.02, 627.69) controlPoint1: CGPointMake(256.85, 624.11) controlPoint2: CGPointMake(257.02, 625.83)];
    [text2Path addCurveToPoint: CGPointMake(256.54, 632.82) controlPoint1: CGPointMake(257.02, 629.54) controlPoint2: CGPointMake(256.86, 631.26)];
    [text2Path addCurveToPoint: CGPointMake(255.07, 636.86) controlPoint1: CGPointMake(256.22, 634.39) controlPoint2: CGPointMake(255.73, 635.74)];
    [text2Path addCurveToPoint: CGPointMake(252.65, 639.5) controlPoint1: CGPointMake(254.42, 637.98) controlPoint2: CGPointMake(253.61, 638.86)];
    [text2Path addCurveToPoint: CGPointMake(249.34, 640.46) controlPoint1: CGPointMake(251.69, 640.14) controlPoint2: CGPointMake(250.58, 640.46)];
    [text2Path addCurveToPoint: CGPointMake(245.78, 639.23) controlPoint1: CGPointMake(247.93, 640.46) controlPoint2: CGPointMake(246.74, 640.05)];
    [text2Path addCurveToPoint: CGPointMake(243.82, 636.14) controlPoint1: CGPointMake(244.82, 638.42) controlPoint2: CGPointMake(244.17, 637.38)];
    [text2Path addLineToPoint: CGPointMake(243.72, 636.14)];
    [text2Path addLineToPoint: CGPointMake(243.72, 651.16)];
    [text2Path addLineToPoint: CGPointMake(239.64, 651.16)];
    [text2Path addLineToPoint: CGPointMake(239.64, 615.54)];
    [text2Path addLineToPoint: CGPointMake(243.62, 615.54)];
    [text2Path closePath];
    [text2Path moveToPoint: CGPointMake(243.62, 627.54)];
    [text2Path addCurveToPoint: CGPointMake(243.91, 631.22) controlPoint1: CGPointMake(243.62, 628.86) controlPoint2: CGPointMake(243.72, 630.08)];
    [text2Path addCurveToPoint: CGPointMake(244.8, 634.17) controlPoint1: CGPointMake(244.1, 632.35) controlPoint2: CGPointMake(244.4, 633.34)];
    [text2Path addCurveToPoint: CGPointMake(246.26, 636.14) controlPoint1: CGPointMake(245.2, 635) controlPoint2: CGPointMake(245.69, 635.66)];
    [text2Path addCurveToPoint: CGPointMake(248.28, 636.86) controlPoint1: CGPointMake(246.84, 636.62) controlPoint2: CGPointMake(247.51, 636.86)];
    [text2Path addCurveToPoint: CGPointMake(250.32, 636.14) controlPoint1: CGPointMake(249.08, 636.86) controlPoint2: CGPointMake(249.76, 636.62)];
    [text2Path addCurveToPoint: CGPointMake(251.71, 634.17) controlPoint1: CGPointMake(250.88, 635.66) controlPoint2: CGPointMake(251.34, 635)];
    [text2Path addCurveToPoint: CGPointMake(252.53, 631.22) controlPoint1: CGPointMake(252.08, 633.34) controlPoint2: CGPointMake(252.35, 632.35)];
    [text2Path addCurveToPoint: CGPointMake(252.79, 627.54) controlPoint1: CGPointMake(252.7, 630.08) controlPoint2: CGPointMake(252.79, 628.86)];
    [text2Path addCurveToPoint: CGPointMake(252.53, 623.92) controlPoint1: CGPointMake(252.79, 626.26) controlPoint2: CGPointMake(252.7, 625.06)];
    [text2Path addCurveToPoint: CGPointMake(251.71, 620.97) controlPoint1: CGPointMake(252.35, 622.78) controlPoint2: CGPointMake(252.08, 621.8)];
    [text2Path addCurveToPoint: CGPointMake(250.32, 619) controlPoint1: CGPointMake(251.34, 620.14) controlPoint2: CGPointMake(250.88, 619.48)];
    [text2Path addCurveToPoint: CGPointMake(248.28, 618.28) controlPoint1: CGPointMake(249.76, 618.52) controlPoint2: CGPointMake(249.08, 618.28)];
    [text2Path addCurveToPoint: CGPointMake(246.24, 619) controlPoint1: CGPointMake(247.51, 618.28) controlPoint2: CGPointMake(246.83, 618.52)];
    [text2Path addCurveToPoint: CGPointMake(244.78, 620.97) controlPoint1: CGPointMake(245.65, 619.48) controlPoint2: CGPointMake(245.16, 620.14)];
    [text2Path addCurveToPoint: CGPointMake(243.91, 623.92) controlPoint1: CGPointMake(244.39, 621.8) controlPoint2: CGPointMake(244.1, 622.78)];
    [text2Path addCurveToPoint: CGPointMake(243.62, 627.54) controlPoint1: CGPointMake(243.72, 625.06) controlPoint2: CGPointMake(243.62, 626.26)];
    [text2Path closePath];
    [color setFill];
    [text2Path fill];


    //// Oval 6 Drawing
    UIBezierPath* oval6Path = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(160.66, -186.47, 54, 54)];
    [color setFill];
    [oval6Path fill];


    //// Oval 8 Drawing
    UIBezierPath* oval8Path = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(169.24, -178.72, 36.52, 36.52)];
    [UIColor.redColor setFill];
    [oval8Path fill];


    //// Bezier Drawing
    UIBezierPath* bezierPath = UIBezierPath.bezierPath;
    [bezierPath moveToPoint: CGPointMake(0, -0.44)];
    [bezierPath addLineToPoint: CGPointMake(65, -0.44)];
    [bezierPath addCurveToPoint: CGPointMake(188, 96.06) controlPoint1: CGPointMake(65, -0.44) controlPoint2: CGPointMake(91, 96.56)];
    [bezierPath addCurveToPoint: CGPointMake(311, -0.44) controlPoint1: CGPointMake(285, 95.56) controlPoint2: CGPointMake(311, -0.44)];
    [bezierPath addLineToPoint: CGPointMake(375, -0.44)];
    [bezierPath addLineToPoint: CGPointMake(375, 666.56)];
    [bezierPath addLineToPoint: CGPointMake(311, 666.56)];
    [bezierPath addCurveToPoint: CGPointMake(188, 666.56) controlPoint1: CGPointMake(311, 666.56) controlPoint2: CGPointMake(281, 666.56)];
    [bezierPath addCurveToPoint: CGPointMake(71, 664.56) controlPoint1: CGPointMake(95, 666.56) controlPoint2: CGPointMake(71, 664.56)];
    [bezierPath addLineToPoint: CGPointMake(0, 666.56)];
    [bezierPath addLineToPoint: CGPointMake(0, -0.44)];
    [black setFill];
    [bezierPath fill];


    //// Oval 2 Drawing
    UIBezierPath* oval2Path = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(62, 204.08, 256, 256)];
    [red setFill];
    [oval2Path fill];


    //// Oval 7 Drawing
    UIBezierPath* oval7Path = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(72, 214.08, 236, 236)];
    [red setFill];
    [oval7Path fill];
    [UIColor.blackColor setStroke];
    oval7Path.lineWidth = 10;
    [oval7Path stroke];


    //// Group
    {
        //// Rectangle 8 Drawing
        UIBezierPath* rectangle8Path = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(170, 287.06, 40, 71.99) cornerRadius: 20];
        [black setFill];
        [rectangle8Path fill];


        //// Rectangle 9 Drawing
        UIBezierPath* rectangle9Path = UIBezierPath.bezierPath;
        [rectangle9Path moveToPoint: CGPointMake(190.5, 340.55)];
        [rectangle9Path addCurveToPoint: CGPointMake(214.42, 331.55) controlPoint1: CGPointMake(190.5, 340.55) controlPoint2: CGPointMake(214.47, 327.4)];
        [rectangle9Path addCurveToPoint: CGPointMake(213, 349.05) controlPoint1: CGPointMake(214.38, 335.7) controlPoint2: CGPointMake(215, 344.05)];
        [rectangle9Path addCurveToPoint: CGPointMake(193.46, 363.64) controlPoint1: CGPointMake(209.84, 355.05) controlPoint2: CGPointMake(204.46, 362.64)];
        [rectangle9Path addLineToPoint: CGPointMake(188.75, 363.64)];
        [rectangle9Path addCurveToPoint: CGPointMake(166.92, 348.01) controlPoint1: CGPointMake(178.98, 363.64) controlPoint2: CGPointMake(170.26, 357.4)];
        [rectangle9Path addCurveToPoint: CGPointMake(165.56, 331.05) controlPoint1: CGPointMake(165.05, 341.97) controlPoint2: CGPointMake(165.6, 334.89)];
        [rectangle9Path addCurveToPoint: CGPointMake(190.5, 340.55) controlPoint1: CGPointMake(165.52, 327.21) controlPoint2: CGPointMake(190.5, 340.55)];
        [rectangle9Path closePath];
        [black setStroke];
        rectangle9Path.lineWidth = 5;
        [rectangle9Path stroke];


        //// Rectangle 13 Drawing
        UIBezierPath* rectangle13Path = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(170, 373.05, 40, 6) cornerRadius: 2];
        [black setFill];
        [rectangle13Path fill];


        //// Rectangle 14 Drawing
        UIBezierPath* rectangle14Path = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(187, 362.05, 6, 15) cornerRadius: 3];
        [black setFill];
        [rectangle14Path fill];
    }


    //// Rectangle 5 Drawing
    UIBezierPath* rectangle5Path = UIBezierPath.bezierPath;
    [rectangle5Path moveToPoint: CGPointMake(0, 1658.66)];
    [rectangle5Path addLineToPoint: CGPointMake(375, 1658.66)];
    [rectangle5Path addLineToPoint: CGPointMake(375, 991.66)];
    [rectangle5Path addLineToPoint: CGPointMake(311.5, 991.66)];
    [rectangle5Path addCurveToPoint: CGPointMake(189.5, 1143.66) controlPoint1: CGPointMake(311.5, 991.66) controlPoint2: CGPointMake(322.5, 1142.66)];
    [rectangle5Path addCurveToPoint: CGPointMake(65.5, 991.66) controlPoint1: CGPointMake(56.5, 1144.66) controlPoint2: CGPointMake(65.5, 991.66)];
    [rectangle5Path addLineToPoint: CGPointMake(0, 991.66)];
    [rectangle5Path addLineToPoint: CGPointMake(0, 1658.66)];
    [rectangle5Path closePath];
    [black setFill];
    [rectangle5Path fill];
    [UIColor.whiteColor setStroke];
    rectangle5Path.lineWidth = 1;
    [rectangle5Path stroke];


    //// Oval 9 Drawing
    CGContextSaveGState(context);
    CGContextTranslateCTM(context, -75.27, 876.42);
    CGContextScaleCTM(context, 0.5, 0.5);

    UIBezierPath* oval9Path = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(0, 0, 150, 150)];
    [color setFill];
    [oval9Path fill];

    CGContextRestoreGState(context);


    //// Rectangle Drawing
    UIBezierPath* rectanglePath = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(180, 905.16, 20, 3) cornerRadius: 1.5];
    [black setFill];
    [rectanglePath fill];


    //// Rectangle 6 Drawing
    UIBezierPath* rectangle6Path = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(177, 910.16, 26, 3) cornerRadius: 1.5];
    [black setFill];
    [rectangle6Path fill];


    //// Rectangle 7 Drawing
    UIBezierPath* rectangle7Path = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(180, 915.16, 20, 3) cornerRadius: 1.5];
    [black setFill];
    [rectangle7Path fill];


    //// Path-1 Drawing
    CGContextSaveGState(context);
    CGContextTranslateCTM(context, 139.54, 570.28);
    CGContextRotateCTM(context, 33.31 * M_PI / 180);

    UIBezierPath* path1Path = UIBezierPath.bezierPath;
    [path1Path moveToPoint: CGPointMake(89.57, 10.83)];
    [path1Path addCurveToPoint: CGPointMake(100.21, 21.49) controlPoint1: CGPointMake(93, 14.28) controlPoint2: CGPointMake(100.21, 21.49)];
    [path1Path addCurveToPoint: CGPointMake(96.4, 39.13) controlPoint1: CGPointMake(100.21, 21.49) controlPoint2: CGPointMake(92.65, 31.8)];
    [path1Path addCurveToPoint: CGPointMake(111.14, 48.09) controlPoint1: CGPointMake(100.15, 46.46) controlPoint2: CGPointMake(111.14, 48.09)];
    [path1Path addLineToPoint: CGPointMake(111.15, 63.11)];
    [path1Path addCurveToPoint: CGPointMake(96.4, 71.74) controlPoint1: CGPointMake(111.15, 63.11) controlPoint2: CGPointMake(99.85, 64.78)];
    [path1Path addCurveToPoint: CGPointMake(100.15, 89.49) controlPoint1: CGPointMake(92.53, 79.55) controlPoint2: CGPointMake(100.15, 89.49)];
    [path1Path addLineToPoint: CGPointMake(89.57, 100.07)];
    [path1Path addCurveToPoint: CGPointMake(71.71, 96.14) controlPoint1: CGPointMake(89.57, 100.07) controlPoint2: CGPointMake(78.02, 93.31)];
    [path1Path addCurveToPoint: CGPointMake(64.03, 111.09) controlPoint1: CGPointMake(65.4, 98.98) controlPoint2: CGPointMake(64.03, 111.09)];
    [path1Path addLineToPoint: CGPointMake(47.99, 111.09)];
    [path1Path addCurveToPoint: CGPointMake(38.48, 96.14) controlPoint1: CGPointMake(47.99, 111.09) controlPoint2: CGPointMake(46.26, 99.1)];
    [path1Path addCurveToPoint: CGPointMake(21.67, 100.15) controlPoint1: CGPointMake(30.69, 93.19) controlPoint2: CGPointMake(21.67, 100.15)];
    [path1Path addLineToPoint: CGPointMake(10.92, 89.53)];
    [path1Path addCurveToPoint: CGPointMake(14.54, 71.74) controlPoint1: CGPointMake(10.92, 89.53) controlPoint2: CGPointMake(18.55, 79.27)];
    [path1Path addCurveToPoint: CGPointMake(0.02, 63.14) controlPoint1: CGPointMake(10.53, 64.21) controlPoint2: CGPointMake(0.02, 63.14)];
    [path1Path addLineToPoint: CGPointMake(0, 47.94)];
    [path1Path addCurveToPoint: CGPointMake(14.94, 38.68) controlPoint1: CGPointMake(0, 47.94) controlPoint2: CGPointMake(12, 46.41)];
    [path1Path addCurveToPoint: CGPointMake(10.93, 21.56) controlPoint1: CGPointMake(17.87, 30.96) controlPoint2: CGPointMake(10.93, 21.56)];
    [path1Path addLineToPoint: CGPointMake(21.44, 10.83)];
    [path1Path addCurveToPoint: CGPointMake(39.18, 14.66) controlPoint1: CGPointMake(21.44, 10.83) controlPoint2: CGPointMake(31.31, 18.29)];
    [path1Path addCurveToPoint: CGPointMake(47.97, 0) controlPoint1: CGPointMake(47.06, 11.03) controlPoint2: CGPointMake(47.97, 0)];
    [path1Path addLineToPoint: CGPointMake(63.14, 0)];
    [path1Path addCurveToPoint: CGPointMake(71.71, 14.66) controlPoint1: CGPointMake(63.14, 0) controlPoint2: CGPointMake(64.88, 11.28)];
    [path1Path addCurveToPoint: CGPointMake(89.57, 10.83) controlPoint1: CGPointMake(78.54, 18.05) controlPoint2: CGPointMake(89.49, 10.75)];
    [path1Path closePath];
    [path1Path moveToPoint: CGPointMake(55.77, 86.47)];
    [path1Path addCurveToPoint: CGPointMake(86.91, 55.33) controlPoint1: CGPointMake(72.97, 86.47) controlPoint2: CGPointMake(86.91, 72.53)];
    [path1Path addCurveToPoint: CGPointMake(55.77, 24.2) controlPoint1: CGPointMake(86.91, 38.14) controlPoint2: CGPointMake(72.97, 24.2)];
    [path1Path addCurveToPoint: CGPointMake(24.62, 55.33) controlPoint1: CGPointMake(38.56, 24.2) controlPoint2: CGPointMake(24.62, 38.14)];
    [path1Path addCurveToPoint: CGPointMake(55.77, 86.47) controlPoint1: CGPointMake(24.62, 72.53) controlPoint2: CGPointMake(38.56, 86.47)];
    [path1Path closePath];
    [path1Path moveToPoint: CGPointMake(55.55, 74.71)];
    [path1Path addCurveToPoint: CGPointMake(74.72, 55.55) controlPoint1: CGPointMake(66.13, 74.71) controlPoint2: CGPointMake(74.72, 66.14)];
    [path1Path addCurveToPoint: CGPointMake(55.55, 36.39) controlPoint1: CGPointMake(74.72, 44.97) controlPoint2: CGPointMake(66.13, 36.39)];
    [path1Path addCurveToPoint: CGPointMake(36.38, 55.55) controlPoint1: CGPointMake(44.96, 36.39) controlPoint2: CGPointMake(36.38, 44.97)];
    [path1Path addCurveToPoint: CGPointMake(55.55, 74.71) controlPoint1: CGPointMake(36.38, 66.14) controlPoint2: CGPointMake(44.96, 74.71)];
    [path1Path closePath];
    path1Path.miterLimit = 4;

    path1Path.usesEvenOddFillRule = YES;

    [color setFill];
    [path1Path fill];

    CGContextRestoreGState(context);


    //// Path- Drawing
    CGContextSaveGState(context);
    CGContextTranslateCTM(context, 237.55, 596.03);
    CGContextRotateCTM(context, 33.03 * M_PI / 180);

    UIBezierPath* pathPath = UIBezierPath.bezierPath;
    [pathPath moveToPoint: CGPointMake(59.75, 7.13)];
    [pathPath addCurveToPoint: CGPointMake(66.86, 14.14) controlPoint1: CGPointMake(62.04, 9.39) controlPoint2: CGPointMake(66.86, 14.14)];
    [pathPath addCurveToPoint: CGPointMake(64.31, 25.74) controlPoint1: CGPointMake(66.86, 14.14) controlPoint2: CGPointMake(61.81, 20.92)];
    [pathPath addCurveToPoint: CGPointMake(74.15, 31.64) controlPoint1: CGPointMake(66.81, 30.57) controlPoint2: CGPointMake(74.15, 31.64)];
    [pathPath addLineToPoint: CGPointMake(74.15, 41.52)];
    [pathPath addCurveToPoint: CGPointMake(64.31, 47.2) controlPoint1: CGPointMake(74.15, 41.52) controlPoint2: CGPointMake(66.62, 42.62)];
    [pathPath addCurveToPoint: CGPointMake(66.81, 58.88) controlPoint1: CGPointMake(61.73, 52.34) controlPoint2: CGPointMake(66.81, 58.88)];
    [pathPath addLineToPoint: CGPointMake(59.75, 65.84)];
    [pathPath addCurveToPoint: CGPointMake(47.84, 63.26) controlPoint1: CGPointMake(59.75, 65.84) controlPoint2: CGPointMake(52.05, 61.39)];
    [pathPath addCurveToPoint: CGPointMake(42.71, 73.09) controlPoint1: CGPointMake(43.63, 65.12) controlPoint2: CGPointMake(42.71, 73.09)];
    [pathPath addLineToPoint: CGPointMake(32.02, 73.09)];
    [pathPath addCurveToPoint: CGPointMake(25.67, 63.26) controlPoint1: CGPointMake(32.02, 73.09) controlPoint2: CGPointMake(30.86, 65.2)];
    [pathPath addCurveToPoint: CGPointMake(14.46, 65.89) controlPoint1: CGPointMake(20.47, 61.31) controlPoint2: CGPointMake(14.46, 65.89)];
    [pathPath addLineToPoint: CGPointMake(7.28, 58.9)];
    [pathPath addCurveToPoint: CGPointMake(9.7, 47.2) controlPoint1: CGPointMake(7.28, 58.9) controlPoint2: CGPointMake(12.37, 52.16)];
    [pathPath addCurveToPoint: CGPointMake(0.01, 41.54) controlPoint1: CGPointMake(7.02, 42.25) controlPoint2: CGPointMake(0.01, 41.54)];
    [pathPath addLineToPoint: CGPointMake(0, 31.54)];
    [pathPath addCurveToPoint: CGPointMake(9.96, 25.45) controlPoint1: CGPointMake(0, 31.54) controlPoint2: CGPointMake(8.01, 30.53)];
    [pathPath addCurveToPoint: CGPointMake(7.29, 14.18) controlPoint1: CGPointMake(11.92, 20.37) controlPoint2: CGPointMake(7.29, 14.18)];
    [pathPath addLineToPoint: CGPointMake(14.31, 7.13)];
    [pathPath addCurveToPoint: CGPointMake(26.14, 9.65) controlPoint1: CGPointMake(14.31, 7.13) controlPoint2: CGPointMake(20.89, 12.03)];
    [pathPath addCurveToPoint: CGPointMake(32, 0) controlPoint1: CGPointMake(31.39, 7.26) controlPoint2: CGPointMake(32, 0)];
    [pathPath addLineToPoint: CGPointMake(42.12, 0)];
    [pathPath addCurveToPoint: CGPointMake(47.84, 9.65) controlPoint1: CGPointMake(42.12, 0) controlPoint2: CGPointMake(43.28, 7.42)];
    [pathPath addCurveToPoint: CGPointMake(59.75, 7.13) controlPoint1: CGPointMake(52.39, 11.87) controlPoint2: CGPointMake(59.7, 7.08)];
    [pathPath closePath];
    [pathPath moveToPoint: CGPointMake(37.2, 56.89)];
    [pathPath addCurveToPoint: CGPointMake(57.98, 36.41) controlPoint1: CGPointMake(48.68, 56.89) controlPoint2: CGPointMake(57.98, 47.72)];
    [pathPath addCurveToPoint: CGPointMake(37.2, 15.92) controlPoint1: CGPointMake(57.98, 25.09) controlPoint2: CGPointMake(48.68, 15.92)];
    [pathPath addCurveToPoint: CGPointMake(16.42, 36.41) controlPoint1: CGPointMake(25.73, 15.92) controlPoint2: CGPointMake(16.42, 25.09)];
    [pathPath addCurveToPoint: CGPointMake(37.2, 56.89) controlPoint1: CGPointMake(16.42, 47.72) controlPoint2: CGPointMake(25.73, 56.89)];
    [pathPath closePath];
    [pathPath moveToPoint: CGPointMake(37.06, 49.16)];
    [pathPath addCurveToPoint: CGPointMake(49.84, 36.55) controlPoint1: CGPointMake(44.12, 49.16) controlPoint2: CGPointMake(49.84, 43.51)];
    [pathPath addCurveToPoint: CGPointMake(37.06, 23.94) controlPoint1: CGPointMake(49.84, 29.59) controlPoint2: CGPointMake(44.12, 23.94)];
    [pathPath addCurveToPoint: CGPointMake(24.27, 36.55) controlPoint1: CGPointMake(30, 23.94) controlPoint2: CGPointMake(24.27, 29.59)];
    [pathPath addCurveToPoint: CGPointMake(37.06, 49.16) controlPoint1: CGPointMake(24.27, 43.51) controlPoint2: CGPointMake(30, 49.16)];
    [pathPath closePath];
    pathPath.miterLimit = 4;

    pathPath.usesEvenOddFillRule = YES;

    [color setFill];
    [pathPath fill];

    CGContextRestoreGState(context);


    //// Oval Drawing
    UIBezierPath* ovalPath = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(62, 569.28, 256, 256)];
    [color setStroke];
    ovalPath.lineWidth = 6;
    [ovalPath stroke];


    //// Rectangle 3 Drawing
    UIBezierPath* rectangle3Path = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(177.5, 556.24, 25, 25) cornerRadius: 10];
    [UIColor.blackColor setFill];
    [rectangle3Path fill];
    [color setStroke];
    rectangle3Path.lineWidth = 6;
    [rectangle3Path stroke];


    //// Rectangle 11 Drawing
    CGContextSaveGState(context);
    CGContextTranslateCTM(context, 187.58, 569.74);
    CGContextRotateCTM(context, -35 * M_PI / 180);

    UIBezierPath* rectangle11Path = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(-4.37, -1.53, 8.74, 3.05) cornerRadius: 1.53];
    [color setFill];
    [rectangle11Path fill];

    CGContextRestoreGState(context);


    //// Rectangle 12 Drawing
    CGContextSaveGState(context);
    CGContextTranslateCTM(context, 192.41, 568.74);
    CGContextRotateCTM(context, 35 * M_PI / 180);

    UIBezierPath* rectangle12Path = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(-4.37, -1.53, 8.74, 3.05) cornerRadius: 1.53];
    [color setFill];
    [rectangle12Path fill];

    CGContextRestoreGState(context);


    //// Bezier 9 Drawing
    UIBezierPath* bezier9Path = UIBezierPath.bezierPath;
    [bezier9Path moveToPoint: CGPointMake(197.36, 88.48)];
    [bezier9Path addCurveToPoint: CGPointMake(196.9, 91.09) controlPoint1: CGPointMake(197.95, 89.33) controlPoint2: CGPointMake(197.75, 90.5)];
    [bezier9Path addLineToPoint: CGPointMake(194.04, 93.09)];
    [bezier9Path addLineToPoint: CGPointMake(191.22, 95.06)];
    [bezier9Path addCurveToPoint: CGPointMake(190, 95.43) controlPoint1: CGPointMake(190.82, 95.35) controlPoint2: CGPointMake(190.4, 95.46)];
    [bezier9Path addCurveToPoint: CGPointMake(188.82, 95.1) controlPoint1: CGPointMake(189.59, 95.46) controlPoint2: CGPointMake(189.18, 95.35)];
    [bezier9Path addCurveToPoint: CGPointMake(186, 93.12) controlPoint1: CGPointMake(188.78, 95.07) controlPoint2: CGPointMake(186, 93.12)];
    [bezier9Path addCurveToPoint: CGPointMake(183.1, 91.09) controlPoint1: CGPointMake(183.1, 91.09) controlPoint2: CGPointMake(183.1, 91.09)];
    [bezier9Path addCurveToPoint: CGPointMake(182.64, 88.48) controlPoint1: CGPointMake(182.25, 90.5) controlPoint2: CGPointMake(182.05, 89.33)];
    [bezier9Path addCurveToPoint: CGPointMake(183.4, 87.85) controlPoint1: CGPointMake(182.84, 88.2) controlPoint2: CGPointMake(183.11, 87.98)];
    [bezier9Path addCurveToPoint: CGPointMake(185.25, 88.02) controlPoint1: CGPointMake(183.99, 87.59) controlPoint2: CGPointMake(184.69, 87.63)];
    [bezier9Path addLineToPoint: CGPointMake(188.11, 90.03)];
    [bezier9Path addCurveToPoint: CGPointMake(190, 91.35) controlPoint1: CGPointMake(188.97, 90.63) controlPoint2: CGPointMake(189.58, 91.05)];
    [bezier9Path addCurveToPoint: CGPointMake(191.89, 90.03) controlPoint1: CGPointMake(190.83, 90.77) controlPoint2: CGPointMake(191.89, 90.03)];
    [bezier9Path addCurveToPoint: CGPointMake(194.75, 88.02) controlPoint1: CGPointMake(194.75, 88.02) controlPoint2: CGPointMake(194.75, 88.02)];
    [bezier9Path addCurveToPoint: CGPointMake(197.36, 88.48) controlPoint1: CGPointMake(195.6, 87.43) controlPoint2: CGPointMake(196.76, 87.63)];
    [bezier9Path closePath];
    [black setFill];
    [bezier9Path fill];


    //// Oval 3 Drawing
    UIBezierPath* oval3Path = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(59.5, -157.56, 256, 256)];
    [color setStroke];
    oval3Path.lineWidth = 6;
    [oval3Path stroke];
}

+ (void)drawFullViewWithColor: (UIColor*)color
{
    //// General Declarations
    CGContextRef context = UIGraphicsGetCurrentContext();

    //// Color Declarations
    UIColor* black = [UIColor colorWithRed: 0 green: 0 blue: 0 alpha: 1];
    UIColor* red = [UIColor colorWithRed: 0.992 green: 0.188 blue: 0.11 alpha: 1];

    //// Oval 5 Drawing
    UIBezierPath* oval5Path = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(162, 543.34, 54, 54)];
    [color setFill];
    [oval5Path fill];


    //// Bezier 4 Drawing
    UIBezierPath* bezier4Path = UIBezierPath.bezierPath;
    [bezier4Path moveToPoint: CGPointMake(183.62, 588.69)];
    [bezier4Path addLineToPoint: CGPointMake(186.86, 586.27)];
    [bezier4Path addCurveToPoint: CGPointMake(189, 584.66) controlPoint1: CGPointMake(187.84, 585.53) controlPoint2: CGPointMake(188.52, 585.02)];
    [bezier4Path addCurveToPoint: CGPointMake(191.14, 586.27) controlPoint1: CGPointMake(189.94, 585.37) controlPoint2: CGPointMake(191.14, 586.27)];
    [bezier4Path addCurveToPoint: CGPointMake(194.38, 588.69) controlPoint1: CGPointMake(194.38, 588.69) controlPoint2: CGPointMake(194.38, 588.69)];
    [bezier4Path addCurveToPoint: CGPointMake(197.33, 588.13) controlPoint1: CGPointMake(195.34, 589.41) controlPoint2: CGPointMake(196.66, 589.16)];
    [bezier4Path addCurveToPoint: CGPointMake(196.81, 584.98) controlPoint1: CGPointMake(198.01, 587.11) controlPoint2: CGPointMake(197.77, 585.69)];
    [bezier4Path addLineToPoint: CGPointMake(193.57, 582.55)];
    [bezier4Path addLineToPoint: CGPointMake(190.39, 580.17)];
    [bezier4Path addCurveToPoint: CGPointMake(189, 579.72) controlPoint1: CGPointMake(189.93, 579.82) controlPoint2: CGPointMake(189.46, 579.69)];
    [bezier4Path addCurveToPoint: CGPointMake(187.66, 580.13) controlPoint1: CGPointMake(188.54, 579.69) controlPoint2: CGPointMake(188.07, 579.82)];
    [bezier4Path addCurveToPoint: CGPointMake(184.47, 582.52) controlPoint1: CGPointMake(187.62, 580.16) controlPoint2: CGPointMake(184.47, 582.52)];
    [bezier4Path addCurveToPoint: CGPointMake(181.18, 584.98) controlPoint1: CGPointMake(181.18, 584.98) controlPoint2: CGPointMake(181.18, 584.98)];
    [bezier4Path addCurveToPoint: CGPointMake(180.66, 588.13) controlPoint1: CGPointMake(180.22, 585.69) controlPoint2: CGPointMake(179.99, 587.11)];
    [bezier4Path addCurveToPoint: CGPointMake(181.18, 588.69) controlPoint1: CGPointMake(180.81, 588.36) controlPoint2: CGPointMake(180.99, 588.54)];
    [bezier4Path addCurveToPoint: CGPointMake(183.62, 588.69) controlPoint1: CGPointMake(181.89, 589.22) controlPoint2: CGPointMake(182.87, 589.25)];
    [bezier4Path closePath];
    [black setFill];
    [bezier4Path fill];


    //// Oval 2 Drawing
    UIBezierPath* oval2Path = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(162, 68, 54, 54)];
    [color setFill];
    [oval2Path fill];


    //// Bezier Drawing
    UIBezierPath* bezierPath = UIBezierPath.bezierPath;
    [bezierPath moveToPoint: CGPointMake(0, 0.03)];
    [bezierPath addLineToPoint: CGPointMake(65, 0.03)];
    [bezierPath addCurveToPoint: CGPointMake(188, 96.53) controlPoint1: CGPointMake(65, 0.03) controlPoint2: CGPointMake(91, 97.03)];
    [bezierPath addCurveToPoint: CGPointMake(311, 0.03) controlPoint1: CGPointMake(285, 96.03) controlPoint2: CGPointMake(311, 0.03)];
    [bezierPath addLineToPoint: CGPointMake(375, 0.03)];
    [bezierPath addLineToPoint: CGPointMake(375, 667.03)];
    [bezierPath addLineToPoint: CGPointMake(311, 667.03)];
    [bezierPath addCurveToPoint: CGPointMake(188, 567.85) controlPoint1: CGPointMake(311, 667.03) controlPoint2: CGPointMake(281, 567.85)];
    [bezierPath addCurveToPoint: CGPointMake(71, 665.03) controlPoint1: CGPointMake(95, 567.85) controlPoint2: CGPointMake(71, 665.03)];
    [bezierPath addLineToPoint: CGPointMake(0, 667.03)];
    [bezierPath addLineToPoint: CGPointMake(0, 0.03)];
    [black setFill];
    [bezierPath fill];


    //// Bezier 3 Drawing
    CGContextSaveGState(context);
    CGContextTranslateCTM(context, -0, -667);
    CGContextRotateCTM(context, -180 * M_PI / 180);

    UIBezierPath* bezier3Path = UIBezierPath.bezierPath;
    [bezier3Path moveToPoint: CGPointMake(-375, -667)];
    [bezier3Path addLineToPoint: CGPointMake(-310, -667)];
    [bezier3Path addCurveToPoint: CGPointMake(-189, -514.5) controlPoint1: CGPointMake(-310, -667) controlPoint2: CGPointMake(-324, -514.5)];
    [bezier3Path addCurveToPoint: CGPointMake(-68.11, -667) controlPoint1: CGPointMake(-54, -514.5) controlPoint2: CGPointMake(-68.11, -667)];
    [bezier3Path addLineToPoint: CGPointMake(0, -667)];
    [bezier3Path addLineToPoint: CGPointMake(0, 60)];
    [bezier3Path addLineToPoint: CGPointMake(-375, 60)];
    [bezier3Path addLineToPoint: CGPointMake(-375, -667)];
    [black setFill];
    [bezier3Path fill];

    CGContextRestoreGState(context);


    //// Oval Drawing
    UIBezierPath* ovalPath = UIBezierPath.bezierPath;
    [ovalPath moveToPoint: CGPointMake(307, -30)];
    [ovalPath addCurveToPoint: CGPointMake(189, -148) controlPoint1: CGPointMake(307, -95.17) controlPoint2: CGPointMake(254.17, -148)];
    [ovalPath addCurveToPoint: CGPointMake(71, -30) controlPoint1: CGPointMake(123.83, -148) controlPoint2: CGPointMake(71, -95.17)];
    [ovalPath addCurveToPoint: CGPointMake(189, 88) controlPoint1: CGPointMake(71, 35.17) controlPoint2: CGPointMake(123.83, 88)];
    [ovalPath addCurveToPoint: CGPointMake(307, -30) controlPoint1: CGPointMake(254.17, 88) controlPoint2: CGPointMake(307, 35.17)];
    [ovalPath closePath];
    [ovalPath moveToPoint: CGPointMake(317, -30)];
    [ovalPath addCurveToPoint: CGPointMake(189, 98) controlPoint1: CGPointMake(317, 40.69) controlPoint2: CGPointMake(259.69, 98)];
    [ovalPath addCurveToPoint: CGPointMake(61, -30) controlPoint1: CGPointMake(118.31, 98) controlPoint2: CGPointMake(61, 40.69)];
    [ovalPath addCurveToPoint: CGPointMake(189, -158) controlPoint1: CGPointMake(61, -100.69) controlPoint2: CGPointMake(118.31, -158)];
    [ovalPath addCurveToPoint: CGPointMake(317, -30) controlPoint1: CGPointMake(259.69, -158) controlPoint2: CGPointMake(317, -100.69)];
    [ovalPath closePath];
    [color setFill];
    [ovalPath fill];


    //// Rectangle 5 Drawing
    UIBezierPath* rectangle5Path = UIBezierPath.bezierPath;
    [rectangle5Path moveToPoint: CGPointMake(0, 1333.5)];
    [rectangle5Path addLineToPoint: CGPointMake(375, 1333.5)];
    [rectangle5Path addLineToPoint: CGPointMake(375, 666.5)];
    [rectangle5Path addLineToPoint: CGPointMake(311.5, 666.5)];
    [rectangle5Path addCurveToPoint: CGPointMake(190.5, 812.83) controlPoint1: CGPointMake(311.5, 666.5) controlPoint2: CGPointMake(323.5, 811.83)];
    [rectangle5Path addCurveToPoint: CGPointMake(65.5, 666.5) controlPoint1: CGPointMake(57.5, 813.83) controlPoint2: CGPointMake(65.5, 666.5)];
    [rectangle5Path addLineToPoint: CGPointMake(0, 666.5)];
    [rectangle5Path addLineToPoint: CGPointMake(0, 1333.5)];
    [rectangle5Path closePath];
    [black setFill];
    [rectangle5Path fill];


    //// Oval 4 Drawing
    UIBezierPath* oval4Path = UIBezierPath.bezierPath;
    [oval4Path moveToPoint: CGPointMake(308, 690)];
    [oval4Path addCurveToPoint: CGPointMake(190, 572) controlPoint1: CGPointMake(308, 624.83) controlPoint2: CGPointMake(255.17, 572)];
    [oval4Path addCurveToPoint: CGPointMake(72, 690) controlPoint1: CGPointMake(124.83, 572) controlPoint2: CGPointMake(72, 624.83)];
    [oval4Path addCurveToPoint: CGPointMake(190, 808) controlPoint1: CGPointMake(72, 755.17) controlPoint2: CGPointMake(124.83, 808)];
    [oval4Path addCurveToPoint: CGPointMake(308, 690) controlPoint1: CGPointMake(255.17, 808) controlPoint2: CGPointMake(308, 755.17)];
    [oval4Path closePath];
    [oval4Path moveToPoint: CGPointMake(318, 690)];
    [oval4Path addCurveToPoint: CGPointMake(190, 818) controlPoint1: CGPointMake(318, 760.69) controlPoint2: CGPointMake(260.69, 818)];
    [oval4Path addCurveToPoint: CGPointMake(62, 690) controlPoint1: CGPointMake(119.31, 818) controlPoint2: CGPointMake(62, 760.69)];
    [oval4Path addCurveToPoint: CGPointMake(190, 562) controlPoint1: CGPointMake(62, 619.31) controlPoint2: CGPointMake(119.31, 562)];
    [oval4Path addCurveToPoint: CGPointMake(318, 690) controlPoint1: CGPointMake(260.69, 562) controlPoint2: CGPointMake(318, 619.31)];
    [oval4Path closePath];
    [color setFill];
    [oval4Path fill];


    //// Oval 9 Drawing
    CGContextSaveGState(context);
    CGContextTranslateCTM(context, -75.27, 551.26);
    CGContextScaleCTM(context, 0.5, 0.5);

    UIBezierPath* oval9Path = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(0, 0, 150, 150)];
    [color setFill];
    [oval9Path fill];

    CGContextRestoreGState(context);


    //// Page-1
    {
        CGContextSaveGState(context);
        CGContextTranslateCTM(context, 155.49, 651.85);
        CGContextRotateCTM(context, 33.31 * M_PI / 180);



        //// Path-1 Drawing
        UIBezierPath* path1Path = UIBezierPath.bezierPath;
        [path1Path moveToPoint: CGPointMake(33.99, -44.71)];
        [path1Path addCurveToPoint: CGPointMake(44.64, -34.05) controlPoint1: CGPointMake(37.42, -41.27) controlPoint2: CGPointMake(44.64, -34.05)];
        [path1Path addCurveToPoint: CGPointMake(40.82, -16.42) controlPoint1: CGPointMake(44.64, -34.05) controlPoint2: CGPointMake(37.08, -23.75)];
        [path1Path addCurveToPoint: CGPointMake(55.57, -7.46) controlPoint1: CGPointMake(44.57, -9.09) controlPoint2: CGPointMake(55.57, -7.46)];
        [path1Path addLineToPoint: CGPointMake(55.58, 7.57)];
        [path1Path addCurveToPoint: CGPointMake(40.82, 16.2) controlPoint1: CGPointMake(55.58, 7.57) controlPoint2: CGPointMake(44.28, 9.23)];
        [path1Path addCurveToPoint: CGPointMake(44.57, 33.95) controlPoint1: CGPointMake(36.95, 24.01) controlPoint2: CGPointMake(44.57, 33.95)];
        [path1Path addLineToPoint: CGPointMake(33.99, 44.53)];
        [path1Path addCurveToPoint: CGPointMake(16.13, 40.6) controlPoint1: CGPointMake(33.99, 44.53) controlPoint2: CGPointMake(22.44, 37.77)];
        [path1Path addCurveToPoint: CGPointMake(8.45, 55.54) controlPoint1: CGPointMake(9.82, 43.43) controlPoint2: CGPointMake(8.45, 55.54)];
        [path1Path addLineToPoint: CGPointMake(-7.58, 55.54)];
        [path1Path addCurveToPoint: CGPointMake(-17.1, 40.6) controlPoint1: CGPointMake(-7.58, 55.54) controlPoint2: CGPointMake(-9.31, 43.55)];
        [path1Path addCurveToPoint: CGPointMake(-33.9, 44.61) controlPoint1: CGPointMake(-24.89, 37.64) controlPoint2: CGPointMake(-33.9, 44.61)];
        [path1Path addLineToPoint: CGPointMake(-44.66, 33.98)];
        [path1Path addCurveToPoint: CGPointMake(-41.04, 16.2) controlPoint1: CGPointMake(-44.66, 33.98) controlPoint2: CGPointMake(-37.03, 23.73)];
        [path1Path addCurveToPoint: CGPointMake(-55.56, 7.6) controlPoint1: CGPointMake(-45.05, 8.67) controlPoint2: CGPointMake(-55.56, 7.6)];
        [path1Path addLineToPoint: CGPointMake(-55.58, -7.61)];
        [path1Path addCurveToPoint: CGPointMake(-40.64, -16.86) controlPoint1: CGPointMake(-55.58, -7.61) controlPoint2: CGPointMake(-43.57, -9.14)];
        [path1Path addCurveToPoint: CGPointMake(-44.65, -33.99) controlPoint1: CGPointMake(-37.71, -24.58) controlPoint2: CGPointMake(-44.65, -33.99)];
        [path1Path addLineToPoint: CGPointMake(-34.13, -44.71)];
        [path1Path addCurveToPoint: CGPointMake(-16.39, -40.88) controlPoint1: CGPointMake(-34.13, -44.71) controlPoint2: CGPointMake(-24.26, -37.25)];
        [path1Path addCurveToPoint: CGPointMake(-7.61, -55.54) controlPoint1: CGPointMake(-8.52, -44.51) controlPoint2: CGPointMake(-7.61, -55.54)];
        [path1Path addLineToPoint: CGPointMake(7.57, -55.54)];
        [path1Path addCurveToPoint: CGPointMake(16.13, -40.88) controlPoint1: CGPointMake(7.57, -55.54) controlPoint2: CGPointMake(9.3, -44.27)];
        [path1Path addCurveToPoint: CGPointMake(33.99, -44.71) controlPoint1: CGPointMake(22.96, -37.5) controlPoint2: CGPointMake(33.91, -44.79)];
        [path1Path closePath];
        [path1Path moveToPoint: CGPointMake(0.19, 30.93)];
        [path1Path addCurveToPoint: CGPointMake(31.34, -0.21) controlPoint1: CGPointMake(17.39, 30.93) controlPoint2: CGPointMake(31.34, 16.99)];
        [path1Path addCurveToPoint: CGPointMake(0.19, -31.35) controlPoint1: CGPointMake(31.34, -17.41) controlPoint2: CGPointMake(17.39, -31.35)];
        [path1Path addCurveToPoint: CGPointMake(-30.96, -0.21) controlPoint1: CGPointMake(-17.01, -31.35) controlPoint2: CGPointMake(-30.96, -17.41)];
        [path1Path addCurveToPoint: CGPointMake(0.19, 30.93) controlPoint1: CGPointMake(-30.96, 16.99) controlPoint2: CGPointMake(-17.01, 30.93)];
        [path1Path closePath];
        [path1Path moveToPoint: CGPointMake(-0.03, 19.17)];
        [path1Path addCurveToPoint: CGPointMake(19.14, 0.01) controlPoint1: CGPointMake(10.56, 19.17) controlPoint2: CGPointMake(19.14, 10.59)];
        [path1Path addCurveToPoint: CGPointMake(-0.03, -19.15) controlPoint1: CGPointMake(19.14, -10.57) controlPoint2: CGPointMake(10.56, -19.15)];
        [path1Path addCurveToPoint: CGPointMake(-19.2, 0.01) controlPoint1: CGPointMake(-10.61, -19.15) controlPoint2: CGPointMake(-19.2, -10.57)];
        [path1Path addCurveToPoint: CGPointMake(-0.03, 19.17) controlPoint1: CGPointMake(-19.2, 10.59) controlPoint2: CGPointMake(-10.61, 19.17)];
        [path1Path closePath];
        path1Path.miterLimit = 4;

        path1Path.usesEvenOddFillRule = YES;

        [color setFill];
        [path1Path fill];



        CGContextRestoreGState(context);
    }


    //// Page-
    {
        CGContextSaveGState(context);
        CGContextTranslateCTM(context, 259.49, 635.85);
        CGContextRotateCTM(context, 33.03 * M_PI / 180);



        //// Path- Drawing
        UIBezierPath* pathPath = UIBezierPath.bezierPath;
        [pathPath moveToPoint: CGPointMake(22.18, -10.42)];
        [pathPath addCurveToPoint: CGPointMake(29.28, -3.4) controlPoint1: CGPointMake(24.46, -8.15) controlPoint2: CGPointMake(29.28, -3.4)];
        [pathPath addCurveToPoint: CGPointMake(26.74, 8.2) controlPoint1: CGPointMake(29.28, -3.4) controlPoint2: CGPointMake(24.23, 3.38)];
        [pathPath addCurveToPoint: CGPointMake(36.57, 14.09) controlPoint1: CGPointMake(29.24, 13.02) controlPoint2: CGPointMake(36.57, 14.09)];
        [pathPath addLineToPoint: CGPointMake(36.58, 23.98)];
        [pathPath addCurveToPoint: CGPointMake(26.74, 29.66) controlPoint1: CGPointMake(36.58, 23.98) controlPoint2: CGPointMake(29.04, 25.07)];
        [pathPath addCurveToPoint: CGPointMake(29.24, 41.34) controlPoint1: CGPointMake(24.15, 34.8) controlPoint2: CGPointMake(29.24, 41.34)];
        [pathPath addLineToPoint: CGPointMake(22.18, 48.3)];
        [pathPath addCurveToPoint: CGPointMake(10.26, 45.71) controlPoint1: CGPointMake(22.18, 48.3) controlPoint2: CGPointMake(14.47, 43.85)];
        [pathPath addCurveToPoint: CGPointMake(5.14, 55.54) controlPoint1: CGPointMake(6.05, 47.57) controlPoint2: CGPointMake(5.14, 55.54)];
        [pathPath addLineToPoint: CGPointMake(-5.56, 55.54)];
        [pathPath addCurveToPoint: CGPointMake(-11.91, 45.71) controlPoint1: CGPointMake(-5.56, 55.54) controlPoint2: CGPointMake(-6.71, 47.66)];
        [pathPath addCurveToPoint: CGPointMake(-23.12, 48.35) controlPoint1: CGPointMake(-17.1, 43.77) controlPoint2: CGPointMake(-23.12, 48.35)];
        [pathPath addLineToPoint: CGPointMake(-30.29, 41.36)];
        [pathPath addCurveToPoint: CGPointMake(-27.88, 29.66) controlPoint1: CGPointMake(-30.29, 41.36) controlPoint2: CGPointMake(-25.2, 34.61)];
        [pathPath addCurveToPoint: CGPointMake(-37.56, 24) controlPoint1: CGPointMake(-30.55, 24.7) controlPoint2: CGPointMake(-37.56, 24)];
        [pathPath addLineToPoint: CGPointMake(-37.58, 13.99)];
        [pathPath addCurveToPoint: CGPointMake(-27.61, 7.91) controlPoint1: CGPointMake(-37.58, 13.99) controlPoint2: CGPointMake(-29.57, 12.99)];
        [pathPath addCurveToPoint: CGPointMake(-30.29, -3.36) controlPoint1: CGPointMake(-25.66, 2.83) controlPoint2: CGPointMake(-30.29, -3.36)];
        [pathPath addLineToPoint: CGPointMake(-23.27, -10.42)];
        [pathPath addCurveToPoint: CGPointMake(-11.44, -7.9) controlPoint1: CGPointMake(-23.27, -10.42) controlPoint2: CGPointMake(-16.69, -5.51)];
        [pathPath addCurveToPoint: CGPointMake(-5.58, -17.54) controlPoint1: CGPointMake(-6.18, -10.28) controlPoint2: CGPointMake(-5.58, -17.54)];
        [pathPath addLineToPoint: CGPointMake(4.55, -17.54)];
        [pathPath addCurveToPoint: CGPointMake(10.26, -7.9) controlPoint1: CGPointMake(4.55, -17.54) controlPoint2: CGPointMake(5.71, -10.13)];
        [pathPath addCurveToPoint: CGPointMake(22.18, -10.42) controlPoint1: CGPointMake(14.82, -5.67) controlPoint2: CGPointMake(22.12, -10.47)];
        [pathPath closePath];
        [pathPath moveToPoint: CGPointMake(-0.37, 39.35)];
        [pathPath addCurveToPoint: CGPointMake(20.41, 18.86) controlPoint1: CGPointMake(11.1, 39.35) controlPoint2: CGPointMake(20.41, 30.18)];
        [pathPath addCurveToPoint: CGPointMake(-0.37, -1.62) controlPoint1: CGPointMake(20.41, 7.55) controlPoint2: CGPointMake(11.1, -1.62)];
        [pathPath addCurveToPoint: CGPointMake(-21.15, 18.86) controlPoint1: CGPointMake(-11.85, -1.62) controlPoint2: CGPointMake(-21.15, 7.55)];
        [pathPath addCurveToPoint: CGPointMake(-0.37, 39.35) controlPoint1: CGPointMake(-21.15, 30.18) controlPoint2: CGPointMake(-11.85, 39.35)];
        [pathPath closePath];
        [pathPath moveToPoint: CGPointMake(-0.52, 31.61)];
        [pathPath addCurveToPoint: CGPointMake(12.27, 19.01) controlPoint1: CGPointMake(6.54, 31.61) controlPoint2: CGPointMake(12.27, 25.97)];
        [pathPath addCurveToPoint: CGPointMake(-0.52, 6.4) controlPoint1: CGPointMake(12.27, 12.04) controlPoint2: CGPointMake(6.54, 6.4)];
        [pathPath addCurveToPoint: CGPointMake(-13.31, 19.01) controlPoint1: CGPointMake(-7.58, 6.4) controlPoint2: CGPointMake(-13.31, 12.04)];
        [pathPath addCurveToPoint: CGPointMake(-0.52, 31.61) controlPoint1: CGPointMake(-13.31, 25.97) controlPoint2: CGPointMake(-7.58, 31.61)];
        [pathPath closePath];
        pathPath.miterLimit = 4;

        pathPath.usesEvenOddFillRule = YES;

        [color setFill];
        [pathPath fill];



        CGContextRestoreGState(context);
    }


    //// Bezier 2 Drawing
    UIBezierPath* bezier2Path = UIBezierPath.bezierPath;
    [bezier2Path moveToPoint: CGPointMake(183.62, 76.65)];
    [bezier2Path addLineToPoint: CGPointMake(186.86, 79.08)];
    [bezier2Path addCurveToPoint: CGPointMake(189, 80.68) controlPoint1: CGPointMake(187.84, 79.81) controlPoint2: CGPointMake(188.52, 80.32)];
    [bezier2Path addCurveToPoint: CGPointMake(191.14, 79.08) controlPoint1: CGPointMake(189.94, 79.98) controlPoint2: CGPointMake(191.14, 79.08)];
    [bezier2Path addCurveToPoint: CGPointMake(194.38, 76.65) controlPoint1: CGPointMake(194.38, 76.65) controlPoint2: CGPointMake(194.38, 76.65)];
    [bezier2Path addCurveToPoint: CGPointMake(197.34, 77.21) controlPoint1: CGPointMake(195.34, 75.94) controlPoint2: CGPointMake(196.66, 76.18)];
    [bezier2Path addCurveToPoint: CGPointMake(196.81, 80.37) controlPoint1: CGPointMake(198.01, 78.24) controlPoint2: CGPointMake(197.77, 79.65)];
    [bezier2Path addLineToPoint: CGPointMake(193.57, 82.79)];
    [bezier2Path addLineToPoint: CGPointMake(190.39, 85.17)];
    [bezier2Path addCurveToPoint: CGPointMake(189, 85.62) controlPoint1: CGPointMake(189.93, 85.52) controlPoint2: CGPointMake(189.46, 85.65)];
    [bezier2Path addCurveToPoint: CGPointMake(187.67, 85.22) controlPoint1: CGPointMake(188.54, 85.65) controlPoint2: CGPointMake(188.07, 85.52)];
    [bezier2Path addCurveToPoint: CGPointMake(184.47, 82.83) controlPoint1: CGPointMake(187.62, 85.18) controlPoint2: CGPointMake(184.47, 82.83)];
    [bezier2Path addCurveToPoint: CGPointMake(181.19, 80.37) controlPoint1: CGPointMake(181.19, 80.37) controlPoint2: CGPointMake(181.19, 80.37)];
    [bezier2Path addCurveToPoint: CGPointMake(180.66, 77.21) controlPoint1: CGPointMake(180.23, 79.65) controlPoint2: CGPointMake(179.99, 78.24)];
    [bezier2Path addCurveToPoint: CGPointMake(181.18, 76.65) controlPoint1: CGPointMake(180.81, 76.99) controlPoint2: CGPointMake(180.99, 76.8)];
    [bezier2Path addCurveToPoint: CGPointMake(183.62, 76.65) controlPoint1: CGPointMake(181.89, 76.12) controlPoint2: CGPointMake(182.87, 76.09)];
    [bezier2Path closePath];
    [black setFill];
    [bezier2Path fill];


    //// Oval 3 Drawing
    UIBezierPath* oval3Path = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(61, 205.53, 256, 256)];
    [red setFill];
    [oval3Path fill];


    //// Oval 7 Drawing
    UIBezierPath* oval7Path = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(71, 215.53, 236, 236)];
    [red setFill];
    [oval7Path fill];
    [UIColor.blackColor setStroke];
    oval7Path.lineWidth = 10;
    [oval7Path stroke];


    //// Group
    {
        //// Rectangle 8 Drawing
        UIBezierPath* rectangle8Path = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(169, 287.53, 40, 71.99) cornerRadius: 20];
        [black setFill];
        [rectangle8Path fill];


        //// Rectangle 9 Drawing
        UIBezierPath* rectangle9Path = UIBezierPath.bezierPath;
        [rectangle9Path moveToPoint: CGPointMake(189.5, 341.02)];
        [rectangle9Path addCurveToPoint: CGPointMake(213.43, 332.02) controlPoint1: CGPointMake(189.5, 341.02) controlPoint2: CGPointMake(213.47, 327.87)];
        [rectangle9Path addCurveToPoint: CGPointMake(212, 349.52) controlPoint1: CGPointMake(213.38, 336.17) controlPoint2: CGPointMake(214, 344.52)];
        [rectangle9Path addCurveToPoint: CGPointMake(192.46, 364.11) controlPoint1: CGPointMake(208.84, 355.52) controlPoint2: CGPointMake(203.46, 363.11)];
        [rectangle9Path addLineToPoint: CGPointMake(187.75, 364.11)];
        [rectangle9Path addCurveToPoint: CGPointMake(165.92, 348.48) controlPoint1: CGPointMake(177.98, 364.11) controlPoint2: CGPointMake(169.26, 357.87)];
        [rectangle9Path addCurveToPoint: CGPointMake(164.56, 331.52) controlPoint1: CGPointMake(164.06, 342.44) controlPoint2: CGPointMake(164.6, 335.36)];
        [rectangle9Path addCurveToPoint: CGPointMake(189.5, 341.02) controlPoint1: CGPointMake(164.53, 327.68) controlPoint2: CGPointMake(189.5, 341.02)];
        [rectangle9Path closePath];
        [black setStroke];
        rectangle9Path.lineWidth = 5;
        [rectangle9Path stroke];


        //// Rectangle 13 Drawing
        UIBezierPath* rectangle13Path = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(169, 373.52, 40, 6) cornerRadius: 2];
        [black setFill];
        [rectangle13Path fill];


        //// Rectangle 14 Drawing
        UIBezierPath* rectangle14Path = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(186, 362.52, 6, 15) cornerRadius: 3];
        [black setFill];
        [rectangle14Path fill];
    }


    //// micd title 2 Drawing
    CGRect micdTitle2Rect = CGRectMake(84.54, -24.46, 208.92, 92.46);
    {
        NSString* textContent = @"micd";
        NSMutableParagraphStyle* micdTitle2Style = NSMutableParagraphStyle.defaultParagraphStyle.mutableCopy;
        micdTitle2Style.alignment = NSTextAlignmentCenter;

        NSDictionary* micdTitle2FontAttributes = @{NSFontAttributeName: [UIFont fontWithName: @"RookiesShowtimes" size: 103], NSForegroundColorAttributeName: color, NSParagraphStyleAttributeName: micdTitle2Style};

        CGFloat micdTitle2TextHeight = [textContent boundingRectWithSize: CGSizeMake(micdTitle2Rect.size.width, INFINITY)  options: NSStringDrawingUsesLineFragmentOrigin attributes: micdTitle2FontAttributes context: nil].size.height;
        CGContextSaveGState(context);
        CGContextClipToRect(context, micdTitle2Rect);
        [textContent drawInRect: CGRectMake(CGRectGetMinX(micdTitle2Rect), CGRectGetMinY(micdTitle2Rect) + (CGRectGetHeight(micdTitle2Rect) - micdTitle2TextHeight) / 2, CGRectGetWidth(micdTitle2Rect), micdTitle2TextHeight) withAttributes: micdTitle2FontAttributes];
        CGContextRestoreGState(context);
    }
}

+ (void)drawBackgroundCordWithColor: (UIColor*)color
{
    //// General Declarations
    CGContextRef context = UIGraphicsGetCurrentContext();

    //// Color Declarations
    UIColor* black = [UIColor colorWithRed: 0 green: 0 blue: 0 alpha: 1];

    //// Group 5
    {
        //// Group 4
        {
            //// Rectangle 4 Drawing
            UIBezierPath* rectangle4Path = [UIBezierPath bezierPathWithRect: CGRectMake(162, 808.74, 49, 12)];
            [color setFill];
            [rectangle4Path fill];


            //// Oval 2 Drawing
            CGContextSaveGState(context);
            CGContextTranslateCTM(context, 214, 848.24);
            CGContextRotateCTM(context, 180 * M_PI / 180);

            CGRect oval2Rect = CGRectMake(0, 0, 54, 57);
            UIBezierPath* oval2Path = UIBezierPath.bezierPath;
            [oval2Path addArcWithCenter: CGPointMake(0, 0) radius: CGRectGetWidth(oval2Rect) / 2 startAngle: -340 * M_PI/180 endAngle: -558 * M_PI/180 clockwise: YES];

            CGAffineTransform oval2Transform = CGAffineTransformMakeTranslation(CGRectGetMidX(oval2Rect), CGRectGetMidY(oval2Rect));
            oval2Transform = CGAffineTransformScale(oval2Transform, 1, CGRectGetHeight(oval2Rect) / CGRectGetWidth(oval2Rect));
            [oval2Path applyTransform: oval2Transform];

            [color setFill];
            [oval2Path fill];
            [black setStroke];
            oval2Path.lineWidth = 2;
            [oval2Path stroke];

            CGContextRestoreGState(context);


            //// Rectangle 5 Drawing
            UIBezierPath* rectangle5Path = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(174, 801.74, 26, 3) cornerRadius: 1.5];
            [black setFill];
            [rectangle5Path fill];


            //// Rectangle 6 Drawing
            UIBezierPath* rectangle6Path = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(177, 796.74, 20, 3) cornerRadius: 1.5];
            [black setFill];
            [rectangle6Path fill];


            //// Rectangle 8 Drawing
            UIBezierPath* rectangle8Path = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(177, 806.74, 20, 3) cornerRadius: 1.5];
            [black setFill];
            [rectangle8Path fill];
        }


        //// Group 3
        {
            //// Rectangle 2 Drawing
            UIBezierPath* rectangle2Path = [UIBezierPath bezierPathWithRect: CGRectMake(162.5, 570.68, 49, 12)];
            [color setFill];
            [rectangle2Path fill];


            //// Oval 5 Drawing
            CGContextSaveGState(context);
            CGContextTranslateCTM(context, 214.5, 600.18);
            CGContextRotateCTM(context, -180 * M_PI / 180);

            CGRect oval5Rect = CGRectMake(0, 0, 54, 57);
            UIBezierPath* oval5Path = UIBezierPath.bezierPath;
            [oval5Path addArcWithCenter: CGPointMake(0, 0) radius: CGRectGetWidth(oval5Rect) / 2 startAngle: 198 * M_PI/180 endAngle: -20 * M_PI/180 clockwise: YES];

            CGAffineTransform oval5Transform = CGAffineTransformMakeTranslation(CGRectGetMidX(oval5Rect), CGRectGetMidY(oval5Rect));
            oval5Transform = CGAffineTransformScale(oval5Transform, 1, CGRectGetHeight(oval5Rect) / CGRectGetWidth(oval5Rect));
            [oval5Path applyTransform: oval5Transform];

            [color setFill];
            [oval5Path fill];
            [black setStroke];
            oval5Path.lineWidth = 2;
            [oval5Path stroke];

            CGContextRestoreGState(context);


            //// Rectangle 7 Drawing
            UIBezierPath* rectangle7Path = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(174.5, 586.68, 26, 3) cornerRadius: 1.5];
            [black setFill];
            [rectangle7Path fill];


            //// Rectangle Drawing
            UIBezierPath* rectanglePath = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(177.5, 591.68, 20, 3) cornerRadius: 1.5];
            [black setFill];
            [rectanglePath fill];


            //// Rectangle 3 Drawing
            UIBezierPath* rectangle3Path = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(177.5, 581.68, 20, 3) cornerRadius: 1.5];
            [black setFill];
            [rectangle3Path fill];
        }


        //// Group
        {
            //// Bezier 2 Drawing
            UIBezierPath* bezier2Path = UIBezierPath.bezierPath;
            [bezier2Path moveToPoint: CGPointMake(-0, 727)];
            [bezier2Path addLineToPoint: CGPointMake(65, 727)];
            [bezier2Path addCurveToPoint: CGPointMake(188, 823.5) controlPoint1: CGPointMake(65, 727) controlPoint2: CGPointMake(91, 824)];
            [bezier2Path addCurveToPoint: CGPointMake(311, 727) controlPoint1: CGPointMake(285, 823) controlPoint2: CGPointMake(311, 727)];
            [bezier2Path addLineToPoint: CGPointMake(375, 727)];
            [bezier2Path addLineToPoint: CGPointMake(375, 1394)];
            [bezier2Path addLineToPoint: CGPointMake(311, 1394)];
            [bezier2Path addCurveToPoint: CGPointMake(188, 1392) controlPoint1: CGPointMake(311, 1394) controlPoint2: CGPointMake(281, 1392)];
            [bezier2Path addCurveToPoint: CGPointMake(71, 1392) controlPoint1: CGPointMake(95, 1392) controlPoint2: CGPointMake(71, 1392)];
            [bezier2Path addLineToPoint: CGPointMake(-0, 1394)];
            [bezier2Path addLineToPoint: CGPointMake(-0, 727)];
            [black setFill];
            [bezier2Path fill];


            //// Bezier 3 Drawing
            CGContextSaveGState(context);
            CGContextTranslateCTM(context, -0, 60);
            CGContextRotateCTM(context, -180 * M_PI / 180);

            UIBezierPath* bezier3Path = UIBezierPath.bezierPath;
            [bezier3Path moveToPoint: CGPointMake(-375, -667)];
            [bezier3Path addLineToPoint: CGPointMake(-310, -667)];
            [bezier3Path addCurveToPoint: CGPointMake(-189, -514.5) controlPoint1: CGPointMake(-310, -667) controlPoint2: CGPointMake(-324, -514.5)];
            [bezier3Path addCurveToPoint: CGPointMake(-64, -667) controlPoint1: CGPointMake(-54, -514.5) controlPoint2: CGPointMake(-64, -667)];
            [bezier3Path addLineToPoint: CGPointMake(0, -667)];
            [bezier3Path addLineToPoint: CGPointMake(0, 60)];
            [bezier3Path addLineToPoint: CGPointMake(-375, 60)];
            [bezier3Path addLineToPoint: CGPointMake(-375, -667)];
            [black setFill];
            [bezier3Path fill];

            CGContextRestoreGState(context);


            //// Oval Drawing
            UIBezierPath* ovalPath = UIBezierPath.bezierPath;
            [ovalPath moveToPoint: CGPointMake(305.5, 696)];
            [ovalPath addCurveToPoint: CGPointMake(187.5, 578) controlPoint1: CGPointMake(305.5, 630.83) controlPoint2: CGPointMake(252.67, 578)];
            [ovalPath addCurveToPoint: CGPointMake(69.5, 696) controlPoint1: CGPointMake(122.33, 578) controlPoint2: CGPointMake(69.5, 630.83)];
            [ovalPath addCurveToPoint: CGPointMake(187.5, 814) controlPoint1: CGPointMake(69.5, 761.17) controlPoint2: CGPointMake(122.33, 814)];
            [ovalPath addCurveToPoint: CGPointMake(305.5, 696) controlPoint1: CGPointMake(252.67, 814) controlPoint2: CGPointMake(305.5, 761.17)];
            [ovalPath closePath];
            [ovalPath moveToPoint: CGPointMake(315.5, 696)];
            [ovalPath addCurveToPoint: CGPointMake(187.5, 824) controlPoint1: CGPointMake(315.5, 766.69) controlPoint2: CGPointMake(258.19, 824)];
            [ovalPath addCurveToPoint: CGPointMake(59.5, 696) controlPoint1: CGPointMake(116.81, 824) controlPoint2: CGPointMake(59.5, 766.69)];
            [ovalPath addCurveToPoint: CGPointMake(187.5, 568) controlPoint1: CGPointMake(59.5, 625.31) controlPoint2: CGPointMake(116.81, 568)];
            [ovalPath addCurveToPoint: CGPointMake(315.5, 696) controlPoint1: CGPointMake(258.19, 568) controlPoint2: CGPointMake(315.5, 625.31)];
            [ovalPath closePath];
            [color setFill];
            [ovalPath fill];
            [black setStroke];
            ovalPath.lineWidth = 2;
            [ovalPath stroke];
        }
    }


    //// Text 3 Drawing
    UIBezierPath* text3Path = UIBezierPath.bezierPath;
    [text3Path moveToPoint: CGPointMake(134.65, 20.19)];
    [text3Path addCurveToPoint: CGPointMake(135.87, 19.43) controlPoint1: CGPointMake(134.85, 19.83) controlPoint2: CGPointMake(135.26, 19.58)];
    [text3Path addCurveToPoint: CGPointMake(137.69, 19.39) controlPoint1: CGPointMake(136.47, 19.27) controlPoint2: CGPointMake(137.08, 19.26)];
    [text3Path addCurveToPoint: CGPointMake(139.13, 20.11) controlPoint1: CGPointMake(138.3, 19.52) controlPoint2: CGPointMake(138.78, 19.76)];
    [text3Path addCurveToPoint: CGPointMake(139.29, 21.55) controlPoint1: CGPointMake(139.49, 20.47) controlPoint2: CGPointMake(139.54, 20.95)];
    [text3Path addCurveToPoint: CGPointMake(138.53, 23.15) controlPoint1: CGPointMake(139.13, 21.86) controlPoint2: CGPointMake(138.88, 22.39)];
    [text3Path addCurveToPoint: CGPointMake(137.2, 25.81) controlPoint1: CGPointMake(138.17, 23.91) controlPoint2: CGPointMake(137.73, 24.8)];
    [text3Path addCurveToPoint: CGPointMake(135.39, 29.08) controlPoint1: CGPointMake(136.66, 26.82) controlPoint2: CGPointMake(136.13, 27.86)];
    [text3Path addCurveToPoint: CGPointMake(134.65, 30.83) controlPoint1: CGPointMake(135.19, 29.42) controlPoint2: CGPointMake(127.09, 41.7)];
    [text3Path addCurveToPoint: CGPointMake(134.27, 32.95) controlPoint1: CGPointMake(134.17, 32.04) controlPoint2: CGPointMake(133.91, 32.99)];
    [text3Path addCurveToPoint: CGPointMake(135.83, 32.5) controlPoint1: CGPointMake(134.78, 32.9) controlPoint2: CGPointMake(135.3, 32.75)];
    [text3Path addCurveToPoint: CGPointMake(137.42, 31.51) controlPoint1: CGPointMake(136.36, 32.25) controlPoint2: CGPointMake(136.89, 31.92)];
    [text3Path addCurveToPoint: CGPointMake(138.83, 30.14) controlPoint1: CGPointMake(137.96, 31.11) controlPoint2: CGPointMake(138.42, 30.65)];
    [text3Path addCurveToPoint: CGPointMake(140.08, 29.42) controlPoint1: CGPointMake(139.13, 29.69) controlPoint2: CGPointMake(139.55, 29.45)];
    [text3Path addCurveToPoint: CGPointMake(141.53, 29.69) controlPoint1: CGPointMake(140.62, 29.4) controlPoint2: CGPointMake(141.1, 29.48)];
    [text3Path addCurveToPoint: CGPointMake(142.48, 30.64) controlPoint1: CGPointMake(141.96, 29.89) controlPoint2: CGPointMake(142.28, 30.21)];
    [text3Path addCurveToPoint: CGPointMake(142.33, 31.97) controlPoint1: CGPointMake(142.68, 31.07) controlPoint2: CGPointMake(142.63, 31.51)];
    [text3Path addCurveToPoint: CGPointMake(140.43, 34.09) controlPoint1: CGPointMake(141.92, 32.57) controlPoint2: CGPointMake(141.29, 33.28)];
    [text3Path addCurveToPoint: CGPointMake(137.42, 36.18) controlPoint1: CGPointMake(139.56, 34.91) controlPoint2: CGPointMake(138.56, 35.6)];
    [text3Path addCurveToPoint: CGPointMake(135.39, 37.03) controlPoint1: CGPointMake(136.92, 36.44) controlPoint2: CGPointMake(138.09, 28.5)];
    [text3Path addCurveToPoint: CGPointMake(131.68, 35.39) controlPoint1: CGPointMake(134.72, 37.25) controlPoint2: CGPointMake(131.43, 37.49)];
    [text3Path addCurveToPoint: CGPointMake(130.09, 36.53) controlPoint1: CGPointMake(132.14, 31.62) controlPoint2: CGPointMake(132.83, 34.67)];
    [text3Path addCurveToPoint: CGPointMake(125.57, 40.59) controlPoint1: CGPointMake(128.67, 38.15) controlPoint2: CGPointMake(127.16, 39.5)];
    [text3Path addCurveToPoint: CGPointMake(120.67, 42.23) controlPoint1: CGPointMake(123.97, 41.68) controlPoint2: CGPointMake(122.34, 42.23)];
    [text3Path addCurveToPoint: CGPointMake(117.93, 41.81) controlPoint1: CGPointMake(119.5, 42.23) controlPoint2: CGPointMake(118.59, 42.09)];
    [text3Path addCurveToPoint: CGPointMake(116.41, 40.55) controlPoint1: CGPointMake(117.27, 41.53) controlPoint2: CGPointMake(115, 37)];
    [text3Path addCurveToPoint: CGPointMake(113.9, 41.81) controlPoint1: CGPointMake(115.55, 41.11) controlPoint2: CGPointMake(114.71, 41.53)];
    [text3Path addCurveToPoint: CGPointMake(111.39, 42.23) controlPoint1: CGPointMake(113.09, 42.09) controlPoint2: CGPointMake(112.26, 42.23)];
    [text3Path addCurveToPoint: CGPointMake(107.37, 40.9) controlPoint1: CGPointMake(109.47, 42.23) controlPoint2: CGPointMake(108.13, 41.78)];
    [text3Path addCurveToPoint: CGPointMake(106.38, 37.44) controlPoint1: CGPointMake(106.61, 40.01) controlPoint2: CGPointMake(106.28, 38.86)];
    [text3Path addCurveToPoint: CGPointMake(107.56, 32.73) controlPoint1: CGPointMake(106.48, 36.02) controlPoint2: CGPointMake(106.87, 34.45)];
    [text3Path addCurveToPoint: CGPointMake(110.03, 27.67) controlPoint1: CGPointMake(108.24, 31) controlPoint2: CGPointMake(109.06, 29.32)];
    [text3Path addCurveToPoint: CGPointMake(112.95, 23.15) controlPoint1: CGPointMake(110.99, 26.03) controlPoint2: CGPointMake(111.96, 24.52)];
    [text3Path addCurveToPoint: CGPointMake(115.5, 19.96) controlPoint1: CGPointMake(113.94, 21.78) controlPoint2: CGPointMake(114.79, 20.72)];
    [text3Path addCurveToPoint: CGPointMake(116.98, 19.31) controlPoint1: CGPointMake(115.85, 19.6) controlPoint2: CGPointMake(116.35, 19.39)];
    [text3Path addCurveToPoint: CGPointMake(118.77, 19.46) controlPoint1: CGPointMake(117.61, 19.24) controlPoint2: CGPointMake(118.21, 19.29)];
    [text3Path addCurveToPoint: CGPointMake(120.02, 20.34) controlPoint1: CGPointMake(119.32, 19.64) controlPoint2: CGPointMake(119.74, 19.93)];
    [text3Path addCurveToPoint: CGPointMake(119.91, 21.78) controlPoint1: CGPointMake(120.3, 20.74) controlPoint2: CGPointMake(120.26, 21.23)];
    [text3Path addCurveToPoint: CGPointMake(118.58, 23.72) controlPoint1: CGPointMake(119.65, 22.19) controlPoint2: CGPointMake(119.21, 22.83)];
    [text3Path addCurveToPoint: CGPointMake(116.49, 26.72) controlPoint1: CGPointMake(117.94, 24.61) controlPoint2: CGPointMake(117.25, 25.61)];
    [text3Path addCurveToPoint: CGPointMake(114.24, 30.18) controlPoint1: CGPointMake(115.73, 27.84) controlPoint2: CGPointMake(114.98, 28.99)];
    [text3Path addCurveToPoint: CGPointMake(112.5, 33.49) controlPoint1: CGPointMake(113.51, 31.37) controlPoint2: CGPointMake(112.93, 32.47)];
    [text3Path addCurveToPoint: CGPointMake(111.89, 35.96) controlPoint1: CGPointMake(112.07, 34.5) controlPoint2: CGPointMake(111.86, 35.32)];
    [text3Path addCurveToPoint: CGPointMake(113.07, 36.91) controlPoint1: CGPointMake(111.91, 36.59) controlPoint2: CGPointMake(112.31, 36.91)];
    [text3Path addCurveToPoint: CGPointMake(114.81, 36.3) controlPoint1: CGPointMake(113.62, 36.91) controlPoint2: CGPointMake(114.21, 36.7)];
    [text3Path addCurveToPoint: CGPointMake(116.71, 34.63) controlPoint1: CGPointMake(115.42, 35.89) controlPoint2: CGPointMake(116.06, 35.34)];
    [text3Path addCurveToPoint: CGPointMake(118.54, 30.64) controlPoint1: CGPointMake(117.17, 33.36) controlPoint2: CGPointMake(117.78, 32.03)];
    [text3Path addCurveToPoint: CGPointMake(120.89, 26.61) controlPoint1: CGPointMake(119.3, 29.24) controlPoint2: CGPointMake(120.08, 27.9)];
    [text3Path addCurveToPoint: CGPointMake(123.25, 23.07) controlPoint1: CGPointMake(121.7, 25.32) controlPoint2: CGPointMake(122.49, 24.14)];
    [text3Path addCurveToPoint: CGPointMake(125.07, 20.41) controlPoint1: CGPointMake(124.01, 22.01) controlPoint2: CGPointMake(124.62, 21.12)];
    [text3Path addCurveToPoint: CGPointMake(126.44, 19.58) controlPoint1: CGPointMake(125.38, 20.01) controlPoint2: CGPointMake(125.83, 19.73)];
    [text3Path addCurveToPoint: CGPointMake(128.23, 19.46) controlPoint1: CGPointMake(127.05, 19.43) controlPoint2: CGPointMake(127.65, 19.39)];
    [text3Path addCurveToPoint: CGPointMake(129.63, 20.11) controlPoint1: CGPointMake(128.81, 19.54) controlPoint2: CGPointMake(129.28, 19.76)];
    [text3Path addCurveToPoint: CGPointMake(129.79, 21.55) controlPoint1: CGPointMake(129.99, 20.47) controlPoint2: CGPointMake(130.04, 20.95)];
    [text3Path addCurveToPoint: CGPointMake(128.61, 23.53) controlPoint1: CGPointMake(129.63, 21.96) controlPoint2: CGPointMake(129.24, 22.62)];
    [text3Path addCurveToPoint: CGPointMake(126.52, 26.57) controlPoint1: CGPointMake(127.97, 24.44) controlPoint2: CGPointMake(127.28, 25.46)];
    [text3Path addCurveToPoint: CGPointMake(124.24, 30.03) controlPoint1: CGPointMake(125.76, 27.69) controlPoint2: CGPointMake(125, 28.84)];
    [text3Path addCurveToPoint: CGPointMake(122.34, 33.33) controlPoint1: CGPointMake(123.48, 31.22) controlPoint2: CGPointMake(122.84, 32.32)];
    [text3Path addCurveToPoint: CGPointMake(121.46, 35.84) controlPoint1: CGPointMake(121.83, 34.35) controlPoint2: CGPointMake(121.54, 35.18)];
    [text3Path addCurveToPoint: CGPointMake(122.34, 36.91) controlPoint1: CGPointMake(121.39, 36.5) controlPoint2: CGPointMake(121.68, 36.86)];
    [text3Path addCurveToPoint: CGPointMake(124.81, 35.88) controlPoint1: CGPointMake(123.1, 36.96) controlPoint2: CGPointMake(123.92, 36.62)];
    [text3Path addCurveToPoint: CGPointMake(127.43, 33.03) controlPoint1: CGPointMake(125.69, 35.15) controlPoint2: CGPointMake(126.57, 34.2)];
    [text3Path addCurveToPoint: CGPointMake(129.94, 29.19) controlPoint1: CGPointMake(128.29, 31.87) controlPoint2: CGPointMake(129.13, 30.59)];
    [text3Path addCurveToPoint: CGPointMake(132.14, 25.24) controlPoint1: CGPointMake(130.75, 27.8) controlPoint2: CGPointMake(131.48, 26.48)];
    [text3Path addCurveToPoint: CGPointMake(133.78, 21.97) controlPoint1: CGPointMake(132.8, 24) controlPoint2: CGPointMake(133.35, 22.91)];
    [text3Path addCurveToPoint: CGPointMake(134.65, 20.19) controlPoint1: CGPointMake(134.21, 21.04) controlPoint2: CGPointMake(134.5, 20.44)];
    [text3Path closePath];
    [text3Path moveToPoint: CGPointMake(151.52, 30.14)];
    [text3Path addCurveToPoint: CGPointMake(152.78, 29.42) controlPoint1: CGPointMake(151.83, 29.69) controlPoint2: CGPointMake(152.24, 29.45)];
    [text3Path addCurveToPoint: CGPointMake(154.26, 29.72) controlPoint1: CGPointMake(153.31, 29.4) controlPoint2: CGPointMake(153.8, 29.5)];
    [text3Path addCurveToPoint: CGPointMake(155.25, 30.67) controlPoint1: CGPointMake(154.71, 29.95) controlPoint2: CGPointMake(155.04, 30.27)];
    [text3Path addCurveToPoint: CGPointMake(155.02, 31.97) controlPoint1: CGPointMake(155.45, 31.08) controlPoint2: CGPointMake(155.37, 31.51)];
    [text3Path addCurveToPoint: CGPointMake(153, 34.47) controlPoint1: CGPointMake(154.51, 32.63) controlPoint2: CGPointMake(153.84, 33.46)];
    [text3Path addCurveToPoint: CGPointMake(149.7, 37.97) controlPoint1: CGPointMake(152.17, 35.49) controlPoint2: CGPointMake(151.07, 36.65)];
    [text3Path addCurveToPoint: CGPointMake(147.34, 40.02) controlPoint1: CGPointMake(148.84, 38.78) controlPoint2: CGPointMake(148.05, 39.47)];
    [text3Path addCurveToPoint: CGPointMake(145.21, 41.39) controlPoint1: CGPointMake(146.63, 40.58) controlPoint2: CGPointMake(145.92, 41.04)];
    [text3Path addCurveToPoint: CGPointMake(143.01, 42.15) controlPoint1: CGPointMake(144.5, 41.75) controlPoint2: CGPointMake(143.77, 42)];
    [text3Path addCurveToPoint: CGPointMake(140.5, 42.38) controlPoint1: CGPointMake(142.25, 42.3) controlPoint2: CGPointMake(141.41, 42.38)];
    [text3Path addCurveToPoint: CGPointMake(135.98, 39.22) controlPoint1: CGPointMake(137.92, 42.38) controlPoint2: CGPointMake(136.41, 41.33)];
    [text3Path addCurveToPoint: CGPointMake(138.45, 30.83) controlPoint1: CGPointMake(135.55, 37.12) controlPoint2: CGPointMake(136.37, 34.32)];
    [text3Path addCurveToPoint: CGPointMake(139.89, 28.28) controlPoint1: CGPointMake(138.91, 30.07) controlPoint2: CGPointMake(139.39, 29.22)];
    [text3Path addCurveToPoint: CGPointMake(141.45, 25.51) controlPoint1: CGPointMake(140.4, 27.34) controlPoint2: CGPointMake(140.92, 26.42)];
    [text3Path addCurveToPoint: CGPointMake(142.97, 22.92) controlPoint1: CGPointMake(141.98, 24.59) controlPoint2: CGPointMake(142.49, 23.73)];
    [text3Path addCurveToPoint: CGPointMake(144.23, 20.87) controlPoint1: CGPointMake(143.45, 22.11) controlPoint2: CGPointMake(143.87, 21.43)];
    [text3Path addCurveToPoint: CGPointMake(145.97, 19.5) controlPoint1: CGPointMake(144.68, 20.16) controlPoint2: CGPointMake(145.26, 19.71)];
    [text3Path addCurveToPoint: CGPointMake(147.91, 19.5) controlPoint1: CGPointMake(146.68, 19.3) controlPoint2: CGPointMake(147.33, 19.3)];
    [text3Path addCurveToPoint: CGPointMake(149.24, 20.53) controlPoint1: CGPointMake(148.49, 19.71) controlPoint2: CGPointMake(148.94, 20.05)];
    [text3Path addCurveToPoint: CGPointMake(149.09, 22.24) controlPoint1: CGPointMake(149.55, 21.01) controlPoint2: CGPointMake(149.5, 21.58)];
    [text3Path addCurveToPoint: CGPointMake(147.19, 25.62) controlPoint1: CGPointMake(148.53, 23.2) controlPoint2: CGPointMake(147.9, 24.33)];
    [text3Path addCurveToPoint: CGPointMake(145.29, 29.08) controlPoint1: CGPointMake(146.48, 26.91) controlPoint2: CGPointMake(145.85, 28.07)];
    [text3Path addCurveToPoint: CGPointMake(143.66, 31.97) controlPoint1: CGPointMake(144.73, 30.09) controlPoint2: CGPointMake(144.19, 31.05)];
    [text3Path addCurveToPoint: CGPointMake(142.36, 34.47) controlPoint1: CGPointMake(143.12, 32.88) controlPoint2: CGPointMake(142.69, 33.71)];
    [text3Path addCurveToPoint: CGPointMake(141.68, 36.41) controlPoint1: CGPointMake(142.03, 35.23) controlPoint2: CGPointMake(141.81, 35.88)];
    [text3Path addCurveToPoint: CGPointMake(141.87, 37.51) controlPoint1: CGPointMake(141.55, 36.94) controlPoint2: CGPointMake(141.62, 37.31)];
    [text3Path addCurveToPoint: CGPointMake(142.97, 37.7) controlPoint1: CGPointMake(142.12, 37.77) controlPoint2: CGPointMake(142.49, 37.83)];
    [text3Path addCurveToPoint: CGPointMake(144.53, 36.98) controlPoint1: CGPointMake(143.45, 37.58) controlPoint2: CGPointMake(143.97, 37.34)];
    [text3Path addCurveToPoint: CGPointMake(146.2, 35.77) controlPoint1: CGPointMake(145.09, 36.63) controlPoint2: CGPointMake(145.64, 36.22)];
    [text3Path addCurveToPoint: CGPointMake(147.72, 34.4) controlPoint1: CGPointMake(146.76, 35.31) controlPoint2: CGPointMake(147.27, 34.85)];
    [text3Path addCurveToPoint: CGPointMake(149.77, 32.23) controlPoint1: CGPointMake(148.58, 33.49) controlPoint2: CGPointMake(149.27, 32.76)];
    [text3Path addCurveToPoint: CGPointMake(151.52, 30.14) controlPoint1: CGPointMake(150.28, 31.7) controlPoint2: CGPointMake(150.86, 31)];
    [text3Path closePath];
    [text3Path moveToPoint: CGPointMake(154.64, 13.19)];
    [text3Path addCurveToPoint: CGPointMake(153.65, 14.41) controlPoint1: CGPointMake(154.38, 13.6) controlPoint2: CGPointMake(154.06, 14.01)];
    [text3Path addCurveToPoint: CGPointMake(152.66, 15.32) controlPoint1: CGPointMake(153.24, 14.82) controlPoint2: CGPointMake(152.92, 15.12)];
    [text3Path addCurveToPoint: CGPointMake(150.61, 16.16) controlPoint1: CGPointMake(152, 15.73) controlPoint2: CGPointMake(151.32, 16.01)];
    [text3Path addCurveToPoint: CGPointMake(148.82, 16.23) controlPoint1: CGPointMake(149.9, 16.31) controlPoint2: CGPointMake(149.31, 16.34)];
    [text3Path addCurveToPoint: CGPointMake(147.84, 15.47) controlPoint1: CGPointMake(148.34, 16.13) controlPoint2: CGPointMake(148.01, 15.88)];
    [text3Path addCurveToPoint: CGPointMake(148.25, 13.8) controlPoint1: CGPointMake(147.66, 15.07) controlPoint2: CGPointMake(147.8, 14.51)];
    [text3Path addCurveToPoint: CGPointMake(148.94, 12.62) controlPoint1: CGPointMake(148.41, 13.5) controlPoint2: CGPointMake(148.63, 13.11)];
    [text3Path addCurveToPoint: CGPointMake(149.77, 11.29) controlPoint1: CGPointMake(149.24, 12.14) controlPoint2: CGPointMake(149.52, 11.7)];
    [text3Path addCurveToPoint: CGPointMake(151.45, 10.19) controlPoint1: CGPointMake(150.18, 10.69) controlPoint2: CGPointMake(150.74, 10.32)];
    [text3Path addCurveToPoint: CGPointMake(153.42, 10.31) controlPoint1: CGPointMake(152.16, 10.07) controlPoint2: CGPointMake(152.81, 10.1)];
    [text3Path addCurveToPoint: CGPointMake(154.79, 11.37) controlPoint1: CGPointMake(154.03, 10.51) controlPoint2: CGPointMake(154.49, 10.86)];
    [text3Path addCurveToPoint: CGPointMake(154.64, 13.19) controlPoint1: CGPointMake(155.09, 11.88) controlPoint2: CGPointMake(155.04, 12.49)];
    [text3Path closePath];
    [text3Path moveToPoint: CGPointMake(151.52, 30.14)];
    [text3Path addCurveToPoint: CGPointMake(154.79, 25.77) controlPoint1: CGPointMake(152.54, 28.98) controlPoint2: CGPointMake(153.62, 27.52)];
    [text3Path addCurveToPoint: CGPointMake(157.98, 20.95) controlPoint1: CGPointMake(155.96, 24.02) controlPoint2: CGPointMake(157.02, 22.42)];
    [text3Path addCurveToPoint: CGPointMake(156.58, 18.17) controlPoint1: CGPointMake(157.37, 20.19) controlPoint2: CGPointMake(156.91, 19.26)];
    [text3Path addCurveToPoint: CGPointMake(156.04, 14.87) controlPoint1: CGPointMake(156.25, 17.08) controlPoint2: CGPointMake(156.07, 15.98)];
    [text3Path addCurveToPoint: CGPointMake(156.46, 11.71) controlPoint1: CGPointMake(156.02, 13.75) controlPoint2: CGPointMake(156.16, 12.7)];
    [text3Path addCurveToPoint: CGPointMake(158.06, 9.32) controlPoint1: CGPointMake(156.77, 10.72) controlPoint2: CGPointMake(157.3, 9.93)];
    [text3Path addCurveToPoint: CGPointMake(161.25, 7.99) controlPoint1: CGPointMake(159.17, 8.46) controlPoint2: CGPointMake(160.24, 8.01)];
    [text3Path addCurveToPoint: CGPointMake(163.83, 8.79) controlPoint1: CGPointMake(162.26, 7.96) controlPoint2: CGPointMake(163.12, 8.23)];
    [text3Path addCurveToPoint: CGPointMake(165.39, 11.1) controlPoint1: CGPointMake(164.54, 9.34) controlPoint2: CGPointMake(165.06, 10.12)];
    [text3Path addCurveToPoint: CGPointMake(165.58, 14.26) controlPoint1: CGPointMake(165.72, 12.09) controlPoint2: CGPointMake(165.78, 13.14)];
    [text3Path addCurveToPoint: CGPointMake(164.82, 16.54) controlPoint1: CGPointMake(165.48, 14.92) controlPoint2: CGPointMake(165.23, 15.68)];
    [text3Path addCurveToPoint: CGPointMake(163.38, 19.35) controlPoint1: CGPointMake(164.42, 17.4) controlPoint2: CGPointMake(163.94, 18.34)];
    [text3Path addCurveToPoint: CGPointMake(165.43, 19.35) controlPoint1: CGPointMake(163.99, 19.5) controlPoint2: CGPointMake(164.67, 19.5)];
    [text3Path addCurveToPoint: CGPointMake(167.48, 19.46) controlPoint1: CGPointMake(166.24, 19.2) controlPoint2: CGPointMake(166.92, 19.24)];
    [text3Path addCurveToPoint: CGPointMake(168.77, 20.41) controlPoint1: CGPointMake(168.04, 19.69) controlPoint2: CGPointMake(168.47, 20.01)];
    [text3Path addCurveToPoint: CGPointMake(169.23, 21.74) controlPoint1: CGPointMake(169.08, 20.82) controlPoint2: CGPointMake(169.23, 21.26)];
    [text3Path addCurveToPoint: CGPointMake(168.77, 22.92) controlPoint1: CGPointMake(169.23, 22.23) controlPoint2: CGPointMake(169.08, 22.62)];
    [text3Path addCurveToPoint: CGPointMake(167.56, 24.29) controlPoint1: CGPointMake(168.57, 23.13) controlPoint2: CGPointMake(168.17, 23.58)];
    [text3Path addCurveToPoint: CGPointMake(165.47, 26.84) controlPoint1: CGPointMake(166.95, 25) controlPoint2: CGPointMake(166.25, 25.85)];
    [text3Path addCurveToPoint: CGPointMake(163.07, 29.99) controlPoint1: CGPointMake(164.68, 27.82) controlPoint2: CGPointMake(163.88, 28.88)];
    [text3Path addCurveToPoint: CGPointMake(160.98, 33.18) controlPoint1: CGPointMake(162.26, 31.11) controlPoint2: CGPointMake(161.57, 32.17)];
    [text3Path addCurveToPoint: CGPointMake(159.69, 35.88) controlPoint1: CGPointMake(160.4, 34.2) controlPoint2: CGPointMake(159.97, 35.1)];
    [text3Path addCurveToPoint: CGPointMake(159.81, 37.44) controlPoint1: CGPointMake(159.41, 36.67) controlPoint2: CGPointMake(159.45, 37.19)];
    [text3Path addCurveToPoint: CGPointMake(162.16, 37.59) controlPoint1: CGPointMake(160.36, 37.95) controlPoint2: CGPointMake(161.15, 38)];
    [text3Path addCurveToPoint: CGPointMake(165.35, 35.73) controlPoint1: CGPointMake(163.18, 37.19) controlPoint2: CGPointMake(164.24, 36.56)];
    [text3Path addCurveToPoint: CGPointMake(168.77, 33.03) controlPoint1: CGPointMake(166.47, 34.89) controlPoint2: CGPointMake(167.71, 34.07)];
    [text3Path addCurveToPoint: CGPointMake(171.89, 30.98) controlPoint1: CGPointMake(169.84, 31.99) controlPoint2: CGPointMake(171.23, 31.79)];
    [text3Path addCurveToPoint: CGPointMake(172.54, 29.5) controlPoint1: CGPointMake(172.24, 30.57) controlPoint2: CGPointMake(172, 29.52)];
    [text3Path addCurveToPoint: CGPointMake(173.98, 29.76) controlPoint1: CGPointMake(173.07, 29.47) controlPoint2: CGPointMake(173.55, 29.56)];
    [text3Path addCurveToPoint: CGPointMake(174.93, 30.67) controlPoint1: CGPointMake(174.41, 29.97) controlPoint2: CGPointMake(174.73, 30.27)];
    [text3Path addCurveToPoint: CGPointMake(174.7, 31.97) controlPoint1: CGPointMake(175.13, 31.08) controlPoint2: CGPointMake(175.06, 31.51)];
    [text3Path addCurveToPoint: CGPointMake(170.15, 32.24) controlPoint1: CGPointMake(173.94, 33.03) controlPoint2: CGPointMake(171.54, 30.8)];
    [text3Path addCurveToPoint: CGPointMake(169.89, 37.33) controlPoint1: CGPointMake(169.7, 32.71) controlPoint2: CGPointMake(169.14, 35.28)];
    [text3Path addCurveToPoint: CGPointMake(166.84, 39.6) controlPoint1: CGPointMake(168.88, 38.24) controlPoint2: CGPointMake(167.99, 38.83)];
    [text3Path addCurveToPoint: CGPointMake(161.63, 42.07) controlPoint1: CGPointMake(165.14, 40.74) controlPoint2: CGPointMake(163.4, 41.57)];
    [text3Path addCurveToPoint: CGPointMake(156.69, 41.62) controlPoint1: CGPointMake(159.86, 42.58) controlPoint2: CGPointMake(158.21, 42.43)];
    [text3Path addCurveToPoint: CGPointMake(154.49, 38.5) controlPoint1: CGPointMake(155.37, 40.96) controlPoint2: CGPointMake(154.64, 39.92)];
    [text3Path addCurveToPoint: CGPointMake(155.25, 33.9) controlPoint1: CGPointMake(154.33, 37.08) controlPoint2: CGPointMake(154.59, 35.55)];
    [text3Path addCurveToPoint: CGPointMake(158.06, 28.93) controlPoint1: CGPointMake(155.9, 32.26) controlPoint2: CGPointMake(156.84, 30.6)];
    [text3Path addCurveToPoint: CGPointMake(162.01, 24.67) controlPoint1: CGPointMake(159.27, 27.25) controlPoint2: CGPointMake(160.59, 25.84)];
    [text3Path addCurveToPoint: CGPointMake(162.84, 23.76) controlPoint1: CGPointMake(162.01, 24.67) controlPoint2: CGPointMake(164.18, 23.49)];
    [text3Path addCurveToPoint: CGPointMake(160.98, 23.61) controlPoint1: CGPointMake(162.67, 24.16) controlPoint2: CGPointMake(153.28, 17.57)];
    [text3Path addCurveToPoint: CGPointMake(157.41, 28.62) controlPoint1: CGPointMake(159.72, 25.58) controlPoint2: CGPointMake(158.6, 26.95)];
    [text3Path addCurveToPoint: CGPointMake(155.02, 31.97) controlPoint1: CGPointMake(156.22, 30.29) controlPoint2: CGPointMake(155.42, 31.41)];
    [text3Path addCurveToPoint: CGPointMake(153.61, 32.76) controlPoint1: CGPointMake(154.61, 32.47) controlPoint2: CGPointMake(154.14, 32.74)];
    [text3Path addCurveToPoint: CGPointMake(152.21, 32.42) controlPoint1: CGPointMake(153.08, 32.79) controlPoint2: CGPointMake(152.61, 32.68)];
    [text3Path addCurveToPoint: CGPointMake(151.33, 31.4) controlPoint1: CGPointMake(151.8, 32.17) controlPoint2: CGPointMake(151.51, 31.83)];
    [text3Path addCurveToPoint: CGPointMake(151.52, 30.14) controlPoint1: CGPointMake(151.15, 30.97) controlPoint2: CGPointMake(151.22, 30.55)];
    [text3Path closePath];
    [text3Path moveToPoint: CGPointMake(161.25, 11.83)];
    [text3Path addCurveToPoint: CGPointMake(160.3, 12.32) controlPoint1: CGPointMake(160.84, 11.83) controlPoint2: CGPointMake(160.53, 11.99)];
    [text3Path addCurveToPoint: CGPointMake(159.84, 13.61) controlPoint1: CGPointMake(160.07, 12.65) controlPoint2: CGPointMake(159.92, 13.08)];
    [text3Path addCurveToPoint: CGPointMake(159.88, 15.32) controlPoint1: CGPointMake(159.77, 14.14) controlPoint2: CGPointMake(159.78, 14.71)];
    [text3Path addCurveToPoint: CGPointMake(160.49, 17.07) controlPoint1: CGPointMake(159.98, 15.93) controlPoint2: CGPointMake(160.19, 16.51)];
    [text3Path addCurveToPoint: CGPointMake(161.33, 15.25) controlPoint1: CGPointMake(160.79, 16.46) controlPoint2: CGPointMake(161.07, 15.85)];
    [text3Path addCurveToPoint: CGPointMake(161.86, 13.57) controlPoint1: CGPointMake(161.58, 14.64) controlPoint2: CGPointMake(161.76, 14.08)];
    [text3Path addCurveToPoint: CGPointMake(161.86, 12.32) controlPoint1: CGPointMake(161.96, 13.07) controlPoint2: CGPointMake(161.96, 12.65)];
    [text3Path addCurveToPoint: CGPointMake(161.25, 11.83) controlPoint1: CGPointMake(161.76, 11.99) controlPoint2: CGPointMake(161.55, 11.83)];
    [text3Path closePath];
    [text3Path moveToPoint: CGPointMake(186.79, 30.07)];
    [text3Path addCurveToPoint: CGPointMake(183.37, 32.69) controlPoint1: CGPointMake(185.62, 31.18) controlPoint2: CGPointMake(184.48, 32.06)];
    [text3Path addCurveToPoint: CGPointMake(180.17, 34.13) controlPoint1: CGPointMake(182.25, 33.32) controlPoint2: CGPointMake(181.19, 33.8)];
    [text3Path addCurveToPoint: CGPointMake(176.52, 35.39) controlPoint1: CGPointMake(179.16, 34.46) controlPoint2: CGPointMake(177.38, 35.34)];
    [text3Path addCurveToPoint: CGPointMake(176.52, 30.83) controlPoint1: CGPointMake(176.06, 35.42) controlPoint2: CGPointMake(174.96, 33.92)];
    [text3Path addCurveToPoint: CGPointMake(175.14, 34.43) controlPoint1: CGPointMake(175.89, 30.8) controlPoint2: CGPointMake(174.89, 33.38)];
    [text3Path addCurveToPoint: CGPointMake(176.18, 36.72) controlPoint1: CGPointMake(175.24, 35.24) controlPoint2: CGPointMake(175.6, 36.18)];
    [text3Path addCurveToPoint: CGPointMake(178.39, 37.74) controlPoint1: CGPointMake(176.77, 37.25) controlPoint2: CGPointMake(177.5, 37.59)];
    [text3Path addCurveToPoint: CGPointMake(181.43, 37.63) controlPoint1: CGPointMake(179.27, 37.89) controlPoint2: CGPointMake(180.29, 37.86)];
    [text3Path addCurveToPoint: CGPointMake(184.96, 36.15) controlPoint1: CGPointMake(182.57, 37.4) controlPoint2: CGPointMake(183.75, 36.91)];
    [text3Path addCurveToPoint: CGPointMake(186.82, 34.85) controlPoint1: CGPointMake(185.57, 35.79) controlPoint2: CGPointMake(186.19, 35.36)];
    [text3Path addCurveToPoint: CGPointMake(188.69, 33.26) controlPoint1: CGPointMake(187.46, 34.35) controlPoint2: CGPointMake(188.08, 33.82)];
    [text3Path addCurveToPoint: CGPointMake(192.14, 29.99) controlPoint1: CGPointMake(189.29, 32.7) controlPoint2: CGPointMake(190.15, 31.62)];
    [text3Path addCurveToPoint: CGPointMake(195.56, 29.17) controlPoint1: CGPointMake(192.5, 29.7) controlPoint2: CGPointMake(194.05, 28.43)];
    [text3Path addCurveToPoint: CGPointMake(205.34, 35.08) controlPoint1: CGPointMake(198.28, 30.51) controlPoint2: CGPointMake(201.9, 34.51)];
    [text3Path addCurveToPoint: CGPointMake(212.95, 33.33) controlPoint1: CGPointMake(210.59, 35.95) controlPoint2: CGPointMake(212.73, 33.23)];
    [text3Path addCurveToPoint: CGPointMake(212.95, 33.5) controlPoint1: CGPointMake(213.38, 33.54) controlPoint2: CGPointMake(214.66, 32.96)];
    [text3Path addCurveToPoint: CGPointMake(211.72, 34.51) controlPoint1: CGPointMake(212.69, 33.58) controlPoint2: CGPointMake(212.03, 34.02)];
    [text3Path addCurveToPoint: CGPointMake(210.94, 37.68) controlPoint1: CGPointMake(211.11, 35.48) controlPoint2: CGPointMake(210.89, 36.89)];
    [text3Path addCurveToPoint: CGPointMake(203.1, 37.97) controlPoint1: CGPointMake(211.07, 39.7) controlPoint2: CGPointMake(204.94, 38.33)];
    [text3Path addCurveToPoint: CGPointMake(193.89, 33.52) controlPoint1: CGPointMake(198.5, 37.08) controlPoint2: CGPointMake(190.21, 29.93)];
    [text3Path addCurveToPoint: CGPointMake(192.14, 35.39) controlPoint1: CGPointMake(193.36, 34.11) controlPoint2: CGPointMake(192.78, 34.73)];
    [text3Path addCurveToPoint: CGPointMake(190.09, 37.36) controlPoint1: CGPointMake(191.51, 36.05) controlPoint2: CGPointMake(190.83, 36.7)];
    [text3Path addCurveToPoint: CGPointMake(187.85, 39.19) controlPoint1: CGPointMake(189.36, 38.02) controlPoint2: CGPointMake(188.61, 38.63)];
    [text3Path addCurveToPoint: CGPointMake(182.95, 41.66) controlPoint1: CGPointMake(186.33, 40.35) controlPoint2: CGPointMake(184.7, 41.18)];
    [text3Path addCurveToPoint: CGPointMake(177.93, 42.23) controlPoint1: CGPointMake(181.2, 42.14) controlPoint2: CGPointMake(179.53, 42.33)];
    [text3Path addCurveToPoint: CGPointMake(173.68, 41.09) controlPoint1: CGPointMake(176.34, 42.13) controlPoint2: CGPointMake(174.92, 41.75)];
    [text3Path addCurveToPoint: CGPointMake(171.05, 38.35) controlPoint1: CGPointMake(172.43, 40.43) controlPoint2: CGPointMake(171.56, 39.52)];
    [text3Path addCurveToPoint: CGPointMake(170.33, 33.45) controlPoint1: CGPointMake(170.34, 36.78) controlPoint2: CGPointMake(170.1, 35.15)];
    [text3Path addCurveToPoint: CGPointMake(171.89, 28.7) controlPoint1: CGPointMake(170.56, 31.75) controlPoint2: CGPointMake(171.08, 30.17)];
    [text3Path addCurveToPoint: CGPointMake(175.27, 24.25) controlPoint1: CGPointMake(172.85, 27.03) controlPoint2: CGPointMake(173.98, 25.54)];
    [text3Path addCurveToPoint: CGPointMake(179.3, 21.1) controlPoint1: CGPointMake(176.56, 22.96) controlPoint2: CGPointMake(177.91, 21.91)];
    [text3Path addCurveToPoint: CGPointMake(183.56, 19.58) controlPoint1: CGPointMake(180.69, 20.29) controlPoint2: CGPointMake(182.11, 19.78)];
    [text3Path addCurveToPoint: CGPointMake(187.55, 19.96) controlPoint1: CGPointMake(185, 19.38) controlPoint2: CGPointMake(186.33, 19.5)];
    [text3Path addCurveToPoint: CGPointMake(189.67, 22.01) controlPoint1: CGPointMake(188.66, 20.41) controlPoint2: CGPointMake(189.37, 21.1)];
    [text3Path addCurveToPoint: CGPointMake(189.79, 24.9) controlPoint1: CGPointMake(189.98, 22.92) controlPoint2: CGPointMake(190.02, 23.89)];
    [text3Path addCurveToPoint: CGPointMake(188.57, 27.82) controlPoint1: CGPointMake(189.56, 25.91) controlPoint2: CGPointMake(189.15, 26.89)];
    [text3Path addCurveToPoint: CGPointMake(186.79, 30.07) controlPoint1: CGPointMake(187.99, 28.76) controlPoint2: CGPointMake(187.39, 29.51)];
    [text3Path closePath];
    [text3Path moveToPoint: CGPointMake(175.99, 30.9)];
    [text3Path addCurveToPoint: CGPointMake(179.53, 30.33) controlPoint1: CGPointMake(177.11, 30.95) controlPoint2: CGPointMake(178.29, 30.76)];
    [text3Path addCurveToPoint: CGPointMake(183.06, 28.09) controlPoint1: CGPointMake(180.77, 29.9) controlPoint2: CGPointMake(181.95, 29.15)];
    [text3Path addCurveToPoint: CGPointMake(185.19, 24.82) controlPoint1: CGPointMake(184.28, 26.93) controlPoint2: CGPointMake(184.99, 25.84)];
    [text3Path addCurveToPoint: CGPointMake(183.97, 23.3) controlPoint1: CGPointMake(185.39, 23.81) controlPoint2: CGPointMake(184.99, 23.3)];
    [text3Path addCurveToPoint: CGPointMake(182.23, 23.87) controlPoint1: CGPointMake(183.47, 23.3) controlPoint2: CGPointMake(182.88, 23.49)];
    [text3Path addCurveToPoint: CGPointMake(180.17, 25.47) controlPoint1: CGPointMake(181.57, 24.25) controlPoint2: CGPointMake(180.88, 24.78)];
    [text3Path addCurveToPoint: CGPointMake(178.05, 27.86) controlPoint1: CGPointMake(179.46, 26.15) controlPoint2: CGPointMake(178.76, 26.95)];
    [text3Path addCurveToPoint: CGPointMake(176.07, 30.83) controlPoint1: CGPointMake(177.34, 28.77) controlPoint2: CGPointMake(176.68, 29.76)];
    [text3Path addLineToPoint: CGPointMake(175.99, 30.9)];
    [text3Path closePath];
    [text3Path moveToPoint: CGPointMake(227.22, 17.98)];
    [text3Path addLineToPoint: CGPointMake(220.91, 29.08)];
    [text3Path addCurveToPoint: CGPointMake(219.28, 31.97) controlPoint1: CGPointMake(220.35, 30.09) controlPoint2: CGPointMake(219.81, 31.05)];
    [text3Path addCurveToPoint: CGPointMake(217.98, 34.47) controlPoint1: CGPointMake(218.74, 32.88) controlPoint2: CGPointMake(218.31, 33.71)];
    [text3Path addCurveToPoint: CGPointMake(217.3, 36.41) controlPoint1: CGPointMake(217.65, 35.23) controlPoint2: CGPointMake(217.43, 35.88)];
    [text3Path addCurveToPoint: CGPointMake(217.49, 37.51) controlPoint1: CGPointMake(217.17, 36.94) controlPoint2: CGPointMake(217.24, 37.31)];
    [text3Path addCurveToPoint: CGPointMake(218.59, 37.7) controlPoint1: CGPointMake(217.74, 37.77) controlPoint2: CGPointMake(218.11, 37.83)];
    [text3Path addCurveToPoint: CGPointMake(220.11, 36.98) controlPoint1: CGPointMake(219.07, 37.58) controlPoint2: CGPointMake(219.58, 37.34)];
    [text3Path addCurveToPoint: CGPointMake(221.75, 35.77) controlPoint1: CGPointMake(220.64, 36.63) controlPoint2: CGPointMake(221.19, 36.22)];
    [text3Path addCurveToPoint: CGPointMake(223.27, 34.4) controlPoint1: CGPointMake(222.3, 35.31) controlPoint2: CGPointMake(222.81, 34.85)];
    [text3Path addCurveToPoint: CGPointMake(225.39, 32.23) controlPoint1: CGPointMake(224.18, 33.49) controlPoint2: CGPointMake(224.89, 32.76)];
    [text3Path addCurveToPoint: CGPointMake(227.14, 30.14) controlPoint1: CGPointMake(225.9, 31.7) controlPoint2: CGPointMake(226.48, 31)];
    [text3Path addCurveToPoint: CGPointMake(228.4, 29.42) controlPoint1: CGPointMake(227.45, 29.69) controlPoint2: CGPointMake(227.86, 29.45)];
    [text3Path addCurveToPoint: CGPointMake(229.88, 29.72) controlPoint1: CGPointMake(228.93, 29.4) controlPoint2: CGPointMake(229.42, 29.5)];
    [text3Path addCurveToPoint: CGPointMake(230.87, 30.67) controlPoint1: CGPointMake(230.33, 29.95) controlPoint2: CGPointMake(230.66, 30.27)];
    [text3Path addCurveToPoint: CGPointMake(230.64, 31.97) controlPoint1: CGPointMake(231.07, 31.08) controlPoint2: CGPointMake(230.99, 31.51)];
    [text3Path addCurveToPoint: CGPointMake(228.59, 34.47) controlPoint1: CGPointMake(230.13, 32.63) controlPoint2: CGPointMake(229.45, 33.46)];
    [text3Path addCurveToPoint: CGPointMake(225.32, 37.97) controlPoint1: CGPointMake(227.72, 35.49) controlPoint2: CGPointMake(225.1, 34.37)];
    [text3Path addCurveToPoint: CGPointMake(222.96, 40.02) controlPoint1: CGPointMake(224.46, 38.78) controlPoint2: CGPointMake(223.67, 39.47)];
    [text3Path addCurveToPoint: CGPointMake(220.83, 41.39) controlPoint1: CGPointMake(222.25, 40.58) controlPoint2: CGPointMake(221.54, 41.04)];
    [text3Path addCurveToPoint: CGPointMake(218.63, 42.15) controlPoint1: CGPointMake(220.12, 41.75) controlPoint2: CGPointMake(219.39, 42)];
    [text3Path addCurveToPoint: CGPointMake(216.12, 42.38) controlPoint1: CGPointMake(217.87, 42.3) controlPoint2: CGPointMake(217.03, 42.38)];
    [text3Path addCurveToPoint: CGPointMake(211.6, 39.22) controlPoint1: CGPointMake(213.54, 42.38) controlPoint2: CGPointMake(212.03, 41.33)];
    [text3Path addCurveToPoint: CGPointMake(214.07, 30.83) controlPoint1: CGPointMake(211.17, 37.12) controlPoint2: CGPointMake(211.99, 34.32)];
    [text3Path addCurveToPoint: CGPointMake(215.21, 28.77) controlPoint1: CGPointMake(214.32, 30.37) controlPoint2: CGPointMake(214.7, 29.69)];
    [text3Path addCurveToPoint: CGPointMake(217, 25.66) controlPoint1: CGPointMake(215.72, 27.86) controlPoint2: CGPointMake(216.31, 26.82)];
    [text3Path addCurveToPoint: CGPointMake(219.16, 21.93) controlPoint1: CGPointMake(217.68, 24.49) controlPoint2: CGPointMake(218.4, 23.25)];
    [text3Path addCurveToPoint: CGPointMake(221.37, 18.06) controlPoint1: CGPointMake(219.92, 20.62) controlPoint2: CGPointMake(220.66, 19.33)];
    [text3Path addCurveToPoint: CGPointMake(220.07, 18.13) controlPoint1: CGPointMake(220.96, 18.11) controlPoint2: CGPointMake(220.53, 18.13)];
    [text3Path addCurveToPoint: CGPointMake(218.71, 18.13) controlPoint1: CGPointMake(219.62, 18.13) controlPoint2: CGPointMake(219.16, 18.13)];
    [text3Path addCurveToPoint: CGPointMake(216.65, 17.49) controlPoint1: CGPointMake(217.64, 18.13) controlPoint2: CGPointMake(216.96, 17.92)];
    [text3Path addCurveToPoint: CGPointMake(216.58, 16.01) controlPoint1: CGPointMake(216.35, 17.06) controlPoint2: CGPointMake(216.32, 16.56)];
    [text3Path addCurveToPoint: CGPointMake(217.95, 14.49) controlPoint1: CGPointMake(216.83, 15.45) controlPoint2: CGPointMake(217.29, 14.94)];
    [text3Path addCurveToPoint: CGPointMake(220.15, 13.73) controlPoint1: CGPointMake(218.6, 14.03) controlPoint2: CGPointMake(219.34, 13.78)];
    [text3Path addCurveToPoint: CGPointMake(221.75, 13.73) controlPoint1: CGPointMake(220.56, 13.73) controlPoint2: CGPointMake(221.09, 13.73)];
    [text3Path addCurveToPoint: CGPointMake(223.95, 13.65) controlPoint1: CGPointMake(222.4, 13.73) controlPoint2: CGPointMake(223.14, 13.7)];
    [text3Path addLineToPoint: CGPointMake(225.62, 10.91)];
    [text3Path addCurveToPoint: CGPointMake(227.37, 9.55) controlPoint1: CGPointMake(226.08, 10.21) controlPoint2: CGPointMake(226.66, 9.75)];
    [text3Path addCurveToPoint: CGPointMake(229.35, 9.55) controlPoint1: CGPointMake(228.08, 9.34) controlPoint2: CGPointMake(228.74, 9.34)];
    [text3Path addCurveToPoint: CGPointMake(230.68, 10.57) controlPoint1: CGPointMake(229.95, 9.75) controlPoint2: CGPointMake(230.4, 10.09)];
    [text3Path addCurveToPoint: CGPointMake(230.56, 12.28) controlPoint1: CGPointMake(230.95, 11.05) controlPoint2: CGPointMake(230.92, 11.62)];
    [text3Path addLineToPoint: CGPointMake(229.8, 13.57)];
    [text3Path addCurveToPoint: CGPointMake(231.93, 13.57) controlPoint1: CGPointMake(230.56, 13.57) controlPoint2: CGPointMake(231.27, 13.57)];
    [text3Path addCurveToPoint: CGPointMake(233.53, 13.5) controlPoint1: CGPointMake(232.59, 13.57) controlPoint2: CGPointMake(233.12, 13.55)];
    [text3Path addCurveToPoint: CGPointMake(234.89, 14.14) controlPoint1: CGPointMake(234.29, 13.5) controlPoint2: CGPointMake(234.74, 13.71)];
    [text3Path addCurveToPoint: CGPointMake(234.74, 15.59) controlPoint1: CGPointMake(235.05, 14.58) controlPoint2: CGPointMake(235, 15.06)];
    [text3Path addCurveToPoint: CGPointMake(233.53, 17.11) controlPoint1: CGPointMake(234.49, 16.12) controlPoint2: CGPointMake(234.08, 16.63)];
    [text3Path addCurveToPoint: CGPointMake(231.7, 17.83) controlPoint1: CGPointMake(232.97, 17.59) controlPoint2: CGPointMake(232.36, 17.83)];
    [text3Path addLineToPoint: CGPointMake(227.22, 17.98)];
    [text3Path closePath];
    [text3Path moveToPoint: CGPointMake(251.23, 30.14)];
    [text3Path addCurveToPoint: CGPointMake(252.56, 29.42) controlPoint1: CGPointMake(251.59, 29.69) controlPoint2: CGPointMake(252.03, 29.45)];
    [text3Path addCurveToPoint: CGPointMake(254.05, 29.72) controlPoint1: CGPointMake(253.1, 29.4) controlPoint2: CGPointMake(253.59, 29.5)];
    [text3Path addCurveToPoint: CGPointMake(255.03, 30.67) controlPoint1: CGPointMake(254.5, 29.95) controlPoint2: CGPointMake(254.83, 30.27)];
    [text3Path addCurveToPoint: CGPointMake(254.81, 31.97) controlPoint1: CGPointMake(255.24, 31.08) controlPoint2: CGPointMake(255.16, 31.51)];
    [text3Path addCurveToPoint: CGPointMake(253.78, 33.3) controlPoint1: CGPointMake(254.55, 32.27) controlPoint2: CGPointMake(254.21, 32.71)];
    [text3Path addCurveToPoint: CGPointMake(252.26, 35.16) controlPoint1: CGPointMake(253.35, 33.88) controlPoint2: CGPointMake(252.84, 34.5)];
    [text3Path addCurveToPoint: CGPointMake(249.52, 36.3) controlPoint1: CGPointMake(251.93, 35.53) controlPoint2: CGPointMake(251.43, 34.63)];
    [text3Path addCurveToPoint: CGPointMake(245.21, 41.85) controlPoint1: CGPointMake(248.07, 37.57) controlPoint2: CGPointMake(245.67, 41.66)];
    [text3Path addCurveToPoint: CGPointMake(241.89, 42.3) controlPoint1: CGPointMake(244.15, 42.31) controlPoint2: CGPointMake(242.7, 42.35)];
    [text3Path addCurveToPoint: CGPointMake(239.83, 41.54) controlPoint1: CGPointMake(241.08, 42.25) controlPoint2: CGPointMake(240.39, 42)];
    [text3Path addCurveToPoint: CGPointMake(238.39, 39.95) controlPoint1: CGPointMake(239.28, 41.09) controlPoint2: CGPointMake(238.8, 40.55)];
    [text3Path addCurveToPoint: CGPointMake(237.65, 40.53) controlPoint1: CGPointMake(238.02, 40.18) controlPoint2: CGPointMake(237.14, 35.64)];
    [text3Path addCurveToPoint: CGPointMake(235.77, 41.54) controlPoint1: CGPointMake(237.18, 40.81) controlPoint2: CGPointMake(236.28, 41.24)];
    [text3Path addCurveToPoint: CGPointMake(231.55, 42.38) controlPoint1: CGPointMake(234.83, 42.1) controlPoint2: CGPointMake(233.42, 42.38)];
    [text3Path addCurveToPoint: CGPointMake(228.13, 41.47) controlPoint1: CGPointMake(230.23, 42.38) controlPoint2: CGPointMake(229.09, 42.07)];
    [text3Path addCurveToPoint: CGPointMake(226, 38.88) controlPoint1: CGPointMake(227.17, 40.86) controlPoint2: CGPointMake(226.46, 40)];
    [text3Path addCurveToPoint: CGPointMake(225.55, 34.89) controlPoint1: CGPointMake(225.55, 37.77) controlPoint2: CGPointMake(225.39, 36.44)];
    [text3Path addCurveToPoint: CGPointMake(227.29, 29.84) controlPoint1: CGPointMake(225.7, 33.35) controlPoint2: CGPointMake(226.28, 31.66)];
    [text3Path addCurveToPoint: CGPointMake(230.75, 25.09) controlPoint1: CGPointMake(228.26, 28.01) controlPoint2: CGPointMake(229.41, 26.43)];
    [text3Path addCurveToPoint: CGPointMake(234.82, 21.78) controlPoint1: CGPointMake(232.09, 23.75) controlPoint2: CGPointMake(233.45, 22.64)];
    [text3Path addCurveToPoint: CGPointMake(238.81, 19.88) controlPoint1: CGPointMake(236.19, 20.92) controlPoint2: CGPointMake(237.52, 20.29)];
    [text3Path addCurveToPoint: CGPointMake(242.19, 19.27) controlPoint1: CGPointMake(240.1, 19.48) controlPoint2: CGPointMake(241.23, 19.27)];
    [text3Path addCurveToPoint: CGPointMake(243.9, 19.54) controlPoint1: CGPointMake(242.85, 19.27) controlPoint2: CGPointMake(243.42, 19.36)];
    [text3Path addCurveToPoint: CGPointMake(245.23, 20.19) controlPoint1: CGPointMake(244.38, 19.72) controlPoint2: CGPointMake(244.82, 19.93)];
    [text3Path addCurveToPoint: CGPointMake(246.37, 21.1) controlPoint1: CGPointMake(245.64, 20.44) controlPoint2: CGPointMake(246.02, 20.74)];
    [text3Path addCurveToPoint: CGPointMake(247.89, 19.77) controlPoint1: CGPointMake(244, 27) controlPoint2: CGPointMake(247.18, 20.05)];
    [text3Path addCurveToPoint: CGPointMake(249.9, 19.46) controlPoint1: CGPointMake(248.6, 19.49) controlPoint2: CGPointMake(249.27, 19.39)];
    [text3Path addCurveToPoint: CGPointMake(251.35, 20.19) controlPoint1: CGPointMake(250.54, 19.54) controlPoint2: CGPointMake(251.02, 19.78)];
    [text3Path addCurveToPoint: CGPointMake(251.23, 21.86) controlPoint1: CGPointMake(251.68, 20.59) controlPoint2: CGPointMake(251.64, 21.15)];
    [text3Path addCurveToPoint: CGPointMake(249.71, 24.86) controlPoint1: CGPointMake(250.83, 22.67) controlPoint2: CGPointMake(250.32, 23.67)];
    [text3Path addCurveToPoint: CGPointMake(247.81, 28.51) controlPoint1: CGPointMake(249.11, 26.05) controlPoint2: CGPointMake(248.47, 27.27)];
    [text3Path addCurveToPoint: CGPointMake(245.95, 32) controlPoint1: CGPointMake(247.16, 29.75) controlPoint2: CGPointMake(246.53, 30.92)];
    [text3Path addCurveToPoint: CGPointMake(244.55, 34.4) controlPoint1: CGPointMake(245.37, 33.09) controlPoint2: CGPointMake(244.9, 33.89)];
    [text3Path addCurveToPoint: CGPointMake(244.2, 35.58) controlPoint1: CGPointMake(244.24, 34.96) controlPoint2: CGPointMake(244.13, 35.35)];
    [text3Path addCurveToPoint: CGPointMake(244.85, 35.88) controlPoint1: CGPointMake(244.28, 35.8) controlPoint2: CGPointMake(244.5, 35.91)];
    [text3Path addCurveToPoint: CGPointMake(246.07, 35.46) controlPoint1: CGPointMake(245.2, 35.86) controlPoint2: CGPointMake(245.61, 35.72)];
    [text3Path addCurveToPoint: CGPointMake(247.43, 34.4) controlPoint1: CGPointMake(246.52, 35.21) controlPoint2: CGPointMake(246.98, 34.85)];
    [text3Path addCurveToPoint: CGPointMake(249.52, 32.23) controlPoint1: CGPointMake(248.3, 33.49) controlPoint2: CGPointMake(248.99, 32.76)];
    [text3Path addCurveToPoint: CGPointMake(251.23, 30.14) controlPoint1: CGPointMake(250.06, 31.7) controlPoint2: CGPointMake(250.63, 31)];
    [text3Path closePath];
    [text3Path moveToPoint: CGPointMake(240.06, 32.27)];
    [text3Path addCurveToPoint: CGPointMake(241.92, 29.34) controlPoint1: CGPointMake(240.82, 31.31) controlPoint2: CGPointMake(241.44, 30.33)];
    [text3Path addCurveToPoint: CGPointMake(242.99, 26.61) controlPoint1: CGPointMake(242.41, 28.36) controlPoint2: CGPointMake(242.76, 27.44)];
    [text3Path addCurveToPoint: CGPointMake(243.25, 24.4) controlPoint1: CGPointMake(243.22, 25.77) controlPoint2: CGPointMake(243.3, 25.04)];
    [text3Path addCurveToPoint: CGPointMake(242.57, 23) controlPoint1: CGPointMake(243.2, 23.77) controlPoint2: CGPointMake(242.98, 23.3)];
    [text3Path addCurveToPoint: CGPointMake(241.01, 22.73) controlPoint1: CGPointMake(242.16, 22.69) controlPoint2: CGPointMake(241.65, 22.61)];
    [text3Path addCurveToPoint: CGPointMake(238.96, 23.61) controlPoint1: CGPointMake(240.38, 22.86) controlPoint2: CGPointMake(239.69, 23.15)];
    [text3Path addCurveToPoint: CGPointMake(236.68, 25.43) controlPoint1: CGPointMake(238.23, 24.06) controlPoint2: CGPointMake(237.47, 24.67)];
    [text3Path addCurveToPoint: CGPointMake(234.36, 28.01) controlPoint1: CGPointMake(235.89, 26.19) controlPoint2: CGPointMake(235.12, 27.05)];
    [text3Path addCurveToPoint: CGPointMake(232.46, 30.98) controlPoint1: CGPointMake(233.6, 29.03) controlPoint2: CGPointMake(232.97, 30.02)];
    [text3Path addCurveToPoint: CGPointMake(231.36, 33.68) controlPoint1: CGPointMake(231.96, 31.94) controlPoint2: CGPointMake(231.59, 32.84)];
    [text3Path addCurveToPoint: CGPointMake(231.13, 35.88) controlPoint1: CGPointMake(231.13, 34.51) controlPoint2: CGPointMake(231.06, 35.25)];
    [text3Path addCurveToPoint: CGPointMake(231.85, 37.29) controlPoint1: CGPointMake(231.21, 36.51) controlPoint2: CGPointMake(231.45, 36.98)];
    [text3Path addCurveToPoint: CGPointMake(233.34, 37.59) controlPoint1: CGPointMake(232.21, 37.59) controlPoint2: CGPointMake(232.7, 37.69)];
    [text3Path addCurveToPoint: CGPointMake(235.43, 36.75) controlPoint1: CGPointMake(233.97, 37.49) controlPoint2: CGPointMake(234.67, 37.21)];
    [text3Path addCurveToPoint: CGPointMake(237.74, 34.93) controlPoint1: CGPointMake(236.19, 36.3) controlPoint2: CGPointMake(236.96, 35.69)];
    [text3Path addCurveToPoint: CGPointMake(240.06, 32.27) controlPoint1: CGPointMake(238.53, 34.17) controlPoint2: CGPointMake(239.3, 33.28)];
    [text3Path closePath];
    [text3Path moveToPoint: CGPointMake(268.71, 20.11)];
    [text3Path addCurveToPoint: CGPointMake(270.73, 22.62) controlPoint1: CGPointMake(269.63, 20.72) controlPoint2: CGPointMake(270.3, 21.55)];
    [text3Path addCurveToPoint: CGPointMake(271.3, 26.27) controlPoint1: CGPointMake(271.16, 23.68) controlPoint2: CGPointMake(271.35, 24.9)];
    [text3Path addCurveToPoint: CGPointMake(270.46, 30.6) controlPoint1: CGPointMake(271.25, 27.63) controlPoint2: CGPointMake(270.97, 29.08)];
    [text3Path addCurveToPoint: CGPointMake(268.26, 35.08) controlPoint1: CGPointMake(269.96, 32.12) controlPoint2: CGPointMake(269.22, 33.61)];
    [text3Path addCurveToPoint: CGPointMake(261, 41.51) controlPoint1: CGPointMake(268, 35.49) controlPoint2: CGPointMake(264.25, 40.51)];
    [text3Path addCurveToPoint: CGPointMake(254.73, 41.54) controlPoint1: CGPointMake(257.75, 42.51) controlPoint2: CGPointMake(255.54, 42.1)];
    [text3Path addCurveToPoint: CGPointMake(252.91, 39.49) controlPoint1: CGPointMake(254.02, 41.14) controlPoint2: CGPointMake(253.41, 40.45)];
    [text3Path addCurveToPoint: CGPointMake(250.74, 44.32) controlPoint1: CGPointMake(252.15, 41.16) controlPoint2: CGPointMake(251.42, 42.77)];
    [text3Path addCurveToPoint: CGPointMake(248.92, 48.46) controlPoint1: CGPointMake(250.06, 45.86) controlPoint2: CGPointMake(249.45, 47.24)];
    [text3Path addCurveToPoint: CGPointMake(247.55, 51.54) controlPoint1: CGPointMake(248.38, 49.67) controlPoint2: CGPointMake(247.93, 50.7)];
    [text3Path addCurveToPoint: CGPointMake(190.22, 156.52) controlPoint1: CGPointMake(247.17, 52.37) controlPoint2: CGPointMake(190.33, 156.32)];
    [text3Path addCurveToPoint: CGPointMake(188.59, 157.93) controlPoint1: CGPointMake(189.87, 157.23) controlPoint2: CGPointMake(189.33, 157.7)];
    [text3Path addCurveToPoint: CGPointMake(186.46, 157.93) controlPoint1: CGPointMake(187.86, 158.15) controlPoint2: CGPointMake(187.15, 158.15)];
    [text3Path addCurveToPoint: CGPointMake(184.87, 156.63) controlPoint1: CGPointMake(185.78, 157.7) controlPoint2: CGPointMake(185.25, 157.27)];
    [text3Path addCurveToPoint: CGPointMake(184.98, 154.24) controlPoint1: CGPointMake(184.49, 156) controlPoint2: CGPointMake(184.52, 155.2)];
    [text3Path addCurveToPoint: CGPointMake(243.33, 47.05) controlPoint1: CGPointMake(185.28, 153.53) controlPoint2: CGPointMake(242.47, 48.85)];
    [text3Path addCurveToPoint: CGPointMake(249.9, 34.51) controlPoint1: CGPointMake(244.19, 45.25) controlPoint2: CGPointMake(248.81, 36.84)];
    [text3Path addCurveToPoint: CGPointMake(249.71, 33.41) controlPoint1: CGPointMake(257.38, 29.73) controlPoint2: CGPointMake(248.5, 36.05)];
    [text3Path addCurveToPoint: CGPointMake(253.17, 25.89) controlPoint1: CGPointMake(250.93, 30.78) controlPoint2: CGPointMake(252.08, 28.27)];
    [text3Path addCurveToPoint: CGPointMake(256.1, 19.54) controlPoint1: CGPointMake(254.26, 23.51) controlPoint2: CGPointMake(255.24, 21.39)];
    [text3Path addCurveToPoint: CGPointMake(257.92, 15.55) controlPoint1: CGPointMake(256.96, 17.69) controlPoint2: CGPointMake(257.57, 16.36)];
    [text3Path addCurveToPoint: CGPointMake(259.21, 14.64) controlPoint1: CGPointMake(258.12, 15.09) controlPoint2: CGPointMake(258.56, 14.79)];
    [text3Path addCurveToPoint: CGPointMake(261.15, 14.64) controlPoint1: CGPointMake(259.87, 14.49) controlPoint2: CGPointMake(260.52, 14.49)];
    [text3Path addCurveToPoint: CGPointMake(262.67, 15.47) controlPoint1: CGPointMake(261.79, 14.79) controlPoint2: CGPointMake(262.29, 15.07)];
    [text3Path addCurveToPoint: CGPointMake(262.86, 16.99) controlPoint1: CGPointMake(263.05, 15.88) controlPoint2: CGPointMake(263.12, 16.39)];
    [text3Path addCurveToPoint: CGPointMake(261.27, 20.64) controlPoint1: CGPointMake(262.86, 16.99) controlPoint2: CGPointMake(257.63, 25.78)];
    [text3Path addCurveToPoint: CGPointMake(265.26, 19.31) controlPoint1: CGPointMake(262.63, 19.88) controlPoint2: CGPointMake(263.96, 19.44)];
    [text3Path addCurveToPoint: CGPointMake(268.71, 20.11) controlPoint1: CGPointMake(266.55, 19.19) controlPoint2: CGPointMake(267.7, 19.45)];
    [text3Path closePath];
    [text3Path moveToPoint: CGPointMake(264.53, 32.73)];
    [text3Path addCurveToPoint: CGPointMake(266.13, 29.8) controlPoint1: CGPointMake(265.19, 31.76) controlPoint2: CGPointMake(265.72, 30.79)];
    [text3Path addCurveToPoint: CGPointMake(266.97, 27.06) controlPoint1: CGPointMake(266.54, 28.81) controlPoint2: CGPointMake(266.81, 27.9)];
    [text3Path addCurveToPoint: CGPointMake(267.04, 24.9) controlPoint1: CGPointMake(267.12, 26.23) controlPoint2: CGPointMake(267.14, 25.51)];
    [text3Path addCurveToPoint: CGPointMake(266.36, 23.61) controlPoint1: CGPointMake(266.94, 24.29) controlPoint2: CGPointMake(266.71, 23.86)];
    [text3Path addCurveToPoint: CGPointMake(264.8, 23.38) controlPoint1: CGPointMake(269, 23) controlPoint2: CGPointMake(265.43, 23.28)];
    [text3Path addCurveToPoint: CGPointMake(262.75, 24.18) controlPoint1: CGPointMake(264.17, 23.48) controlPoint2: CGPointMake(263.48, 23.75)];
    [text3Path addCurveToPoint: CGPointMake(260.43, 25.92) controlPoint1: CGPointMake(262.01, 24.61) controlPoint2: CGPointMake(261.24, 25.19)];
    [text3Path addCurveToPoint: CGPointMake(258.23, 28.47) controlPoint1: CGPointMake(259.62, 26.66) controlPoint2: CGPointMake(258.88, 27.51)];
    [text3Path addCurveToPoint: CGPointMake(256.55, 31.43) controlPoint1: CGPointMake(257.57, 29.48) controlPoint2: CGPointMake(257.01, 30.47)];
    [text3Path addCurveToPoint: CGPointMake(255.6, 34.09) controlPoint1: CGPointMake(256.1, 32.4) controlPoint2: CGPointMake(255.78, 33.28)];
    [text3Path addCurveToPoint: CGPointMake(255.41, 36.18) controlPoint1: CGPointMake(255.43, 34.91) controlPoint2: CGPointMake(255.36, 35.6)];
    [text3Path addCurveToPoint: CGPointMake(256.1, 37.44) controlPoint1: CGPointMake(255.46, 36.77) controlPoint2: CGPointMake(255.69, 37.19)];
    [text3Path addCurveToPoint: CGPointMake(257.92, 37.86) controlPoint1: CGPointMake(256.6, 37.79) controlPoint2: CGPointMake(257.21, 37.93)];
    [text3Path addCurveToPoint: CGPointMake(260.09, 37.1) controlPoint1: CGPointMake(258.63, 37.78) controlPoint2: CGPointMake(259.35, 37.53)];
    [text3Path addCurveToPoint: CGPointMake(262.33, 35.31) controlPoint1: CGPointMake(260.82, 36.67) controlPoint2: CGPointMake(261.57, 36.07)];
    [text3Path addCurveToPoint: CGPointMake(264.53, 32.73) controlPoint1: CGPointMake(263.09, 34.55) controlPoint2: CGPointMake(263.82, 33.69)];
    [text3Path closePath];
    [color setFill];
    [text3Path fill];


    //// Bezier 6 Drawing
    UIBezierPath* bezier6Path = UIBezierPath.bezierPath;
    [bezier6Path moveToPoint: CGPointMake(416.14, 46.87)];
    [bezier6Path addCurveToPoint: CGPointMake(416.22, 54.54) controlPoint1: CGPointMake(416.14, 46.86) controlPoint2: CGPointMake(416.22, 54.54)];
    [bezier6Path addCurveToPoint: CGPointMake(416.22, 57.08) controlPoint1: CGPointMake(416.22, 54.54) controlPoint2: CGPointMake(416.2, 56.6)];
    [bezier6Path addCurveToPoint: CGPointMake(419.37, 57.08) controlPoint1: CGPointMake(416.26, 57.97) controlPoint2: CGPointMake(419.37, 57.08)];
    [bezier6Path addCurveToPoint: CGPointMake(420.99, 61.87) controlPoint1: CGPointMake(422.42, 56.84) controlPoint2: CGPointMake(421.64, 61.35)];
    [bezier6Path addCurveToPoint: CGPointMake(414.34, 63.63) controlPoint1: CGPointMake(420.35, 62.39) controlPoint2: CGPointMake(414.26, 63.46)];
    [bezier6Path addCurveToPoint: CGPointMake(425.08, 64.65) controlPoint1: CGPointMake(414.32, 63.59) controlPoint2: CGPointMake(423.52, 63.08)];
    [bezier6Path addCurveToPoint: CGPointMake(424.68, 71.37) controlPoint1: CGPointMake(426.8, 66.37) controlPoint2: CGPointMake(426.26, 68.21)];
    [bezier6Path addCurveToPoint: CGPointMake(411.47, 73.19) controlPoint1: CGPointMake(423.84, 73.05) controlPoint2: CGPointMake(411.47, 73.19)];
    [bezier6Path addCurveToPoint: CGPointMake(420.95, 77.41) controlPoint1: CGPointMake(411.47, 73.19) controlPoint2: CGPointMake(419.37, 75.3)];
    [bezier6Path addCurveToPoint: CGPointMake(420.43, 84.78) controlPoint1: CGPointMake(422.3, 79.2) controlPoint2: CGPointMake(421.69, 84.18)];
    [bezier6Path addCurveToPoint: CGPointMake(407.78, 86.89) controlPoint1: CGPointMake(417.85, 86.01) controlPoint2: CGPointMake(407.78, 86.89)];
    [bezier6Path addCurveToPoint: CGPointMake(419.9, 89.53) controlPoint1: CGPointMake(407.78, 86.89) controlPoint2: CGPointMake(417.79, 88.47)];
    [bezier6Path addCurveToPoint: CGPointMake(418.89, 99.9) controlPoint1: CGPointMake(422.87, 91.01) controlPoint2: CGPointMake(424.68, 99.9)];
    [bezier6Path addCurveToPoint: CGPointMake(404.66, 100.96) controlPoint1: CGPointMake(414.63, 99.9) controlPoint2: CGPointMake(404.66, 100.96)];
    [bezier6Path addCurveToPoint: CGPointMake(420.82, 103.95) controlPoint1: CGPointMake(404.66, 100.96) controlPoint2: CGPointMake(418.83, 102.95)];
    [bezier6Path addCurveToPoint: CGPointMake(420.82, 115.54) controlPoint1: CGPointMake(423.98, 105.53) controlPoint2: CGPointMake(423.59, 115.19)];
    [bezier6Path addCurveToPoint: CGPointMake(406.07, 116.59) controlPoint1: CGPointMake(416.61, 116.07) controlPoint2: CGPointMake(406.07, 116.59)];
    [bezier6Path addCurveToPoint: CGPointMake(421.88, 120.81) controlPoint1: CGPointMake(406.07, 116.59) controlPoint2: CGPointMake(419.24, 118.7)];
    [bezier6Path addCurveToPoint: CGPointMake(422.4, 130.29) controlPoint1: CGPointMake(424.51, 122.91) controlPoint2: CGPointMake(424.17, 129.7)];
    [bezier6Path addCurveToPoint: CGPointMake(406.07, 132.4) controlPoint1: CGPointMake(419.24, 131.34) controlPoint2: CGPointMake(406.07, 132.4)];
    [bezier6Path addCurveToPoint: CGPointMake(422.4, 135.56) controlPoint1: CGPointMake(406.07, 132.4) controlPoint2: CGPointMake(419.11, 134.18)];
    [bezier6Path addCurveToPoint: CGPointMake(423.06, 146.95) controlPoint1: CGPointMake(425.69, 136.94) controlPoint2: CGPointMake(425.17, 146.42)];
    [bezier6Path addCurveToPoint: CGPointMake(406.2, 150.11) controlPoint1: CGPointMake(420.95, 147.48) controlPoint2: CGPointMake(406.2, 150.11)];
    [bezier6Path addCurveToPoint: CGPointMake(422.93, 152.42) controlPoint1: CGPointMake(406.2, 150.11) controlPoint2: CGPointMake(420.95, 151.17)];
    [bezier6Path addCurveToPoint: CGPointMake(423.06, 163.81) controlPoint1: CGPointMake(424.76, 153.58) controlPoint2: CGPointMake(424.46, 162.97)];
    [bezier6Path addCurveToPoint: CGPointMake(407.25, 166.97) controlPoint1: CGPointMake(420.43, 165.39) controlPoint2: CGPointMake(407.25, 166.97)];
    [bezier6Path addCurveToPoint: CGPointMake(423.06, 170.13) controlPoint1: CGPointMake(407.25, 166.97) controlPoint2: CGPointMake(421.35, 168.42)];
    [bezier6Path addCurveToPoint: CGPointMake(423.06, 182.25) controlPoint1: CGPointMake(423.68, 170.75) controlPoint2: CGPointMake(427.27, 178.56)];
    [bezier6Path addCurveToPoint: CGPointMake(407.25, 183.83) controlPoint1: CGPointMake(421.55, 183.57) controlPoint2: CGPointMake(407.25, 183.83)];
    [bezier6Path addCurveToPoint: CGPointMake(423.06, 187.52) controlPoint1: CGPointMake(407.25, 183.83) controlPoint2: CGPointMake(420.95, 185.94)];
    [bezier6Path addCurveToPoint: CGPointMake(423.06, 199.11) controlPoint1: CGPointMake(424.93, 188.92) controlPoint2: CGPointMake(426.22, 198.58)];
    [bezier6Path addCurveToPoint: CGPointMake(406.2, 201.74) controlPoint1: CGPointMake(422.2, 199.25) controlPoint2: CGPointMake(406.2, 201.74)];
    [bezier6Path addCurveToPoint: CGPointMake(423.06, 205.96) controlPoint1: CGPointMake(406.2, 201.74) controlPoint2: CGPointMake(421.48, 203.85)];
    [bezier6Path addCurveToPoint: CGPointMake(423.06, 216.49) controlPoint1: CGPointMake(423.76, 206.89) controlPoint2: CGPointMake(425.69, 213.33)];
    [bezier6Path addCurveToPoint: CGPointMake(407.25, 219.66) controlPoint1: CGPointMake(422.12, 217.62) controlPoint2: CGPointMake(407.25, 219.66)];
    [bezier6Path addCurveToPoint: CGPointMake(422.53, 222.82) controlPoint1: CGPointMake(407.25, 219.66) controlPoint2: CGPointMake(419.37, 221.24)];
    [bezier6Path addCurveToPoint: CGPointMake(423.06, 233.35) controlPoint1: CGPointMake(425.69, 224.4) controlPoint2: CGPointMake(425.17, 232.3)];
    [bezier6Path addCurveToPoint: CGPointMake(407.25, 237.57) controlPoint1: CGPointMake(420.95, 234.41) controlPoint2: CGPointMake(407.25, 237.57)];
    [bezier6Path addCurveToPoint: CGPointMake(423.06, 240.73) controlPoint1: CGPointMake(407.25, 237.57) controlPoint2: CGPointMake(421.28, 238.36)];
    [bezier6Path addCurveToPoint: CGPointMake(423.06, 251.27) controlPoint1: CGPointMake(423.72, 241.6) controlPoint2: CGPointMake(424.56, 250.14)];
    [bezier6Path addCurveToPoint: CGPointMake(407.25, 256.01) controlPoint1: CGPointMake(422.31, 251.83) controlPoint2: CGPointMake(407.25, 256.01)];
    [bezier6Path addCurveToPoint: CGPointMake(423.06, 258.64) controlPoint1: CGPointMake(407.25, 256.01) controlPoint2: CGPointMake(418.21, 255.67)];
    [bezier6Path addCurveToPoint: CGPointMake(423.06, 270.23) controlPoint1: CGPointMake(423.72, 259.05) controlPoint2: CGPointMake(425.17, 269.18)];
    [bezier6Path addCurveToPoint: CGPointMake(407.25, 272.87) controlPoint1: CGPointMake(422.79, 270.37) controlPoint2: CGPointMake(407.25, 272.87)];
    [bezier6Path addCurveToPoint: CGPointMake(423.06, 276.55) controlPoint1: CGPointMake(407.25, 272.87) controlPoint2: CGPointMake(420.43, 273.92)];
    [bezier6Path addCurveToPoint: CGPointMake(423.06, 289.73) controlPoint1: CGPointMake(425.69, 279.19) controlPoint2: CGPointMake(425.69, 287.09)];
    [bezier6Path addCurveToPoint: CGPointMake(408.31, 291.83) controlPoint1: CGPointMake(420.43, 292.36) controlPoint2: CGPointMake(408.31, 291.83)];
    [bezier6Path addCurveToPoint: CGPointMake(423.06, 296.57) controlPoint1: CGPointMake(408.31, 291.83) controlPoint2: CGPointMake(420.95, 294.99)];
    [bezier6Path addCurveToPoint: CGPointMake(423.06, 309.22) controlPoint1: CGPointMake(425.17, 298.15) controlPoint2: CGPointMake(423.06, 309.22)];
    [bezier6Path addLineToPoint: CGPointMake(408.31, 311.85)];
    [bezier6Path addCurveToPoint: CGPointMake(423.06, 315.01) controlPoint1: CGPointMake(408.31, 311.85) controlPoint2: CGPointMake(420.95, 311.85)];
    [bezier6Path addCurveToPoint: CGPointMake(424.61, 329.26) controlPoint1: CGPointMake(425.17, 318.17) controlPoint2: CGPointMake(426.71, 325.57)];
    [bezier6Path addCurveToPoint: CGPointMake(408.59, 331.89) controlPoint1: CGPointMake(423.86, 330.57) controlPoint2: CGPointMake(408.59, 331.89)];
    [bezier6Path addCurveToPoint: CGPointMake(424.61, 336.11) controlPoint1: CGPointMake(408.59, 331.89) controlPoint2: CGPointMake(422.4, 334.29)];
    [bezier6Path addCurveToPoint: CGPointMake(424.61, 348.92) controlPoint1: CGPointMake(426.81, 337.93) controlPoint2: CGPointMake(426.04, 347.42)];
    [bezier6Path addLineToPoint: CGPointMake(424.48, 349.03)];
    [bezier6Path addCurveToPoint: CGPointMake(408.22, 351.12) controlPoint1: CGPointMake(420.91, 350.1) controlPoint2: CGPointMake(408.22, 351.12)];
    [bezier6Path addCurveToPoint: CGPointMake(424.55, 354.28) controlPoint1: CGPointMake(408.22, 351.12) controlPoint2: CGPointMake(421.26, 352.89)];
    [bezier6Path addCurveToPoint: CGPointMake(425.21, 365.67) controlPoint1: CGPointMake(427.84, 355.66) controlPoint2: CGPointMake(427.31, 365.14)];
    [bezier6Path addCurveToPoint: CGPointMake(408.35, 368.83) controlPoint1: CGPointMake(423.1, 366.2) controlPoint2: CGPointMake(408.35, 368.83)];
    [bezier6Path addCurveToPoint: CGPointMake(425.08, 371.14) controlPoint1: CGPointMake(408.35, 368.83) controlPoint2: CGPointMake(423.1, 369.89)];
    [bezier6Path addCurveToPoint: CGPointMake(425.21, 382.53) controlPoint1: CGPointMake(426.91, 372.29) controlPoint2: CGPointMake(426.6, 381.69)];
    [bezier6Path addCurveToPoint: CGPointMake(409.4, 385.69) controlPoint1: CGPointMake(422.57, 384.11) controlPoint2: CGPointMake(409.4, 385.69)];
    [bezier6Path addCurveToPoint: CGPointMake(425.21, 388.85) controlPoint1: CGPointMake(409.4, 385.69) controlPoint2: CGPointMake(423.49, 387.14)];
    [bezier6Path addCurveToPoint: CGPointMake(425.21, 400.97) controlPoint1: CGPointMake(425.82, 389.47) controlPoint2: CGPointMake(429.42, 397.28)];
    [bezier6Path addCurveToPoint: CGPointMake(409.4, 402.55) controlPoint1: CGPointMake(423.7, 402.29) controlPoint2: CGPointMake(409.4, 402.55)];
    [bezier6Path addCurveToPoint: CGPointMake(425.21, 406.24) controlPoint1: CGPointMake(409.4, 402.55) controlPoint2: CGPointMake(423.1, 404.66)];
    [bezier6Path addCurveToPoint: CGPointMake(425.21, 417.83) controlPoint1: CGPointMake(427.07, 407.64) controlPoint2: CGPointMake(428.37, 417.3)];
    [bezier6Path addCurveToPoint: CGPointMake(408.35, 420.46) controlPoint1: CGPointMake(424.35, 417.97) controlPoint2: CGPointMake(408.35, 420.46)];
    [bezier6Path addCurveToPoint: CGPointMake(425.21, 424.68) controlPoint1: CGPointMake(408.35, 420.46) controlPoint2: CGPointMake(423.63, 422.57)];
    [bezier6Path addCurveToPoint: CGPointMake(425.21, 435.21) controlPoint1: CGPointMake(425.9, 425.61) controlPoint2: CGPointMake(427.84, 432.05)];
    [bezier6Path addCurveToPoint: CGPointMake(409.4, 438.37) controlPoint1: CGPointMake(424.26, 436.34) controlPoint2: CGPointMake(409.4, 438.37)];
    [bezier6Path addCurveToPoint: CGPointMake(424.68, 441.54) controlPoint1: CGPointMake(409.4, 438.37) controlPoint2: CGPointMake(421.52, 439.95)];
    [bezier6Path addCurveToPoint: CGPointMake(425.21, 452.07) controlPoint1: CGPointMake(427.84, 443.12) controlPoint2: CGPointMake(427.31, 451.02)];
    [bezier6Path addCurveToPoint: CGPointMake(409.4, 456.29) controlPoint1: CGPointMake(423.1, 453.13) controlPoint2: CGPointMake(409.4, 456.29)];
    [bezier6Path addCurveToPoint: CGPointMake(425.21, 459.45) controlPoint1: CGPointMake(409.4, 456.29) controlPoint2: CGPointMake(423.43, 457.07)];
    [bezier6Path addCurveToPoint: CGPointMake(425.21, 469.98) controlPoint1: CGPointMake(425.86, 460.32) controlPoint2: CGPointMake(426.71, 468.86)];
    [bezier6Path addCurveToPoint: CGPointMake(409.4, 474.73) controlPoint1: CGPointMake(424.45, 470.55) controlPoint2: CGPointMake(409.4, 474.73)];
    [bezier6Path addCurveToPoint: CGPointMake(425.21, 477.36) controlPoint1: CGPointMake(409.4, 474.73) controlPoint2: CGPointMake(420.35, 474.38)];
    [bezier6Path addCurveToPoint: CGPointMake(425.21, 488.95) controlPoint1: CGPointMake(425.87, 477.77) controlPoint2: CGPointMake(427.31, 487.9)];
    [bezier6Path addCurveToPoint: CGPointMake(409.4, 491.58) controlPoint1: CGPointMake(424.94, 489.08) controlPoint2: CGPointMake(409.4, 491.58)];
    [bezier6Path addCurveToPoint: CGPointMake(425.21, 495.27) controlPoint1: CGPointMake(409.4, 491.58) controlPoint2: CGPointMake(422.57, 492.64)];
    [bezier6Path addCurveToPoint: CGPointMake(425.21, 508.44) controlPoint1: CGPointMake(427.84, 497.91) controlPoint2: CGPointMake(427.84, 505.81)];
    [bezier6Path addCurveToPoint: CGPointMake(410.46, 510.55) controlPoint1: CGPointMake(422.57, 511.08) controlPoint2: CGPointMake(410.46, 510.55)];
    [bezier6Path addCurveToPoint: CGPointMake(425.21, 515.29) controlPoint1: CGPointMake(410.46, 510.55) controlPoint2: CGPointMake(423.1, 513.71)];
    [bezier6Path addCurveToPoint: CGPointMake(425.21, 527.94) controlPoint1: CGPointMake(427.31, 516.87) controlPoint2: CGPointMake(425.21, 527.94)];
    [bezier6Path addLineToPoint: CGPointMake(410.46, 530.57)];
    [bezier6Path addCurveToPoint: CGPointMake(425.21, 533.73) controlPoint1: CGPointMake(410.46, 530.57) controlPoint2: CGPointMake(423.1, 530.57)];
    [bezier6Path addCurveToPoint: CGPointMake(426.75, 547.97) controlPoint1: CGPointMake(427.31, 536.89) controlPoint2: CGPointMake(428.86, 544.29)];
    [bezier6Path addCurveToPoint: CGPointMake(410.73, 550.61) controlPoint1: CGPointMake(426, 549.29) controlPoint2: CGPointMake(410.73, 550.61)];
    [bezier6Path addCurveToPoint: CGPointMake(426.75, 554.83) controlPoint1: CGPointMake(410.73, 550.61) controlPoint2: CGPointMake(424.55, 553.01)];
    [bezier6Path addCurveToPoint: CGPointMake(426.75, 567.64) controlPoint1: CGPointMake(428.96, 556.65) controlPoint2: CGPointMake(428.18, 566.14)];
    [bezier6Path addCurveToPoint: CGPointMake(405.71, 565.55) controlPoint1: CGPointMake(425.91, 568.52) controlPoint2: CGPointMake(407.08, 567.76)];
    [bezier6Path addCurveToPoint: CGPointMake(421.03, 560.85) controlPoint1: CGPointMake(404.75, 564) controlPoint2: CGPointMake(421.03, 560.85)];
    [bezier6Path addLineToPoint: CGPointMake(405.71, 556.05)];
    [bezier6Path addCurveToPoint: CGPointMake(405.71, 543.22) controlPoint1: CGPointMake(405.71, 556.05) controlPoint2: CGPointMake(399.4, 548.79)];
    [bezier6Path addCurveToPoint: CGPointMake(420.99, 540.05) controlPoint1: CGPointMake(409.16, 540.17) controlPoint2: CGPointMake(420.99, 540.05)];
    [bezier6Path addCurveToPoint: CGPointMake(406.77, 536.89) controlPoint1: CGPointMake(420.99, 540.05) controlPoint2: CGPointMake(409.93, 538.47)];
    [bezier6Path addCurveToPoint: CGPointMake(405.71, 525.83) controlPoint1: CGPointMake(403.61, 535.31) controlPoint2: CGPointMake(404.27, 528.83)];
    [bezier6Path addCurveToPoint: CGPointMake(420.99, 521.61) controlPoint1: CGPointMake(407.88, 521.33) controlPoint2: CGPointMake(420.99, 521.61)];
    [bezier6Path addCurveToPoint: CGPointMake(405.71, 518.45) controlPoint1: CGPointMake(420.99, 521.61) controlPoint2: CGPointMake(408.39, 520.41)];
    [bezier6Path addCurveToPoint: CGPointMake(405.71, 504.76) controlPoint1: CGPointMake(403.03, 516.5) controlPoint2: CGPointMake(402.59, 506.63)];
    [bezier6Path addCurveToPoint: CGPointMake(420.99, 501.07) controlPoint1: CGPointMake(408.35, 503.18) controlPoint2: CGPointMake(420.99, 501.07)];
    [bezier6Path addCurveToPoint: CGPointMake(405.71, 497.91) controlPoint1: CGPointMake(420.99, 501.07) controlPoint2: CGPointMake(407.28, 499.79)];
    [bezier6Path addCurveToPoint: CGPointMake(405.19, 487.37) controlPoint1: CGPointMake(403.08, 494.75) controlPoint2: CGPointMake(403.08, 489.48)];
    [bezier6Path addCurveToPoint: CGPointMake(420.99, 482.1) controlPoint1: CGPointMake(407.29, 485.26) controlPoint2: CGPointMake(420.99, 482.1)];
    [bezier6Path addCurveToPoint: CGPointMake(405.19, 480.52) controlPoint1: CGPointMake(420.99, 482.1) controlPoint2: CGPointMake(407.29, 482.63)];
    [bezier6Path addCurveToPoint: CGPointMake(404.66, 469.98) controlPoint1: CGPointMake(403.08, 478.41) controlPoint2: CGPointMake(403.61, 472.62)];
    [bezier6Path addCurveToPoint: CGPointMake(419.41, 464.72) controlPoint1: CGPointMake(405.71, 467.35) controlPoint2: CGPointMake(419.41, 464.72)];
    [bezier6Path addCurveToPoint: CGPointMake(404.66, 462.61) controlPoint1: CGPointMake(419.41, 464.72) controlPoint2: CGPointMake(407.29, 464.72)];
    [bezier6Path addCurveToPoint: CGPointMake(404.13, 450.49) controlPoint1: CGPointMake(403.13, 461.39) controlPoint2: CGPointMake(402.92, 452.69)];
    [bezier6Path addCurveToPoint: CGPointMake(420.99, 446.8) controlPoint1: CGPointMake(405.34, 448.29) controlPoint2: CGPointMake(420.99, 446.8)];
    [bezier6Path addCurveToPoint: CGPointMake(404.13, 443.12) controlPoint1: CGPointMake(420.99, 446.8) controlPoint2: CGPointMake(406.24, 446.8)];
    [bezier6Path addCurveToPoint: CGPointMake(404.13, 433.11) controlPoint1: CGPointMake(401.75, 438.94) controlPoint2: CGPointMake(402.89, 433.94)];
    [bezier6Path addCurveToPoint: CGPointMake(420.99, 429.42) controlPoint1: CGPointMake(407.29, 431) controlPoint2: CGPointMake(420.99, 429.42)];
    [bezier6Path addCurveToPoint: CGPointMake(404.13, 426.26) controlPoint1: CGPointMake(420.99, 429.42) controlPoint2: CGPointMake(407.29, 428.36)];
    [bezier6Path addCurveToPoint: CGPointMake(404.66, 414.67) controlPoint1: CGPointMake(402.31, 425.04) controlPoint2: CGPointMake(401.5, 415.72)];
    [bezier6Path addCurveToPoint: CGPointMake(421.52, 412.03) controlPoint1: CGPointMake(407.82, 413.61) controlPoint2: CGPointMake(421.52, 412.03)];
    [bezier6Path addCurveToPoint: CGPointMake(404.66, 407.82) controlPoint1: CGPointMake(421.52, 412.03) controlPoint2: CGPointMake(406.57, 408.45)];
    [bezier6Path addCurveToPoint: CGPointMake(404.13, 395.7) controlPoint1: CGPointMake(401.5, 406.76) controlPoint2: CGPointMake(401.9, 396.44)];
    [bezier6Path addCurveToPoint: CGPointMake(422.05, 394.12) controlPoint1: CGPointMake(407.29, 394.65) controlPoint2: CGPointMake(422.05, 394.12)];
    [bezier6Path addCurveToPoint: CGPointMake(404.66, 390.96) controlPoint1: CGPointMake(422.05, 394.12) controlPoint2: CGPointMake(408.35, 392.01)];
    [bezier6Path addCurveToPoint: CGPointMake(404.66, 379.9) controlPoint1: CGPointMake(401.66, 390.1) controlPoint2: CGPointMake(400.97, 380.95)];
    [bezier6Path addCurveToPoint: CGPointMake(421.52, 376.73) controlPoint1: CGPointMake(406.68, 379.32) controlPoint2: CGPointMake(421.52, 376.73)];
    [bezier6Path addCurveToPoint: CGPointMake(405.19, 374.63) controlPoint1: CGPointMake(421.52, 376.73) controlPoint2: CGPointMake(409.4, 375.15)];
    [bezier6Path addCurveToPoint: CGPointMake(404.27, 363.5) controlPoint1: CGPointMake(400.97, 374.1) controlPoint2: CGPointMake(402.03, 364.62)];
    [bezier6Path addCurveToPoint: CGPointMake(421.52, 359.88) controlPoint1: CGPointMake(406.51, 362.38) controlPoint2: CGPointMake(421.52, 359.88)];
    [bezier6Path addCurveToPoint: CGPointMake(404.79, 357.18) controlPoint1: CGPointMake(421.52, 359.88) controlPoint2: CGPointMake(406.77, 358.82)];
    [bezier6Path addCurveToPoint: CGPointMake(403.57, 346.83) controlPoint1: CGPointMake(402.56, 355.31) controlPoint2: CGPointMake(401.33, 349.14)];
    [bezier6Path addCurveToPoint: CGPointMake(418.89, 342.13) controlPoint1: CGPointMake(402.61, 345.28) controlPoint2: CGPointMake(418.89, 342.13)];
    [bezier6Path addLineToPoint: CGPointMake(404.62, 337.66)];
    [bezier6Path addCurveToPoint: CGPointMake(403.57, 325.88) controlPoint1: CGPointMake(404.62, 337.66) controlPoint2: CGPointMake(397.26, 331.46)];
    [bezier6Path addCurveToPoint: CGPointMake(418.85, 321.34) controlPoint1: CGPointMake(407.01, 322.84) controlPoint2: CGPointMake(418.85, 321.34)];
    [bezier6Path addCurveToPoint: CGPointMake(404.62, 318.17) controlPoint1: CGPointMake(418.85, 321.34) controlPoint2: CGPointMake(407.78, 319.75)];
    [bezier6Path addCurveToPoint: CGPointMake(403.57, 307.11) controlPoint1: CGPointMake(401.46, 316.59) controlPoint2: CGPointMake(402.12, 310.11)];
    [bezier6Path addCurveToPoint: CGPointMake(418.85, 302.9) controlPoint1: CGPointMake(405.73, 302.62) controlPoint2: CGPointMake(418.85, 302.9)];
    [bezier6Path addCurveToPoint: CGPointMake(403.57, 299.74) controlPoint1: CGPointMake(418.85, 302.9) controlPoint2: CGPointMake(406.25, 301.69)];
    [bezier6Path addCurveToPoint: CGPointMake(403.57, 286.04) controlPoint1: CGPointMake(400.89, 297.78) controlPoint2: CGPointMake(400.45, 287.91)];
    [bezier6Path addCurveToPoint: CGPointMake(418.85, 282.35) controlPoint1: CGPointMake(406.2, 284.46) controlPoint2: CGPointMake(418.85, 282.35)];
    [bezier6Path addCurveToPoint: CGPointMake(403.57, 279.19) controlPoint1: CGPointMake(418.85, 282.35) controlPoint2: CGPointMake(405.14, 281.07)];
    [bezier6Path addCurveToPoint: CGPointMake(403.04, 268.65) controlPoint1: CGPointMake(400.93, 276.03) controlPoint2: CGPointMake(400.93, 270.76)];
    [bezier6Path addCurveToPoint: CGPointMake(418.85, 263.38) controlPoint1: CGPointMake(405.15, 266.54) controlPoint2: CGPointMake(418.85, 263.38)];
    [bezier6Path addCurveToPoint: CGPointMake(403.04, 261.8) controlPoint1: CGPointMake(418.85, 263.38) controlPoint2: CGPointMake(405.15, 263.91)];
    [bezier6Path addCurveToPoint: CGPointMake(402.51, 251.27) controlPoint1: CGPointMake(400.93, 259.7) controlPoint2: CGPointMake(401.46, 253.9)];
    [bezier6Path addCurveToPoint: CGPointMake(417.26, 246) controlPoint1: CGPointMake(403.57, 248.63) controlPoint2: CGPointMake(417.26, 246)];
    [bezier6Path addCurveToPoint: CGPointMake(402.51, 243.89) controlPoint1: CGPointMake(417.26, 246) controlPoint2: CGPointMake(405.15, 246)];
    [bezier6Path addCurveToPoint: CGPointMake(401.99, 231.77) controlPoint1: CGPointMake(400.98, 242.67) controlPoint2: CGPointMake(400.78, 233.97)];
    [bezier6Path addCurveToPoint: CGPointMake(418.85, 228.08) controlPoint1: CGPointMake(403.2, 229.57) controlPoint2: CGPointMake(418.85, 228.08)];
    [bezier6Path addCurveToPoint: CGPointMake(401.99, 224.4) controlPoint1: CGPointMake(418.85, 228.08) controlPoint2: CGPointMake(404.09, 228.08)];
    [bezier6Path addCurveToPoint: CGPointMake(401.99, 214.39) controlPoint1: CGPointMake(399.6, 220.22) controlPoint2: CGPointMake(400.74, 215.22)];
    [bezier6Path addCurveToPoint: CGPointMake(418.85, 210.7) controlPoint1: CGPointMake(405.15, 212.28) controlPoint2: CGPointMake(418.85, 210.7)];
    [bezier6Path addCurveToPoint: CGPointMake(401.99, 207.54) controlPoint1: CGPointMake(418.85, 210.7) controlPoint2: CGPointMake(405.15, 209.65)];
    [bezier6Path addCurveToPoint: CGPointMake(402.51, 195.95) controlPoint1: CGPointMake(400.17, 206.32) controlPoint2: CGPointMake(399.35, 197)];
    [bezier6Path addCurveToPoint: CGPointMake(419.37, 193.31) controlPoint1: CGPointMake(405.67, 194.89) controlPoint2: CGPointMake(419.37, 193.31)];
    [bezier6Path addCurveToPoint: CGPointMake(402.51, 189.1) controlPoint1: CGPointMake(419.37, 193.31) controlPoint2: CGPointMake(404.42, 189.73)];
    [bezier6Path addCurveToPoint: CGPointMake(401.99, 176.98) controlPoint1: CGPointMake(399.35, 188.05) controlPoint2: CGPointMake(399.75, 177.73)];
    [bezier6Path addCurveToPoint: CGPointMake(419.9, 175.4) controlPoint1: CGPointMake(405.15, 175.93) controlPoint2: CGPointMake(419.9, 175.4)];
    [bezier6Path addCurveToPoint: CGPointMake(402.51, 172.24) controlPoint1: CGPointMake(419.9, 175.4) controlPoint2: CGPointMake(406.2, 173.29)];
    [bezier6Path addCurveToPoint: CGPointMake(402.51, 161.18) controlPoint1: CGPointMake(399.51, 171.38) controlPoint2: CGPointMake(398.83, 162.23)];
    [bezier6Path addCurveToPoint: CGPointMake(419.37, 158.02) controlPoint1: CGPointMake(404.53, 160.6) controlPoint2: CGPointMake(419.37, 158.02)];
    [bezier6Path addCurveToPoint: CGPointMake(403.04, 155.91) controlPoint1: CGPointMake(419.37, 158.02) controlPoint2: CGPointMake(407.25, 156.43)];
    [bezier6Path addCurveToPoint: CGPointMake(402.12, 144.78) controlPoint1: CGPointMake(398.83, 155.38) controlPoint2: CGPointMake(399.88, 145.9)];
    [bezier6Path addCurveToPoint: CGPointMake(419.37, 141.16) controlPoint1: CGPointMake(404.36, 143.66) controlPoint2: CGPointMake(419.37, 141.16)];
    [bezier6Path addCurveToPoint: CGPointMake(402.65, 138.46) controlPoint1: CGPointMake(419.37, 141.16) controlPoint2: CGPointMake(404.62, 140.1)];
    [bezier6Path addCurveToPoint: CGPointMake(401.86, 127.66) controlPoint1: CGPointMake(400.42, 136.6) controlPoint2: CGPointMake(399.62, 129.96)];
    [bezier6Path addCurveToPoint: CGPointMake(417.66, 124.5) controlPoint1: CGPointMake(404.09, 125.35) controlPoint2: CGPointMake(417.66, 124.5)];
    [bezier6Path addCurveToPoint: CGPointMake(403.44, 122.39) controlPoint1: CGPointMake(417.66, 124.5) controlPoint2: CGPointMake(404.23, 122.39)];
    [bezier6Path addCurveToPoint: CGPointMake(401.86, 111.85) controlPoint1: CGPointMake(400.8, 122.39) controlPoint2: CGPointMake(399.22, 115.01)];
    [bezier6Path addCurveToPoint: CGPointMake(417.66, 109.22) controlPoint1: CGPointMake(402.97, 110.51) controlPoint2: CGPointMake(417.66, 109.22)];
    [bezier6Path addCurveToPoint: CGPointMake(401.86, 106.58) controlPoint1: CGPointMake(417.66, 109.22) controlPoint2: CGPointMake(405.43, 109.8)];
    [bezier6Path addCurveToPoint: CGPointMake(401.99, 96.38) controlPoint1: CGPointMake(399.83, 104.75) controlPoint2: CGPointMake(400.08, 97.71)];
    [bezier6Path addCurveToPoint: CGPointMake(418.32, 93.74) controlPoint1: CGPointMake(403.35, 95.42) controlPoint2: CGPointMake(418.32, 93.74)];
    [bezier6Path addCurveToPoint: CGPointMake(403.04, 91.11) controlPoint1: CGPointMake(418.32, 93.74) controlPoint2: CGPointMake(405.15, 94.27)];
    [bezier6Path addCurveToPoint: CGPointMake(403.04, 83.2) controlPoint1: CGPointMake(400.39, 87.13) controlPoint2: CGPointMake(402.92, 83.49)];
    [bezier6Path addCurveToPoint: CGPointMake(415.68, 79.52) controlPoint1: CGPointMake(403.55, 81.95) controlPoint2: CGPointMake(415.68, 79.52)];
    [bezier6Path addCurveToPoint: CGPointMake(406.2, 77.41) controlPoint1: CGPointMake(415.68, 79.52) controlPoint2: CGPointMake(407.82, 78.45)];
    [bezier6Path addCurveToPoint: CGPointMake(408.31, 68.98) controlPoint1: CGPointMake(404.56, 76.35) controlPoint2: CGPointMake(406.63, 69.85)];
    [bezier6Path addCurveToPoint: CGPointMake(422.05, 68.28) controlPoint1: CGPointMake(409.99, 68.11) controlPoint2: CGPointMake(422.05, 68.28)];
    [bezier6Path addCurveToPoint: CGPointMake(409.4, 66.74) controlPoint1: CGPointMake(422.05, 68.28) controlPoint2: CGPointMake(410.98, 67.27)];
    [bezier6Path addCurveToPoint: CGPointMake(408.79, 62.62) controlPoint1: CGPointMake(408.26, 66.36) controlPoint2: CGPointMake(408.03, 63.75)];
    [bezier6Path addCurveToPoint: CGPointMake(417.26, 60.3) controlPoint1: CGPointMake(409.27, 61.89) controlPoint2: CGPointMake(416.37, 60.81)];
    [bezier6Path addCurveToPoint: CGPointMake(413.65, 59.79) controlPoint1: CGPointMake(417, 60.36) controlPoint2: CGPointMake(414.58, 59.82)];
    [bezier6Path addCurveToPoint: CGPointMake(412.45, 54.54) controlPoint1: CGPointMake(411.91, 59.73) controlPoint2: CGPointMake(412.45, 54.54)];
    [bezier6Path addLineToPoint: CGPointMake(412.45, 47.03)];
    [bezier6Path addLineToPoint: CGPointMake(416.14, 46.87)];
    [bezier6Path closePath];
    [color setFill];
    [bezier6Path fill];


    //// Text Drawing
    CGRect textRect = CGRectMake(203, 607, 68, 66);
    {
        NSString* textContent = @"tap";
        NSMutableParagraphStyle* textStyle = NSMutableParagraphStyle.defaultParagraphStyle.mutableCopy;
        textStyle.alignment = NSTextAlignmentLeft;

        NSDictionary* textFontAttributes = @{NSFontAttributeName: [UIFont fontWithName: @"AvenirNextCondensed-Medium" size: 47], NSForegroundColorAttributeName: black, NSParagraphStyleAttributeName: textStyle};

        CGFloat textTextHeight = [textContent boundingRectWithSize: CGSizeMake(textRect.size.width, INFINITY)  options: NSStringDrawingUsesLineFragmentOrigin attributes: textFontAttributes context: nil].size.height;
        CGContextSaveGState(context);
        CGContextClipToRect(context, textRect);
        [textContent drawInRect: CGRectMake(CGRectGetMinX(textRect), CGRectGetMinY(textRect) + (CGRectGetHeight(textRect) - textTextHeight) / 2, CGRectGetWidth(textRect), textTextHeight) withAttributes: textFontAttributes];
        CGContextRestoreGState(context);
    }


    //// Text 2 Drawing
    CGRect text2Rect = CGRectMake(120, 607, 83, 66);
    {
        NSString* textContent = @"wire";
        NSMutableParagraphStyle* text2Style = NSMutableParagraphStyle.defaultParagraphStyle.mutableCopy;
        text2Style.alignment = NSTextAlignmentLeft;

        NSDictionary* text2FontAttributes = @{NSFontAttributeName: [UIFont fontWithName: @"AvenirNextCondensed-Medium" size: 47], NSForegroundColorAttributeName: black, NSParagraphStyleAttributeName: text2Style};

        CGFloat text2TextHeight = [textContent boundingRectWithSize: CGSizeMake(text2Rect.size.width, INFINITY)  options: NSStringDrawingUsesLineFragmentOrigin attributes: text2FontAttributes context: nil].size.height;
        CGContextSaveGState(context);
        CGContextClipToRect(context, text2Rect);
        [textContent drawInRect: CGRectMake(CGRectGetMinX(text2Rect), CGRectGetMinY(text2Rect) + (CGRectGetHeight(text2Rect) - text2TextHeight) / 2, CGRectGetWidth(text2Rect), text2TextHeight) withAttributes: text2FontAttributes];
        CGContextRestoreGState(context);
    }


    //// Bezier 5 Drawing
    CGContextSaveGState(context);
    CGContextTranslateCTM(context, 542.72, -57.18);
    CGContextRotateCTM(context, -32.25 * M_PI / 180);

    UIBezierPath* bezier5Path = UIBezierPath.bezierPath;
    [bezier5Path moveToPoint: CGPointMake(1.34, -8.29)];
    [bezier5Path addCurveToPoint: CGPointMake(2.63, -5.34) controlPoint1: CGPointMake(2.75, -7.72) controlPoint2: CGPointMake(3.29, -6.53)];
    [bezier5Path addCurveToPoint: CGPointMake(-2.54, -1.84) controlPoint1: CGPointMake(1.98, -4.18) controlPoint2: CGPointMake(0.11, -3.02)];
    [bezier5Path addCurveToPoint: CGPointMake(-5.1, 0.04) controlPoint1: CGPointMake(-4.1, -1.14) controlPoint2: CGPointMake(-5.05, -0.31)];
    [bezier5Path addCurveToPoint: CGPointMake(-5.14, -0.17) controlPoint1: CGPointMake(-5.09, -0.06) controlPoint2: CGPointMake(-5.16, -0.19)];
    [bezier5Path addCurveToPoint: CGPointMake(-3.21, 0.1) controlPoint1: CGPointMake(-4.83, -0.02) controlPoint2: CGPointMake(-4.18, 0.1)];
    [bezier5Path addCurveToPoint: CGPointMake(5.43, 0.33) controlPoint1: CGPointMake(0.86, 0.1) controlPoint2: CGPointMake(3.96, -0.39)];
    [bezier5Path addCurveToPoint: CGPointMake(1.41, 10.93) controlPoint1: CGPointMake(7.91, 1.54) controlPoint2: CGPointMake(5.86, 11.38)];
    [bezier5Path addCurveToPoint: CGPointMake(-23.86, 21) controlPoint1: CGPointMake(-3.04, 10.49) controlPoint2: CGPointMake(-28.54, 8.75)];
    [bezier5Path addCurveToPoint: CGPointMake(-24.61, 46.55) controlPoint1: CGPointMake(-20.3, 30.35) controlPoint2: CGPointMake(-14.17, 41.35)];
    [bezier5Path addCurveToPoint: CGPointMake(-67.1, 44.57) controlPoint1: CGPointMake(-29.25, 48.86) controlPoint2: CGPointMake(-57.66, 40.26)];
    [bezier5Path addCurveToPoint: CGPointMake(-58.41, 70.15) controlPoint1: CGPointMake(-69.67, 45.73) controlPoint2: CGPointMake(-60.49, 67.36)];
    [bezier5Path addCurveToPoint: CGPointMake(-97.57, 79.74) controlPoint1: CGPointMake(-50.09, 81.31) controlPoint2: CGPointMake(-97.01, 77.92)];
    [bezier5Path addCurveToPoint: CGPointMake(-80.29, 104.83) controlPoint1: CGPointMake(-98.33, 82.23) controlPoint2: CGPointMake(-78.84, 93.62)];
    [bezier5Path addCurveToPoint: CGPointMake(-262.03, 522.24) controlPoint1: CGPointMake(-86.09, 149.64) controlPoint2: CGPointMake(-262.03, 522.24)];
    [bezier5Path addLineToPoint: CGPointMake(-459.94, 397.38)];
    [bezier5Path addCurveToPoint: CGPointMake(-90.87, 104.48) controlPoint1: CGPointMake(-459.94, 397.38) controlPoint2: CGPointMake(-124.41, 190.46)];
    [bezier5Path addCurveToPoint: CGPointMake(-106.37, 84.06) controlPoint1: CGPointMake(-87.59, 96.06) controlPoint2: CGPointMake(-105.1, 84.86)];
    [bezier5Path addCurveToPoint: CGPointMake(-102.51, 70.71) controlPoint1: CGPointMake(-110.6, 81.39) controlPoint2: CGPointMake(-109.94, 73.11)];
    [bezier5Path addCurveToPoint: CGPointMake(-68.69, 69.58) controlPoint1: CGPointMake(-99.36, 69.69) controlPoint2: CGPointMake(-90.98, 76.8)];
    [bezier5Path addCurveToPoint: CGPointMake(-71.42, 38.29) controlPoint1: CGPointMake(-62.79, 67.66) controlPoint2: CGPointMake(-83.62, 38.88)];
    [bezier5Path addCurveToPoint: CGPointMake(-27.23, 41.34) controlPoint1: CGPointMake(-54.22, 37.47) controlPoint2: CGPointMake(-29.86, 43.23)];
    [bezier5Path addCurveToPoint: CGPointMake(-29.69, 20.87) controlPoint1: CGPointMake(-22.16, 37.69) controlPoint2: CGPointMake(-27.09, 26.49)];
    [bezier5Path addCurveToPoint: CGPointMake(1.54, 6.06) controlPoint1: CGPointMake(-38.2, 2.5) controlPoint2: CGPointMake(-0.45, 8.73)];
    [bezier5Path addCurveToPoint: CGPointMake(2.44, 3.29) controlPoint1: CGPointMake(2.97, 4.14) controlPoint2: CGPointMake(2.99, 3.55)];
    [bezier5Path addCurveToPoint: CGPointMake(-3.21, 2.78) controlPoint1: CGPointMake(1.62, 2.89) controlPoint2: CGPointMake(0.21, 2.78)];
    [bezier5Path addCurveToPoint: CGPointMake(-8.08, -0.29) controlPoint1: CGPointMake(-6.33, 2.78) controlPoint2: CGPointMake(-8.36, 1.74)];
    [bezier5Path addCurveToPoint: CGPointMake(-3.88, -4.24) controlPoint1: CGPointMake(-7.87, -1.77) controlPoint2: CGPointMake(-6.25, -3.18)];
    [bezier5Path addCurveToPoint: CGPointMake(-0.05, -6.55) controlPoint1: CGPointMake(-1.84, -5.15) controlPoint2: CGPointMake(-0.3, -6.11)];
    [bezier5Path addCurveToPoint: CGPointMake(0.1, -5.84) controlPoint1: CGPointMake(-0.19, -6.31) controlPoint2: CGPointMake(0.01, -5.88)];
    [bezier5Path addCurveToPoint: CGPointMake(-3.21, -6.17) controlPoint1: CGPointMake(-0.37, -6.04) controlPoint2: CGPointMake(1.85, -4.27)];
    [bezier5Path addCurveToPoint: CGPointMake(-8.12, -9) controlPoint1: CGPointMake(-7.96, -7.95) controlPoint2: CGPointMake(-7.4, -7.9)];
    [bezier5Path addCurveToPoint: CGPointMake(-8.08, -13.08) controlPoint1: CGPointMake(-9.47, -11.04) controlPoint2: CGPointMake(-8.08, -13.08)];
    [bezier5Path addLineToPoint: CGPointMake(-5.96, -16.68)];
    [bezier5Path addLineToPoint: CGPointMake(-0.85, -17.22)];
    [bezier5Path addCurveToPoint: CGPointMake(-4.41, -10.4) controlPoint1: CGPointMake(-0.85, -17.22) controlPoint2: CGPointMake(-4.63, -10.46)];
    [color setFill];
    [bezier5Path fill];

    CGContextRestoreGState(context);


    //// Bezier 8 Drawing
    CGContextSaveGState(context);
    CGContextTranslateCTM(context, -96.75, -5.68);
    CGContextRotateCTM(context, -32.25 * M_PI / 180);

    UIBezierPath* bezier8Path = UIBezierPath.bezierPath;
    [bezier8Path moveToPoint: CGPointMake(1.34, -8.29)];
    [bezier8Path addCurveToPoint: CGPointMake(2.63, -5.34) controlPoint1: CGPointMake(2.75, -7.72) controlPoint2: CGPointMake(3.29, -6.53)];
    [bezier8Path addCurveToPoint: CGPointMake(-2.54, -1.84) controlPoint1: CGPointMake(1.98, -4.18) controlPoint2: CGPointMake(0.11, -3.02)];
    [bezier8Path addCurveToPoint: CGPointMake(-5.1, 0.04) controlPoint1: CGPointMake(-4.1, -1.14) controlPoint2: CGPointMake(-5.05, -0.31)];
    [bezier8Path addCurveToPoint: CGPointMake(-5.14, -0.17) controlPoint1: CGPointMake(-5.09, -0.06) controlPoint2: CGPointMake(-5.16, -0.19)];
    [bezier8Path addCurveToPoint: CGPointMake(-3.21, 0.1) controlPoint1: CGPointMake(-4.83, -0.02) controlPoint2: CGPointMake(-4.18, 0.1)];
    [bezier8Path addCurveToPoint: CGPointMake(5.43, 0.33) controlPoint1: CGPointMake(0.86, 0.1) controlPoint2: CGPointMake(3.96, -0.39)];
    [bezier8Path addCurveToPoint: CGPointMake(1.41, 10.93) controlPoint1: CGPointMake(7.91, 1.54) controlPoint2: CGPointMake(5.86, 11.38)];
    [bezier8Path addCurveToPoint: CGPointMake(-23.86, 21) controlPoint1: CGPointMake(-3.04, 10.49) controlPoint2: CGPointMake(-28.54, 8.75)];
    [bezier8Path addCurveToPoint: CGPointMake(-24.61, 46.55) controlPoint1: CGPointMake(-20.3, 30.35) controlPoint2: CGPointMake(-14.17, 41.35)];
    [bezier8Path addCurveToPoint: CGPointMake(-67.1, 44.57) controlPoint1: CGPointMake(-29.25, 48.86) controlPoint2: CGPointMake(-57.66, 40.26)];
    [bezier8Path addCurveToPoint: CGPointMake(-58.41, 70.15) controlPoint1: CGPointMake(-69.67, 45.73) controlPoint2: CGPointMake(-60.49, 67.36)];
    [bezier8Path addCurveToPoint: CGPointMake(-97.57, 79.74) controlPoint1: CGPointMake(-50.09, 81.31) controlPoint2: CGPointMake(-97.01, 77.92)];
    [bezier8Path addCurveToPoint: CGPointMake(-81.93, 116.8) controlPoint1: CGPointMake(-98.33, 82.23) controlPoint2: CGPointMake(-70.01, 105.4)];
    [bezier8Path addCurveToPoint: CGPointMake(-103.2, 109.29) controlPoint1: CGPointMake(-84.91, 119.65) controlPoint2: CGPointMake(-101.65, 104.24)];
    [bezier8Path addCurveToPoint: CGPointMake(-93.67, 135.4) controlPoint1: CGPointMake(-104.3, 112.86) controlPoint2: CGPointMake(-91.17, 121.05)];
    [bezier8Path addCurveToPoint: CGPointMake(-128.51, 128.79) controlPoint1: CGPointMake(-96.82, 153.52) controlPoint2: CGPointMake(-122.87, 121.71)];
    [bezier8Path addCurveToPoint: CGPointMake(-126.68, 146.5) controlPoint1: CGPointMake(-131.8, 132.92) controlPoint2: CGPointMake(-135.23, 135.23)];
    [bezier8Path addCurveToPoint: CGPointMake(-112.69, 173.06) controlPoint1: CGPointMake(-116.35, 160.11) controlPoint2: CGPointMake(-110.45, 166.79)];
    [bezier8Path addCurveToPoint: CGPointMake(-137.34, 185.89) controlPoint1: CGPointMake(-114.6, 178.38) controlPoint2: CGPointMake(-132.22, 177.89)];
    [bezier8Path addCurveToPoint: CGPointMake(-146.31, 226.34) controlPoint1: CGPointMake(-144.92, 197.71) controlPoint2: CGPointMake(-138.21, 215.97)];
    [bezier8Path addCurveToPoint: CGPointMake(-173.81, 213.72) controlPoint1: CGPointMake(-149.86, 230.9) controlPoint2: CGPointMake(-162.99, 210.16)];
    [bezier8Path addCurveToPoint: CGPointMake(-210.04, 207.42) controlPoint1: CGPointMake(-181.83, 216.35) controlPoint2: CGPointMake(-216.59, 195.31)];
    [bezier8Path addCurveToPoint: CGPointMake(-198.89, 253.47) controlPoint1: CGPointMake(-205.87, 215.13) controlPoint2: CGPointMake(-188.9, 253.57)];
    [bezier8Path addCurveToPoint: CGPointMake(-260.53, 240.6) controlPoint1: CGPointMake(-206.96, 253.39) controlPoint2: CGPointMake(-249.09, 227.76)];
    [bezier8Path addCurveToPoint: CGPointMake(-251.12, 272.54) controlPoint1: CGPointMake(-264.58, 245.14) controlPoint2: CGPointMake(-243.47, 270.18)];
    [bezier8Path addCurveToPoint: CGPointMake(-317.92, 275.34) controlPoint1: CGPointMake(-268.74, 277.98) controlPoint2: CGPointMake(-316.27, 258.84)];
    [bezier8Path addCurveToPoint: CGPointMake(-261.43, 303.88) controlPoint1: CGPointMake(-318.8, 284.24) controlPoint2: CGPointMake(-269.63, 286.88)];
    [bezier8Path addCurveToPoint: CGPointMake(-283.14, 323.29) controlPoint1: CGPointMake(-256.51, 314.07) controlPoint2: CGPointMake(-273.28, 318.2)];
    [bezier8Path addCurveToPoint: CGPointMake(-330.53, 325.32) controlPoint1: CGPointMake(-293.26, 328.51) controlPoint2: CGPointMake(-312.65, 325.97)];
    [bezier8Path addCurveToPoint: CGPointMake(-355, 322.88) controlPoint1: CGPointMake(-343.61, 324.84) controlPoint2: CGPointMake(-347.83, 280.59)];
    [bezier8Path addCurveToPoint: CGPointMake(-406.16, 362.74) controlPoint1: CGPointMake(-357.18, 335.7) controlPoint2: CGPointMake(-376.12, 354.49)];
    [bezier8Path addCurveToPoint: CGPointMake(-400.09, 383.11) controlPoint1: CGPointMake(-430.75, 369.49) controlPoint2: CGPointMake(-408.92, 380.28)];
    [bezier8Path addCurveToPoint: CGPointMake(-278.97, 466.62) controlPoint1: CGPointMake(-369.61, 392.89) controlPoint2: CGPointMake(-306.26, 393.88)];
    [bezier8Path addCurveToPoint: CGPointMake(-197.25, 494.52) controlPoint1: CGPointMake(-266.18, 500.7) controlPoint2: CGPointMake(-196.01, 466.12)];
    [bezier8Path addCurveToPoint: CGPointMake(-252.23, 536.69) controlPoint1: CGPointMake(-198.66, 526.74) controlPoint2: CGPointMake(-229.37, 543.11)];
    [bezier8Path addCurveToPoint: CGPointMake(-346.88, 458.07) controlPoint1: CGPointMake(-326.56, 515.82) controlPoint2: CGPointMake(-321.95, 478.52)];
    [bezier8Path addCurveToPoint: CGPointMake(-422.23, 429.45) controlPoint1: CGPointMake(-371.81, 437.61) controlPoint2: CGPointMake(-386.93, 454.08)];
    [bezier8Path addCurveToPoint: CGPointMake(-437.45, 342.99) controlPoint1: CGPointMake(-457.53, 404.81) controlPoint2: CGPointMake(-458.8, 354.35)];
    [bezier8Path addCurveToPoint: CGPointMake(-375.91, 329.79) controlPoint1: CGPointMake(-431.77, 339.97) controlPoint2: CGPointMake(-379.55, 333.88)];
    [bezier8Path addCurveToPoint: CGPointMake(-353.34, 279) controlPoint1: CGPointMake(-366.84, 319.59) controlPoint2: CGPointMake(-366.69, 281.1)];
    [bezier8Path addCurveToPoint: CGPointMake(-325.69, 308.27) controlPoint1: CGPointMake(-343.11, 277.4) controlPoint2: CGPointMake(-333.7, 302.23)];
    [bezier8Path addCurveToPoint: CGPointMake(-283.06, 304.42) controlPoint1: CGPointMake(-316.07, 315.52) controlPoint2: CGPointMake(-271.96, 307.15)];
    [bezier8Path addCurveToPoint: CGPointMake(-338.03, 269.74) controlPoint1: CGPointMake(-301.48, 299.89) controlPoint2: CGPointMake(-341.05, 282.02)];
    [bezier8Path addCurveToPoint: CGPointMake(-264.66, 264.01) controlPoint1: CGPointMake(-331.91, 244.84) controlPoint2: CGPointMake(-272.45, 269.32)];
    [bezier8Path addCurveToPoint: CGPointMake(-269.7, 228.9) controlPoint1: CGPointMake(-255.99, 258.1) controlPoint2: CGPointMake(-280.44, 233.56)];
    [bezier8Path addCurveToPoint: CGPointMake(-209.22, 239.86) controlPoint1: CGPointMake(-245.28, 218.3) controlPoint2: CGPointMake(-221.05, 237.98)];
    [bezier8Path addCurveToPoint: CGPointMake(-224.82, 193.37) controlPoint1: CGPointMake(-194.18, 242.25) controlPoint2: CGPointMake(-231.08, 198.55)];
    [bezier8Path addCurveToPoint: CGPointMake(-179.69, 200.55) controlPoint1: CGPointMake(-216.43, 186.41) controlPoint2: CGPointMake(-187.47, 207.46)];
    [bezier8Path addCurveToPoint: CGPointMake(-151.75, 208.72) controlPoint1: CGPointMake(-171.96, 193.68) controlPoint2: CGPointMake(-158.44, 215.57)];
    [bezier8Path addCurveToPoint: CGPointMake(-144.95, 181.09) controlPoint1: CGPointMake(-150.3, 207.24) controlPoint2: CGPointMake(-152.42, 191.8)];
    [bezier8Path addCurveToPoint: CGPointMake(-124.53, 165.59) controlPoint1: CGPointMake(-138.83, 172.31) controlPoint2: CGPointMake(-122.47, 168.11)];
    [bezier8Path addCurveToPoint: CGPointMake(-132.39, 118.07) controlPoint1: CGPointMake(-138.56, 148.46) controlPoint2: CGPointMake(-150.26, 136.08)];
    [bezier8Path addCurveToPoint: CGPointMake(-102.12, 130.07) controlPoint1: CGPointMake(-125.9, 111.52) controlPoint2: CGPointMake(-104.01, 132.58)];
    [bezier8Path addCurveToPoint: CGPointMake(-112.51, 103.42) controlPoint1: CGPointMake(-99.09, 126.04) controlPoint2: CGPointMake(-117.31, 111.03)];
    [bezier8Path addCurveToPoint: CGPointMake(-90.57, 104.25) controlPoint1: CGPointMake(-106.49, 93.88) controlPoint2: CGPointMake(-92.17, 108.35)];
    [bezier8Path addCurveToPoint: CGPointMake(-106.37, 84.06) controlPoint1: CGPointMake(-87.29, 95.84) controlPoint2: CGPointMake(-105.1, 84.86)];
    [bezier8Path addCurveToPoint: CGPointMake(-102.51, 70.71) controlPoint1: CGPointMake(-110.6, 81.39) controlPoint2: CGPointMake(-109.94, 73.11)];
    [bezier8Path addCurveToPoint: CGPointMake(-68.69, 69.58) controlPoint1: CGPointMake(-99.36, 69.69) controlPoint2: CGPointMake(-90.98, 76.8)];
    [bezier8Path addCurveToPoint: CGPointMake(-71.42, 38.29) controlPoint1: CGPointMake(-62.79, 67.66) controlPoint2: CGPointMake(-83.62, 38.88)];
    [bezier8Path addCurveToPoint: CGPointMake(-27.23, 41.34) controlPoint1: CGPointMake(-54.22, 37.47) controlPoint2: CGPointMake(-29.86, 43.23)];
    [bezier8Path addCurveToPoint: CGPointMake(-29.69, 20.87) controlPoint1: CGPointMake(-22.16, 37.69) controlPoint2: CGPointMake(-27.09, 26.49)];
    [bezier8Path addCurveToPoint: CGPointMake(1.54, 6.06) controlPoint1: CGPointMake(-38.2, 2.5) controlPoint2: CGPointMake(-0.45, 8.73)];
    [bezier8Path addCurveToPoint: CGPointMake(2.44, 3.29) controlPoint1: CGPointMake(2.97, 4.14) controlPoint2: CGPointMake(2.99, 3.55)];
    [bezier8Path addCurveToPoint: CGPointMake(-3.21, 2.78) controlPoint1: CGPointMake(1.62, 2.89) controlPoint2: CGPointMake(0.21, 2.78)];
    [bezier8Path addCurveToPoint: CGPointMake(-8.08, -0.29) controlPoint1: CGPointMake(-6.33, 2.78) controlPoint2: CGPointMake(-8.36, 1.74)];
    [bezier8Path addCurveToPoint: CGPointMake(-3.88, -4.24) controlPoint1: CGPointMake(-7.87, -1.77) controlPoint2: CGPointMake(-6.25, -3.18)];
    [bezier8Path addCurveToPoint: CGPointMake(-0.05, -6.55) controlPoint1: CGPointMake(-1.84, -5.15) controlPoint2: CGPointMake(-0.3, -6.11)];
    [bezier8Path addCurveToPoint: CGPointMake(0.1, -5.84) controlPoint1: CGPointMake(-0.19, -6.31) controlPoint2: CGPointMake(0.01, -5.88)];
    [bezier8Path addCurveToPoint: CGPointMake(-3.21, -6.17) controlPoint1: CGPointMake(-0.37, -6.04) controlPoint2: CGPointMake(1.85, -4.27)];
    [bezier8Path addCurveToPoint: CGPointMake(-8.12, -9) controlPoint1: CGPointMake(-7.96, -7.95) controlPoint2: CGPointMake(-7.4, -7.9)];
    [bezier8Path addCurveToPoint: CGPointMake(-8.08, -13.08) controlPoint1: CGPointMake(-9.47, -11.04) controlPoint2: CGPointMake(-8.08, -13.08)];
    [bezier8Path addLineToPoint: CGPointMake(-5.96, -16.68)];
    [bezier8Path addLineToPoint: CGPointMake(-0.85, -17.22)];
    [bezier8Path addCurveToPoint: CGPointMake(-4.41, -10.4) controlPoint1: CGPointMake(-0.85, -17.22) controlPoint2: CGPointMake(-4.63, -10.46)];
    [color setFill];
    [bezier8Path fill];

    CGContextRestoreGState(context);


    //// Bezier 4 Drawing
    CGContextSaveGState(context);
    CGContextTranslateCTM(context, 510.32, -0.78);
    CGContextRotateCTM(context, -32.25 * M_PI / 180);

    UIBezierPath* bezier4Path = UIBezierPath.bezierPath;
    [bezier4Path moveToPoint: CGPointMake(1.41, -8.29)];
    [bezier4Path addCurveToPoint: CGPointMake(2.7, -5.34) controlPoint1: CGPointMake(2.81, -7.72) controlPoint2: CGPointMake(3.36, -6.53)];
    [bezier4Path addCurveToPoint: CGPointMake(-2.48, -1.84) controlPoint1: CGPointMake(2.04, -4.18) controlPoint2: CGPointMake(0.18, -3.02)];
    [bezier4Path addCurveToPoint: CGPointMake(-5.03, 0.04) controlPoint1: CGPointMake(-4.03, -1.14) controlPoint2: CGPointMake(-4.98, -0.31)];
    [bezier4Path addCurveToPoint: CGPointMake(-5.07, -0.17) controlPoint1: CGPointMake(-5.02, -0.06) controlPoint2: CGPointMake(-5.1, -0.19)];
    [bezier4Path addCurveToPoint: CGPointMake(-3.15, 0.1) controlPoint1: CGPointMake(-4.77, -0.02) controlPoint2: CGPointMake(-4.11, 0.1)];
    [bezier4Path addCurveToPoint: CGPointMake(6.83, 0.63) controlPoint1: CGPointMake(0.93, 0.1) controlPoint2: CGPointMake(5.36, -0.09)];
    [bezier4Path addCurveToPoint: CGPointMake(1.48, 10.93) controlPoint1: CGPointMake(9.31, 1.84) controlPoint2: CGPointMake(1.48, 10.93)];
    [bezier4Path addCurveToPoint: CGPointMake(-50.32, 34.93) controlPoint1: CGPointMake(1.48, 10.93) controlPoint2: CGPointMake(-9, 25.11)];
    [bezier4Path addCurveToPoint: CGPointMake(-152.47, 18.7) controlPoint1: CGPointMake(-76.37, 41.12) controlPoint2: CGPointMake(-125.59, 21.14)];
    [bezier4Path addCurveToPoint: CGPointMake(-180.12, 28.8) controlPoint1: CGPointMake(-170.28, 17.09) controlPoint2: CGPointMake(-180.11, 28.43)];
    [bezier4Path addCurveToPoint: CGPointMake(-82.49, 114.04) controlPoint1: CGPointMake(-180.25, 34.63) controlPoint2: CGPointMake(-74.86, 101.95)];
    [bezier4Path addCurveToPoint: CGPointMake(-95.84, 112.71) controlPoint1: CGPointMake(-83.59, 115.78) controlPoint2: CGPointMake(-89.6, 117.82)];
    [bezier4Path addCurveToPoint: CGPointMake(-113.01, 113.7) controlPoint1: CGPointMake(-101.88, 107.75) controlPoint2: CGPointMake(-106.35, 115.52)];
    [bezier4Path addCurveToPoint: CGPointMake(-141.17, 111.28) controlPoint1: CGPointMake(-126.13, 110.12) controlPoint2: CGPointMake(-137.96, 102.82)];
    [bezier4Path addCurveToPoint: CGPointMake(-126.85, 126.25) controlPoint1: CGPointMake(-142.05, 113.59) controlPoint2: CGPointMake(-137.62, 117.09)];
    [bezier4Path addCurveToPoint: CGPointMake(-119.18, 144.09) controlPoint1: CGPointMake(-115.81, 135.64) controlPoint2: CGPointMake(-118.21, 141.35)];
    [bezier4Path addCurveToPoint: CGPointMake(-138.78, 150.69) controlPoint1: CGPointMake(-120.92, 148.99) controlPoint2: CGPointMake(-138.33, 143.59)];
    [bezier4Path addCurveToPoint: CGPointMake(-164.7, 154.4) controlPoint1: CGPointMake(-139.58, 163.19) controlPoint2: CGPointMake(-174.84, 137.64)];
    [bezier4Path addCurveToPoint: CGPointMake(-172.04, 160.41) controlPoint1: CGPointMake(-162.55, 157.95) controlPoint2: CGPointMake(-162, 161.93)];
    [bezier4Path addCurveToPoint: CGPointMake(-201.46, 148.94) controlPoint1: CGPointMake(-179.42, 159.29) controlPoint2: CGPointMake(-191.97, 151.15)];
    [bezier4Path addCurveToPoint: CGPointMake(-210.74, 188.02) controlPoint1: CGPointMake(-213.83, 146.06) controlPoint2: CGPointMake(-195.49, 209.76)];
    [bezier4Path addCurveToPoint: CGPointMake(-221.29, 176.63) controlPoint1: CGPointMake(-214.34, 182.88) controlPoint2: CGPointMake(-217.18, 177.28)];
    [bezier4Path addCurveToPoint: CGPointMake(-238.73, 189.28) controlPoint1: CGPointMake(-230.73, 175.15) controlPoint2: CGPointMake(-241.55, 176.83)];
    [bezier4Path addCurveToPoint: CGPointMake(-228.75, 210.94) controlPoint1: CGPointMake(-236.23, 200.31) controlPoint2: CGPointMake(-228.2, 198.44)];
    [bezier4Path addCurveToPoint: CGPointMake(-280.72, 218.36) controlPoint1: CGPointMake(-229.1, 219) controlPoint2: CGPointMake(-285.59, 204.91)];
    [bezier4Path addCurveToPoint: CGPointMake(-263.08, 257.86) controlPoint1: CGPointMake(-276.84, 229.08) controlPoint2: CGPointMake(-246.36, 238.85)];
    [bezier4Path addCurveToPoint: CGPointMake(-246.03, 262.71) controlPoint1: CGPointMake(-272.72, 268.83) controlPoint2: CGPointMake(-248.44, 255.28)];
    [bezier4Path addCurveToPoint: CGPointMake(-268.9, 280.21) controlPoint1: CGPointMake(-243.63, 270.11) controlPoint2: CGPointMake(-246.79, 278.94)];
    [bezier4Path addCurveToPoint: CGPointMake(-293.1, 288.59) controlPoint1: CGPointMake(-277.48, 280.7) controlPoint2: CGPointMake(-290.86, 278.47)];
    [bezier4Path addCurveToPoint: CGPointMake(-299.22, 332.02) controlPoint1: CGPointMake(-294.39, 294.43) controlPoint2: CGPointMake(-287.58, 327.14)];
    [bezier4Path addCurveToPoint: CGPointMake(-348.95, 320.79) controlPoint1: CGPointMake(-310.14, 336.6) controlPoint2: CGPointMake(-341.91, 309.62)];
    [bezier4Path addCurveToPoint: CGPointMake(-375.94, 361.7) controlPoint1: CGPointMake(-351.09, 324.17) controlPoint2: CGPointMake(-361.45, 350)];
    [bezier4Path addCurveToPoint: CGPointMake(-400.51, 355.66) controlPoint1: CGPointMake(-378.32, 363.62) controlPoint2: CGPointMake(-397.53, 352.81)];
    [bezier4Path addCurveToPoint: CGPointMake(-398.01, 366.69) controlPoint1: CGPointMake(-407.47, 362.31) controlPoint2: CGPointMake(-401.15, 364.71)];
    [bezier4Path addCurveToPoint: CGPointMake(-382.99, 365.48) controlPoint1: CGPointMake(-398.01, 366.69) controlPoint2: CGPointMake(-396.26, 356.95)];
    [bezier4Path addCurveToPoint: CGPointMake(-377.27, 375.05) controlPoint1: CGPointMake(-379.68, 367.62) controlPoint2: CGPointMake(-376.25, 372.43)];
    [bezier4Path addCurveToPoint: CGPointMake(-383.85, 377.99) controlPoint1: CGPointMake(-378.16, 377.33) controlPoint2: CGPointMake(-379.74, 376.61)];
    [bezier4Path addCurveToPoint: CGPointMake(-381.45, 385.42) controlPoint1: CGPointMake(-386.69, 378.93) controlPoint2: CGPointMake(-385.99, 381.37)];
    [bezier4Path addCurveToPoint: CGPointMake(-393.46, 393.21) controlPoint1: CGPointMake(-376.91, 389.46) controlPoint2: CGPointMake(-384.06, 402.68)];
    [bezier4Path addCurveToPoint: CGPointMake(-399.29, 393.08) controlPoint1: CGPointMake(-395.81, 390.84) controlPoint2: CGPointMake(-399.6, 391.7)];
    [bezier4Path addCurveToPoint: CGPointMake(-398.89, 398.06) controlPoint1: CGPointMake(-399.19, 393.5) controlPoint2: CGPointMake(-398.99, 397.59)];
    [bezier4Path addCurveToPoint: CGPointMake(-400.66, 404.74) controlPoint1: CGPointMake(-398.57, 399.44) controlPoint2: CGPointMake(-400.66, 404.74)];
    [bezier4Path addLineToPoint: CGPointMake(-404.29, 403.14)];
    [bezier4Path addCurveToPoint: CGPointMake(-402.49, 398.15) controlPoint1: CGPointMake(-404.29, 403.14) controlPoint2: CGPointMake(-403.65, 401.37)];
    [bezier4Path addCurveToPoint: CGPointMake(-402.14, 390.1) controlPoint1: CGPointMake(-402.18, 395.79) controlPoint2: CGPointMake(-403.05, 392.75)];
    [bezier4Path addCurveToPoint: CGPointMake(-397.78, 386.94) controlPoint1: CGPointMake(-401.21, 387.42) controlPoint2: CGPointMake(-398.92, 386.83)];
    [bezier4Path addCurveToPoint: CGPointMake(-388.48, 392.81) controlPoint1: CGPointMake(-395.55, 387.16) controlPoint2: CGPointMake(-391.85, 391.55)];
    [bezier4Path addCurveToPoint: CGPointMake(-383.05, 387.95) controlPoint1: CGPointMake(-385.71, 393.84) controlPoint2: CGPointMake(-381.89, 389.87)];
    [bezier4Path addCurveToPoint: CGPointMake(-385.86, 375.54) controlPoint1: CGPointMake(-384.73, 385.18) controlPoint2: CGPointMake(-393.93, 376.01)];
    [bezier4Path addCurveToPoint: CGPointMake(-384.66, 368.02) controlPoint1: CGPointMake(-377.34, 375.05) controlPoint2: CGPointMake(-381.28, 370.15)];
    [bezier4Path addCurveToPoint: CGPointMake(-392.49, 365.44) controlPoint1: CGPointMake(-386.8, 366.67) controlPoint2: CGPointMake(-390.77, 364.69)];
    [bezier4Path addCurveToPoint: CGPointMake(-396.76, 372.21) controlPoint1: CGPointMake(-394.67, 366.39) controlPoint2: CGPointMake(-394.92, 372.96)];
    [bezier4Path addCurveToPoint: CGPointMake(-405.84, 364.11) controlPoint1: CGPointMake(-400.17, 370.83) controlPoint2: CGPointMake(-404.96, 365.21)];
    [bezier4Path addCurveToPoint: CGPointMake(-398.38, 352.27) controlPoint1: CGPointMake(-408.78, 360.49) controlPoint2: CGPointMake(-407.86, 351.33)];
    [bezier4Path addCurveToPoint: CGPointMake(-377.72, 357.02) controlPoint1: CGPointMake(-393.92, 352.72) controlPoint2: CGPointMake(-380.88, 359.21)];
    [bezier4Path addCurveToPoint: CGPointMake(-350.45, 313.89) controlPoint1: CGPointMake(-364.65, 347.96) controlPoint2: CGPointMake(-353.82, 315.83)];
    [bezier4Path addCurveToPoint: CGPointMake(-299.71, 323.43) controlPoint1: CGPointMake(-342.68, 309.41) controlPoint2: CGPointMake(-299.17, 332.82)];
    [bezier4Path addCurveToPoint: CGPointMake(-295.82, 279.78) controlPoint1: CGPointMake(-300.21, 314.84) controlPoint2: CGPointMake(-301.29, 283.32)];
    [bezier4Path addCurveToPoint: CGPointMake(-256.66, 270.19) controlPoint1: CGPointMake(-286.4, 273.68) controlPoint2: CGPointMake(-261.28, 273.49)];
    [bezier4Path addCurveToPoint: CGPointMake(-260.89, 267.52) controlPoint1: CGPointMake(-251.41, 266.43) controlPoint2: CGPointMake(-257.93, 266.24)];
    [bezier4Path addCurveToPoint: CGPointMake(-271.89, 260.58) controlPoint1: CGPointMake(-282.03, 276.65) controlPoint2: CGPointMake(-275.69, 263.8)];
    [bezier4Path addCurveToPoint: CGPointMake(-265.04, 245.98) controlPoint1: CGPointMake(-267.57, 256.93) controlPoint2: CGPointMake(-263.27, 250.89)];
    [bezier4Path addCurveToPoint: CGPointMake(-290.02, 212.49) controlPoint1: CGPointMake(-269.51, 233.62) controlPoint2: CGPointMake(-291.09, 220.51)];
    [bezier4Path addCurveToPoint: CGPointMake(-237.83, 202.85) controlPoint1: CGPointMake(-288.45, 200.67) controlPoint2: CGPointMake(-228.78, 214.44)];
    [bezier4Path addCurveToPoint: CGPointMake(-213.86, 174.22) controlPoint1: CGPointMake(-263.35, 170.2) controlPoint2: CGPointMake(-218.1, 161.48)];
    [bezier4Path addCurveToPoint: CGPointMake(-206.72, 138.53) controlPoint1: CGPointMake(-209.88, 186.19) controlPoint2: CGPointMake(-218.48, 129.02)];
    [bezier4Path addCurveToPoint: CGPointMake(-172.31, 149.59) controlPoint1: CGPointMake(-193.4, 149.29) controlPoint2: CGPointMake(-168.53, 156.71)];
    [bezier4Path addCurveToPoint: CGPointMake(-145.48, 146.42) controlPoint1: CGPointMake(-184.44, 126.8) controlPoint2: CGPointMake(-153.03, 147.69)];
    [bezier4Path addCurveToPoint: CGPointMake(-141.75, 140.5) controlPoint1: CGPointMake(-142.76, 145.97) controlPoint2: CGPointMake(-143.87, 140.17)];
    [bezier4Path addCurveToPoint: CGPointMake(-136.81, 127.06) controlPoint1: CGPointMake(-128.03, 142.65) controlPoint2: CGPointMake(-122.91, 138.47)];
    [bezier4Path addCurveToPoint: CGPointMake(-149.55, 106.02) controlPoint1: CGPointMake(-143.05, 121.95) controlPoint2: CGPointMake(-156.2, 113.75)];
    [bezier4Path addCurveToPoint: CGPointMake(-113.51, 105.11) controlPoint1: CGPointMake(-135.73, 89.93) controlPoint2: CGPointMake(-124.32, 103.03)];
    [bezier4Path addCurveToPoint: CGPointMake(-95.17, 106.03) controlPoint1: CGPointMake(-102.48, 107.23) controlPoint2: CGPointMake(-99.4, 103.37)];
    [bezier4Path addCurveToPoint: CGPointMake(-106.3, 84.06) controlPoint1: CGPointMake(-78.26, 116.71) controlPoint2: CGPointMake(-105.03, 84.86)];
    [bezier4Path addCurveToPoint: CGPointMake(-183.5, 26.66) controlPoint1: CGPointMake(-110.53, 81.39) controlPoint2: CGPointMake(-190.93, 29.07)];
    [bezier4Path addCurveToPoint: CGPointMake(-150.07, 14.89) controlPoint1: CGPointMake(-182.95, 26.48) controlPoint2: CGPointMake(-175.78, 12.08)];
    [bezier4Path addCurveToPoint: CGPointMake(-52.32, 31.28) controlPoint1: CGPointMake(-124.29, 17.71) controlPoint2: CGPointMake(-79.95, 37.73)];
    [bezier4Path addCurveToPoint: CGPointMake(-1.55, 9.3) controlPoint1: CGPointMake(-10.7, 21.57) controlPoint2: CGPointMake(-1.55, 9.3)];
    [bezier4Path addCurveToPoint: CGPointMake(1.61, 6.06) controlPoint1: CGPointMake(-1.55, 9.3) controlPoint2: CGPointMake(1.41, 6.33)];
    [bezier4Path addCurveToPoint: CGPointMake(2.51, 3.29) controlPoint1: CGPointMake(3.04, 4.14) controlPoint2: CGPointMake(3.05, 3.55)];
    [bezier4Path addCurveToPoint: CGPointMake(-3.15, 2.78) controlPoint1: CGPointMake(1.69, 2.89) controlPoint2: CGPointMake(0.28, 2.78)];
    [bezier4Path addCurveToPoint: CGPointMake(-8.01, -0.29) controlPoint1: CGPointMake(-6.26, 2.78) controlPoint2: CGPointMake(-8.29, 1.74)];
    [bezier4Path addCurveToPoint: CGPointMake(-3.82, -4.24) controlPoint1: CGPointMake(-7.8, -1.77) controlPoint2: CGPointMake(-6.19, -3.18)];
    [bezier4Path addCurveToPoint: CGPointMake(0.01, -6.55) controlPoint1: CGPointMake(-1.77, -5.15) controlPoint2: CGPointMake(-0.23, -6.11)];
    [bezier4Path addCurveToPoint: CGPointMake(0.17, -5.84) controlPoint1: CGPointMake(-0.12, -6.31) controlPoint2: CGPointMake(0.08, -5.88)];
    [bezier4Path addCurveToPoint: CGPointMake(-3.15, -6.17) controlPoint1: CGPointMake(-0.31, -6.04) controlPoint2: CGPointMake(1.91, -4.27)];
    [bezier4Path addCurveToPoint: CGPointMake(-8.06, -9) controlPoint1: CGPointMake(-7.89, -7.95) controlPoint2: CGPointMake(-7.33, -7.9)];
    [bezier4Path addCurveToPoint: CGPointMake(-8.02, -13.08) controlPoint1: CGPointMake(-9.4, -11.04) controlPoint2: CGPointMake(-8.02, -13.08)];
    [bezier4Path addLineToPoint: CGPointMake(1.12, -27.86)];
    [bezier4Path addLineToPoint: CGPointMake(4.79, -26.1)];
    [bezier4Path addCurveToPoint: CGPointMake(-4.35, -10.4) controlPoint1: CGPointMake(4.79, -26.1) controlPoint2: CGPointMake(-4.56, -10.46)];
    [color setFill];
    [bezier4Path fill];

    CGContextRestoreGState(context);


    //// Group 2
    {
        //// Bezier 7 Drawing
        UIBezierPath* bezier7Path = UIBezierPath.bezierPath;
        [bezier7Path moveToPoint: CGPointMake(-92.74, 61.62)];
        [bezier7Path addCurveToPoint: CGPointMake(-91.38, 70.15) controlPoint1: CGPointMake(-92.39, 64.53) controlPoint2: CGPointMake(-91.94, 67.44)];
        [bezier7Path addCurveToPoint: CGPointMake(-85.37, 82.22) controlPoint1: CGPointMake(-89.85, 77.67) controlPoint2: CGPointMake(-87.76, 82.22)];
        [bezier7Path addCurveToPoint: CGPointMake(-79.38, 65.75) controlPoint1: CGPointMake(-85.21, 82.22) controlPoint2: CGPointMake(-82.26, 65.75)];
        [bezier7Path addCurveToPoint: CGPointMake(-73.81, 82.22) controlPoint1: CGPointMake(-76.63, 65.75) controlPoint2: CGPointMake(-73.94, 82.22)];
        [bezier7Path addCurveToPoint: CGPointMake(-69.85, 76.23) controlPoint1: CGPointMake(-72.36, 82.22) controlPoint2: CGPointMake(-70.99, 80.1)];
        [bezier7Path addCurveToPoint: CGPointMake(-68.49, 70.16) controlPoint1: CGPointMake(-69.34, 74.49) controlPoint2: CGPointMake(-68.89, 72.45)];
        [bezier7Path addCurveToPoint: CGPointMake(-67.37, 61.63) controlPoint1: CGPointMake(-68.02, 67.45) controlPoint2: CGPointMake(-67.65, 64.54)];
        [bezier7Path addCurveToPoint: CGPointMake(-67.13, 58.82) controlPoint1: CGPointMake(-67.27, 60.61) controlPoint2: CGPointMake(-67.19, 59.67)];
        [bezier7Path addCurveToPoint: CGPointMake(-66.38, 57.75) controlPoint1: CGPointMake(-67.11, 58.52) controlPoint2: CGPointMake(-67.08, 57.57)];
        [bezier7Path addCurveToPoint: CGPointMake(-66.14, 58.89) controlPoint1: CGPointMake(-65.67, 57.94) controlPoint2: CGPointMake(-66.11, 58.59)];
        [bezier7Path addCurveToPoint: CGPointMake(-66.38, 61.73) controlPoint1: CGPointMake(-66.2, 59.75) controlPoint2: CGPointMake(-66.28, 60.7)];
        [bezier7Path addCurveToPoint: CGPointMake(-67.51, 70.34) controlPoint1: CGPointMake(-66.66, 64.66) controlPoint2: CGPointMake(-67.03, 67.59)];
        [bezier7Path addCurveToPoint: CGPointMake(-68.89, 76.51) controlPoint1: CGPointMake(-67.91, 72.65) controlPoint2: CGPointMake(-68.37, 74.73)];
        [bezier7Path addCurveToPoint: CGPointMake(-73.81, 83.22) controlPoint1: CGPointMake(-70.16, 80.8) controlPoint2: CGPointMake(-71.72, 83.22)];
        [bezier7Path addCurveToPoint: CGPointMake(-79.38, 68.05) controlPoint1: CGPointMake(-74.62, 83.22) controlPoint2: CGPointMake(-76.69, 68.05)];
        [bezier7Path addCurveToPoint: CGPointMake(-85.37, 83.22) controlPoint1: CGPointMake(-81.71, 68.05) controlPoint2: CGPointMake(-84.69, 83.22)];
        [bezier7Path addCurveToPoint: CGPointMake(-92.36, 70.35) controlPoint1: CGPointMake(-88.51, 83.22) controlPoint2: CGPointMake(-90.71, 78.42)];
        [bezier7Path addCurveToPoint: CGPointMake(-93.73, 61.74) controlPoint1: CGPointMake(-92.93, 67.61) controlPoint2: CGPointMake(-93.38, 64.67)];
        [bezier7Path addCurveToPoint: CGPointMake(-93.73, 57.75) controlPoint1: CGPointMake(-93.85, 60.71) controlPoint2: CGPointMake(-94.64, 57.94)];
        [bezier7Path addCurveToPoint: CGPointMake(-92.74, 61.62) controlPoint1: CGPointMake(-92.82, 57.56) controlPoint2: CGPointMake(-92.86, 60.6)];
        [bezier7Path closePath];
        [color setFill];
        [bezier7Path fill];
        [color setStroke];
        bezier7Path.lineWidth = 3;
        [bezier7Path stroke];


        //// Bezier 9 Drawing
        UIBezierPath* bezier9Path = UIBezierPath.bezierPath;
        [bezier9Path moveToPoint: CGPointMake(-56.47, 61.36)];
        [bezier9Path addCurveToPoint: CGPointMake(-56.47, 82.05) controlPoint1: CGPointMake(-55.9, 67.88) controlPoint2: CGPointMake(-56.47, 82.05)];
        [bezier9Path addCurveToPoint: CGPointMake(-57.47, 82.05) controlPoint1: CGPointMake(-56.47, 82.05) controlPoint2: CGPointMake(-56.39, 83.73)];
        [bezier9Path addCurveToPoint: CGPointMake(-57.47, 67.21) controlPoint1: CGPointMake(-58.56, 80.38) controlPoint2: CGPointMake(-57.54, 74.52)];
        [bezier9Path addCurveToPoint: CGPointMake(-57.47, 57.2) controlPoint1: CGPointMake(-57.45, 64.05) controlPoint2: CGPointMake(-58.48, 57.19)];
        [bezier9Path addCurveToPoint: CGPointMake(-56.47, 61.36) controlPoint1: CGPointMake(-56.77, 57.21) controlPoint2: CGPointMake(-56.63, 59.62)];
        [bezier9Path closePath];
        [color setFill];
        [bezier9Path fill];
        [color setStroke];
        bezier9Path.lineWidth = 3;
        [bezier9Path stroke];


        //// Bezier 11 Drawing
        UIBezierPath* bezier11Path = UIBezierPath.bezierPath;
        [bezier11Path moveToPoint: CGPointMake(-44.28, 59.76)];
        [bezier11Path addCurveToPoint: CGPointMake(-44.14, 68.35) controlPoint1: CGPointMake(-43.86, 60.8) controlPoint2: CGPointMake(-44.11, 64.2)];
        [bezier11Path addCurveToPoint: CGPointMake(-43.84, 79.84) controlPoint1: CGPointMake(-44.18, 72) controlPoint2: CGPointMake(-43.81, 76.85)];
        [bezier11Path addCurveToPoint: CGPointMake(-44.28, 83.32) controlPoint1: CGPointMake(-43.86, 82.35) controlPoint2: CGPointMake(-44.28, 83.32)];
        [bezier11Path addCurveToPoint: CGPointMake(-45.28, 83.32) controlPoint1: CGPointMake(-44.28, 83.32) controlPoint2: CGPointMake(-44.68, 85.28)];
        [bezier11Path addCurveToPoint: CGPointMake(-45.39, 76.38) controlPoint1: CGPointMake(-45.52, 82.55) controlPoint2: CGPointMake(-45.4, 79.66)];
        [bezier11Path addCurveToPoint: CGPointMake(-45.37, 65.31) controlPoint1: CGPointMake(-45.38, 71.29) controlPoint2: CGPointMake(-45.37, 65.31)];
        [bezier11Path addLineToPoint: CGPointMake(-45.28, 59.76)];
        [bezier11Path addCurveToPoint: CGPointMake(-44.28, 59.76) controlPoint1: CGPointMake(-45.28, 59.76) controlPoint2: CGPointMake(-45.39, 57.03)];
        [bezier11Path closePath];
        [color setFill];
        [bezier11Path fill];
        [color setStroke];
        bezier11Path.lineWidth = 3;
        [bezier11Path stroke];


        //// Bezier 12 Drawing
        UIBezierPath* bezier12Path = UIBezierPath.bezierPath;
        [bezier12Path moveToPoint: CGPointMake(-39.05, 60.66)];
        [bezier12Path addCurveToPoint: CGPointMake(-44.28, 70.22) controlPoint1: CGPointMake(-42.06, 62.05) controlPoint2: CGPointMake(-44.28, 64.52)];
        [bezier12Path addLineToPoint: CGPointMake(-45.28, 70.22)];
        [bezier12Path addCurveToPoint: CGPointMake(-39.69, 59.31) controlPoint1: CGPointMake(-45.28, 64.15) controlPoint2: CGPointMake(-43.08, 60.87)];
        [bezier12Path addCurveToPoint: CGPointMake(-32.9, 60.13) controlPoint1: CGPointMake(-38, 58.53) controlPoint2: CGPointMake(-32.62, 58.27)];
        [bezier12Path addCurveToPoint: CGPointMake(-39.05, 60.66) controlPoint1: CGPointMake(-33.17, 61.99) controlPoint2: CGPointMake(-37.55, 59.97)];
        [bezier12Path closePath];
        [color setFill];
        [bezier12Path fill];
        [color setStroke];
        bezier12Path.lineWidth = 3;
        [bezier12Path stroke];


        //// Bezier 13 Drawing
        UIBezierPath* bezier13Path = UIBezierPath.bezierPath;
        [bezier13Path moveToPoint: CGPointMake(-10.95, 70.08)];
        [bezier13Path addCurveToPoint: CGPointMake(-11.92, 65.23) controlPoint1: CGPointMake(-11.05, 68.98) controlPoint2: CGPointMake(-11.45, 66.4)];
        [bezier13Path addCurveToPoint: CGPointMake(-18.94, 59.89) controlPoint1: CGPointMake(-13.24, 61.94) controlPoint2: CGPointMake(-15.49, 59.89)];
        [bezier13Path addCurveToPoint: CGPointMake(-25.85, 65.22) controlPoint1: CGPointMake(-22.4, 59.89) controlPoint2: CGPointMake(-24.6, 61.93)];
        [bezier13Path addCurveToPoint: CGPointMake(-26.74, 68.92) controlPoint1: CGPointMake(-26.3, 66.39) controlPoint2: CGPointMake(-26.58, 67.65)];
        [bezier13Path addCurveToPoint: CGPointMake(-26.85, 70.14) controlPoint1: CGPointMake(-26.8, 69.36) controlPoint2: CGPointMake(-26.84, 69.77)];
        [bezier13Path addCurveToPoint: CGPointMake(-10.95, 70.08) controlPoint1: CGPointMake(-26.87, 70.35) controlPoint2: CGPointMake(-10.86, 71.18)];
        [bezier13Path closePath];
        [bezier13Path moveToPoint: CGPointMake(-27.93, 71.04)];
        [bezier13Path addCurveToPoint: CGPointMake(-26.85, 64.33) controlPoint1: CGPointMake(-27.93, 71.04) controlPoint2: CGPointMake(-27.64, 65.93)];
        [bezier13Path addCurveToPoint: CGPointMake(-18.94, 58.72) controlPoint1: CGPointMake(-24.57, 59.7) controlPoint2: CGPointMake(-22.87, 58.72)];
        [bezier13Path addCurveToPoint: CGPointMake(-10.95, 64.33) controlPoint1: CGPointMake(-15.03, 58.72) controlPoint2: CGPointMake(-12.41, 60.69)];
        [bezier13Path addCurveToPoint: CGPointMake(-9.78, 71.08) controlPoint1: CGPointMake(-10.45, 65.58) controlPoint2: CGPointMake(-8.8, 69.74)];
        [bezier13Path addCurveToPoint: CGPointMake(-27.93, 71.04) controlPoint1: CGPointMake(-10.76, 72.43) controlPoint2: CGPointMake(-27.93, 71.04)];
        [bezier13Path closePath];
        [color setFill];
        [bezier13Path fill];
        [color setStroke];
        bezier13Path.lineWidth = 3;
        [bezier13Path stroke];


        //// Bezier 14 Drawing
        UIBezierPath* bezier14Path = UIBezierPath.bezierPath;
        [bezier14Path moveToPoint: CGPointMake(-26.87, 71.04)];
        [bezier14Path addCurveToPoint: CGPointMake(-26.29, 77.25) controlPoint1: CGPointMake(-26.89, 71.16) controlPoint2: CGPointMake(-26.74, 75.38)];
        [bezier14Path addCurveToPoint: CGPointMake(-19.59, 82.75) controlPoint1: CGPointMake(-25.41, 81.01) controlPoint2: CGPointMake(-23.52, 82.6)];
        [bezier14Path addCurveToPoint: CGPointMake(-12.22, 79.68) controlPoint1: CGPointMake(-15.47, 82.9) controlPoint2: CGPointMake(-13.35, 81.98)];
        [bezier14Path addCurveToPoint: CGPointMake(-11.28, 77.59) controlPoint1: CGPointMake(-11.89, 79.02) controlPoint2: CGPointMake(-11.38, 78.32)];
        [bezier14Path addCurveToPoint: CGPointMake(-10.17, 75.88) controlPoint1: CGPointMake(-11.21, 77.09) controlPoint2: CGPointMake(-11.36, 75.69)];
        [bezier14Path addCurveToPoint: CGPointMake(-11.01, 80.14) controlPoint1: CGPointMake(-8.98, 76.08) controlPoint2: CGPointMake(-10.34, 78.79)];
        [bezier14Path addCurveToPoint: CGPointMake(-19.59, 84.18) controlPoint1: CGPointMake(-12.32, 82.81) controlPoint2: CGPointMake(-15.08, 84.34)];
        [bezier14Path addCurveToPoint: CGPointMake(-27.53, 77.25) controlPoint1: CGPointMake(-24.02, 84.02) controlPoint2: CGPointMake(-26.54, 81.41)];
        [bezier14Path addCurveToPoint: CGPointMake(-27.93, 71.04) controlPoint1: CGPointMake(-28, 75.26) controlPoint2: CGPointMake(-27.95, 71.18)];
        [bezier14Path addLineToPoint: CGPointMake(-26.87, 71.04)];
        [bezier14Path closePath];
        [color setFill];
        [bezier14Path fill];
        [color setStroke];
        bezier14Path.lineWidth = 3;
        [bezier14Path stroke];


        //// Bezier 15 Drawing
        UIBezierPath* bezier15Path = UIBezierPath.bezierPath;
        [bezier15Path moveToPoint: CGPointMake(-70.65, 80.69)];
        [bezier15Path addCurveToPoint: CGPointMake(-57.97, 79.22) controlPoint1: CGPointMake(-70.65, 80.69) controlPoint2: CGPointMake(-70.54, 86.11)];
        [color setStroke];
        bezier15Path.lineWidth = 3;
        [bezier15Path stroke];


        //// Bezier 16 Drawing
        UIBezierPath* bezier16Path = UIBezierPath.bezierPath;
        [bezier16Path moveToPoint: CGPointMake(-56.22, 82.8)];
        [bezier16Path addCurveToPoint: CGPointMake(-45.43, 78.03) controlPoint1: CGPointMake(-52.36, 82.17) controlPoint2: CGPointMake(-49.07, 82.42)];
        [color setStroke];
        bezier16Path.lineWidth = 3;
        [bezier16Path stroke];


        //// Bezier 17 Drawing
        UIBezierPath* bezier17Path = UIBezierPath.bezierPath;
        [UIColor.blackColor setStroke];
        bezier17Path.lineWidth = 1;
        [bezier17Path stroke];


        //// Bezier 18 Drawing
        CGContextSaveGState(context);
        CGContextTranslateCTM(context, -36.47, 78.87);
        CGContextRotateCTM(context, 2.1 * M_PI / 180);

        UIBezierPath* bezier18Path = UIBezierPath.bezierPath;
        [bezier18Path moveToPoint: CGPointMake(-8.68, 4.02)];
        [bezier18Path addCurveToPoint: CGPointMake(8.69, -4.03) controlPoint1: CGPointMake(-8.68, 4.02) controlPoint2: CGPointMake(10.4, 4.57)];
        [color setStroke];
        bezier18Path.lineWidth = 3;
        [bezier18Path stroke];

        CGContextRestoreGState(context);
    }


    //// Bezier Drawing
    CGContextSaveGState(context);
    CGContextTranslateCTM(context, -29.57, -42.57);
    CGContextRotateCTM(context, -203.12 * M_PI / 180);

    UIBezierPath* bezierPath = UIBezierPath.bezierPath;
    [bezierPath moveToPoint: CGPointMake(1.34, -8.29)];
    [bezierPath addCurveToPoint: CGPointMake(2.63, -5.34) controlPoint1: CGPointMake(2.75, -7.72) controlPoint2: CGPointMake(3.29, -6.53)];
    [bezierPath addCurveToPoint: CGPointMake(-2.54, -1.84) controlPoint1: CGPointMake(1.98, -4.18) controlPoint2: CGPointMake(0.11, -3.02)];
    [bezierPath addCurveToPoint: CGPointMake(-5.1, 0.04) controlPoint1: CGPointMake(-4.1, -1.14) controlPoint2: CGPointMake(-5.05, -0.31)];
    [bezierPath addCurveToPoint: CGPointMake(-5.14, -0.17) controlPoint1: CGPointMake(-5.09, -0.06) controlPoint2: CGPointMake(-5.16, -0.19)];
    [bezierPath addCurveToPoint: CGPointMake(-3.21, 0.1) controlPoint1: CGPointMake(-4.83, -0.02) controlPoint2: CGPointMake(-4.18, 0.1)];
    [bezierPath addCurveToPoint: CGPointMake(5.43, 0.33) controlPoint1: CGPointMake(0.86, 0.1) controlPoint2: CGPointMake(3.96, -0.39)];
    [bezierPath addCurveToPoint: CGPointMake(4.03, 7.55) controlPoint1: CGPointMake(7.91, 1.54) controlPoint2: CGPointMake(8.11, 2.19)];
    [bezierPath addCurveToPoint: CGPointMake(5.53, 10.02) controlPoint1: CGPointMake(2.29, 9.86) controlPoint2: CGPointMake(5.51, 9.99)];
    [bezierPath addCurveToPoint: CGPointMake(14.96, 15.74) controlPoint1: CGPointMake(5.62, 10.17) controlPoint2: CGPointMake(17.45, 12.45)];
    [bezierPath addCurveToPoint: CGPointMake(0.92, 20.61) controlPoint1: CGPointMake(13.28, 17.96) controlPoint2: CGPointMake(4.75, 19.36)];
    [bezierPath addCurveToPoint: CGPointMake(0.13, 22.45) controlPoint1: CGPointMake(-0.92, 21.21) controlPoint2: CGPointMake(0.13, 22.45)];
    [bezierPath addCurveToPoint: CGPointMake(6.7, 27.43) controlPoint1: CGPointMake(0.13, 22.45) controlPoint2: CGPointMake(5.23, 24.7)];
    [bezierPath addCurveToPoint: CGPointMake(4.74, 32.03) controlPoint1: CGPointMake(7.74, 29.36) controlPoint2: CGPointMake(5.55, 32.06)];
    [bezierPath addCurveToPoint: CGPointMake(1.32, 27.31) controlPoint1: CGPointMake(3.99, 32.01) controlPoint2: CGPointMake(4.38, 30.18)];
    [bezierPath addCurveToPoint: CGPointMake(-7.09, 21.55) controlPoint1: CGPointMake(-0.85, 25.27) controlPoint2: CGPointMake(-6.77, 22.04)];
    [bezierPath addCurveToPoint: CGPointMake(10.11, 13.52) controlPoint1: CGPointMake(-9.07, 18.53) controlPoint2: CGPointMake(12.45, 15.07)];
    [bezierPath addCurveToPoint: CGPointMake(1.2, 11.92) controlPoint1: CGPointMake(7.79, 11.98) controlPoint2: CGPointMake(2.54, 12.55)];
    [bezierPath addCurveToPoint: CGPointMake(1.54, 6.06) controlPoint1: CGPointMake(-0.93, 10.93) controlPoint2: CGPointMake(-0.45, 8.73)];
    [bezierPath addCurveToPoint: CGPointMake(2.44, 3.29) controlPoint1: CGPointMake(2.97, 4.14) controlPoint2: CGPointMake(2.99, 3.55)];
    [bezierPath addCurveToPoint: CGPointMake(-3.21, 2.78) controlPoint1: CGPointMake(1.62, 2.89) controlPoint2: CGPointMake(0.21, 2.78)];
    [bezierPath addCurveToPoint: CGPointMake(-8.08, -0.29) controlPoint1: CGPointMake(-6.33, 2.78) controlPoint2: CGPointMake(-8.36, 1.74)];
    [bezierPath addCurveToPoint: CGPointMake(-3.88, -4.24) controlPoint1: CGPointMake(-7.87, -1.77) controlPoint2: CGPointMake(-6.25, -3.18)];
    [bezierPath addCurveToPoint: CGPointMake(-0.05, -6.55) controlPoint1: CGPointMake(-1.84, -5.15) controlPoint2: CGPointMake(-0.3, -6.11)];
    [bezierPath addCurveToPoint: CGPointMake(0.1, -5.84) controlPoint1: CGPointMake(-0.19, -6.31) controlPoint2: CGPointMake(0.01, -5.88)];
    [bezierPath addCurveToPoint: CGPointMake(-3.21, -6.17) controlPoint1: CGPointMake(-0.37, -6.04) controlPoint2: CGPointMake(1.85, -4.27)];
    [bezierPath addCurveToPoint: CGPointMake(-7.52, -8.03) controlPoint1: CGPointMake(-7.96, -7.95) controlPoint2: CGPointMake(-7.07, -7.64)];
    [bezierPath addCurveToPoint: CGPointMake(-7.74, -11.71) controlPoint1: CGPointMake(-8.36, -8.76) controlPoint2: CGPointMake(-7.74, -11.71)];
    [bezierPath addLineToPoint: CGPointMake(-6.58, -18.2)];
    [bezierPath addLineToPoint: CGPointMake(-3.05, -16.92)];
    [bezierPath addCurveToPoint: CGPointMake(-3.34, -10.12) controlPoint1: CGPointMake(-3.05, -16.92) controlPoint2: CGPointMake(-3.56, -10.18)];
    [color setFill];
    [bezierPath fill];

    CGContextRestoreGState(context);


    //// Bezier 10 Drawing
    UIBezierPath* bezier10Path = UIBezierPath.bezierPath;
    [bezier10Path moveToPoint: CGPointMake(128.87, -0)];
    [bezier10Path addLineToPoint: CGPointMake(135.06, -0.12)];
    [bezier10Path addCurveToPoint: CGPointMake(139.9, -7.84) controlPoint1: CGPointMake(135.06, -0.12) controlPoint2: CGPointMake(137.5, -4.19)];
    [bezier10Path addCurveToPoint: CGPointMake(144.19, -18.37) controlPoint1: CGPointMake(142.73, -12.15) controlPoint2: CGPointMake(145.51, -16.3)];
    [bezier10Path addCurveToPoint: CGPointMake(137.34, -19.93) controlPoint1: CGPointMake(143.72, -19.12) controlPoint2: CGPointMake(142.38, -22.22)];
    [bezier10Path addCurveToPoint: CGPointMake(117.21, -7.84) controlPoint1: CGPointMake(131.36, -17.22) controlPoint2: CGPointMake(120.29, -7.84)];
    [bezier10Path addCurveToPoint: CGPointMake(112.84, -15.04) controlPoint1: CGPointMake(114.5, -7.84) controlPoint2: CGPointMake(111.24, -13.25)];
    [bezier10Path addCurveToPoint: CGPointMake(128.87, -19.93) controlPoint1: CGPointMake(114.6, -16.99) controlPoint2: CGPointMake(127.04, -14.72)];
    [bezier10Path addCurveToPoint: CGPointMake(114.88, -30.05) controlPoint1: CGPointMake(129.55, -21.88) controlPoint2: CGPointMake(118.19, -30.27)];
    [bezier10Path addCurveToPoint: CGPointMake(118.3, -19.93) controlPoint1: CGPointMake(114.07, -29.99) controlPoint2: CGPointMake(127.48, -20.37)];
    [bezier10Path addCurveToPoint: CGPointMake(108.01, -18.37) controlPoint1: CGPointMake(109.13, -19.49) controlPoint2: CGPointMake(108.31, -18.51)];
    [bezier10Path addCurveToPoint: CGPointMake(114.88, -2.96) controlPoint1: CGPointMake(104.18, -16.64) controlPoint2: CGPointMake(107.24, -4)];
    [bezier10Path addCurveToPoint: CGPointMake(140.48, -17.05) controlPoint1: CGPointMake(122.52, -1.91) controlPoint2: CGPointMake(140.48, -17.05)];
    [bezier10Path addLineToPoint: CGPointMake(128.87, -0)];
    [bezier10Path closePath];
    [color setFill];
    [bezier10Path fill];


    //// flowIntoWire Drawing
    CGContextSaveGState(context);
    CGContextTranslateCTM(context, 98.44, 3.58);
    CGContextRotateCTM(context, -65.91 * M_PI / 180);

    UIBezierPath* flowIntoWirePath = UIBezierPath.bezierPath;
    [flowIntoWirePath moveToPoint: CGPointMake(3.34, 15.83)];
    [flowIntoWirePath addCurveToPoint: CGPointMake(1.99, 12.19) controlPoint1: CGPointMake(3.34, 14.41) controlPoint2: CGPointMake(2.89, 13.2)];
    [flowIntoWirePath addCurveToPoint: CGPointMake(-1.21, 9.35) controlPoint1: CGPointMake(1.1, 11.19) controlPoint2: CGPointMake(0.03, 10.25)];
    [flowIntoWirePath addCurveToPoint: CGPointMake(-5.04, 6.55) controlPoint1: CGPointMake(-2.44, 8.46) controlPoint2: CGPointMake(-3.72, 7.52)];
    [flowIntoWirePath addCurveToPoint: CGPointMake(-8.2, 2.99) controlPoint1: CGPointMake(-6.35, 5.57) controlPoint2: CGPointMake(-7.41, 4.39)];
    [flowIntoWirePath addCurveToPoint: CGPointMake(-9.38, -2.06) controlPoint1: CGPointMake(-8.99, 1.6) controlPoint2: CGPointMake(-9.38, -0.09)];
    [flowIntoWirePath addCurveToPoint: CGPointMake(-7.33, -9.45) controlPoint1: CGPointMake(-9.38, -4.04) controlPoint2: CGPointMake(-8.7, -6.5)];
    [flowIntoWirePath addCurveToPoint: CGPointMake(-1.72, -18.02) controlPoint1: CGPointMake(-5.91, -12.51) controlPoint2: CGPointMake(-4.04, -15.36)];
    [flowIntoWirePath addCurveToPoint: CGPointMake(6.02, -24.5) controlPoint1: CGPointMake(0.6, -20.68) controlPoint2: CGPointMake(3.18, -22.84)];
    [flowIntoWirePath addCurveToPoint: CGPointMake(14.99, -27.54) controlPoint1: CGPointMake(8.87, -26.16) controlPoint2: CGPointMake(11.85, -27.17)];
    [flowIntoWirePath addCurveToPoint: CGPointMake(16.57, -23.12) controlPoint1: CGPointMake(18.12, -27.91) controlPoint2: CGPointMake(18.07, -23.22)];
    [flowIntoWirePath addCurveToPoint: CGPointMake(11.99, -21.97) controlPoint1: CGPointMake(15.07, -23.01) controlPoint2: CGPointMake(13.54, -22.63)];
    [flowIntoWirePath addCurveToPoint: CGPointMake(7.4, -19.25) controlPoint1: CGPointMake(10.43, -21.31) controlPoint2: CGPointMake(8.91, -20.41)];
    [flowIntoWirePath addCurveToPoint: CGPointMake(3.18, -15.49) controlPoint1: CGPointMake(5.9, -18.09) controlPoint2: CGPointMake(4.49, -16.84)];
    [flowIntoWirePath addCurveToPoint: CGPointMake(-0.34, -11.31) controlPoint1: CGPointMake(1.86, -14.15) controlPoint2: CGPointMake(0.69, -12.76)];
    [flowIntoWirePath addCurveToPoint: CGPointMake(-2.75, -7.24) controlPoint1: CGPointMake(-1.36, -9.86) controlPoint2: CGPointMake(-2.17, -8.5)];
    [flowIntoWirePath addCurveToPoint: CGPointMake(-3.7, -2.14) controlPoint1: CGPointMake(-3.7, -5.24) controlPoint2: CGPointMake(-4.01, -3.54)];
    [flowIntoWirePath addCurveToPoint: CGPointMake(-1.76, 1.61) controlPoint1: CGPointMake(-3.38, -0.75) controlPoint2: CGPointMake(-2.73, 0.5)];
    [flowIntoWirePath addCurveToPoint: CGPointMake(1.76, 4.73) controlPoint1: CGPointMake(-0.79, 2.71) controlPoint2: CGPointMake(0.39, 3.76)];
    [flowIntoWirePath addCurveToPoint: CGPointMake(5.63, 7.81) controlPoint1: CGPointMake(3.13, 5.7) controlPoint2: CGPointMake(4.42, 6.73)];
    [flowIntoWirePath addCurveToPoint: CGPointMake(8.51, 11.48) controlPoint1: CGPointMake(6.84, 8.89) controlPoint2: CGPointMake(7.8, 10.11)];
    [flowIntoWirePath addCurveToPoint: CGPointMake(9.18, 16.46) controlPoint1: CGPointMake(9.22, 12.85) controlPoint2: CGPointMake(9.45, 14.51)];
    [flowIntoWirePath addCurveToPoint: CGPointMake(6.85, 22.19) controlPoint1: CGPointMake(8.87, 18.67) controlPoint2: CGPointMake(8.09, 20.58)];
    [flowIntoWirePath addCurveToPoint: CGPointMake(2.35, 25.94) controlPoint1: CGPointMake(5.61, 23.79) controlPoint2: CGPointMake(4.11, 25.05)];
    [flowIntoWirePath addCurveToPoint: CGPointMake(-3.46, 27.52) controlPoint1: CGPointMake(0.58, 26.84) controlPoint2: CGPointMake(-1.35, 27.36)];
    [flowIntoWirePath addCurveToPoint: CGPointMake(-9.7, 26.65) controlPoint1: CGPointMake(-5.56, 27.68) controlPoint2: CGPointMake(-7.65, 27.39)];
    [flowIntoWirePath addCurveToPoint: CGPointMake(-15.97, 20.55) controlPoint1: CGPointMake(-12.33, 25.76) controlPoint2: CGPointMake(-15.97, 20.55)];
    [flowIntoWirePath addCurveToPoint: CGPointMake(-4.13, 22.35) controlPoint1: CGPointMake(-15.97, 20.55) controlPoint2: CGPointMake(-5.53, 22.37)];
    [flowIntoWirePath addCurveToPoint: CGPointMake(-0.38, 21.48) controlPoint1: CGPointMake(-2.73, 22.32) controlPoint2: CGPointMake(-1.48, 22.03)];
    [flowIntoWirePath addCurveToPoint: CGPointMake(2.31, 19.19) controlPoint1: CGPointMake(0.73, 20.92) controlPoint2: CGPointMake(1.62, 20.16)];
    [flowIntoWirePath addCurveToPoint: CGPointMake(3.34, 15.83) controlPoint1: CGPointMake(2.99, 18.21) controlPoint2: CGPointMake(3.34, 17.09)];
    [flowIntoWirePath closePath];
    [color setFill];
    [flowIntoWirePath fill];

    CGContextRestoreGState(context);


    //// flowOutofTap 2 Drawing
    UIBezierPath* flowOutofTap2Path = UIBezierPath.bezierPath;
    [flowOutofTap2Path moveToPoint: CGPointMake(279.32, 304.28)];
    [flowOutofTap2Path addCurveToPoint: CGPointMake(251.12, 316.66) controlPoint1: CGPointMake(276.23, 308.74) controlPoint2: CGPointMake(248.59, 309)];
    [flowOutofTap2Path addCurveToPoint: CGPointMake(288.43, 342.16) controlPoint1: CGPointMake(253.07, 319.93) controlPoint2: CGPointMake(267.3, 323.24)];
    [flowOutofTap2Path addCurveToPoint: CGPointMake(309.7, 362.99) controlPoint1: CGPointMake(294.94, 347.99) controlPoint2: CGPointMake(303.88, 354.13)];
    [flowOutofTap2Path addCurveToPoint: CGPointMake(298.51, 368.72) controlPoint1: CGPointMake(320.62, 364.9) controlPoint2: CGPointMake(298.51, 368.72)];
    [flowOutofTap2Path addCurveToPoint: CGPointMake(160.06, 408.29) controlPoint1: CGPointMake(275.64, 372.31) controlPoint2: CGPointMake(202.01, 399.78)];
    [flowOutofTap2Path addCurveToPoint: CGPointMake(117.07, 467.61) controlPoint1: CGPointMake(108.12, 418.83) controlPoint2: CGPointMake(117.07, 467.61)];
    [flowOutofTap2Path addLineToPoint: CGPointMake(136.77, 468.88)];
    [flowOutofTap2Path addCurveToPoint: CGPointMake(170.32, 424.28) controlPoint1: CGPointMake(136.77, 468.88) controlPoint2: CGPointMake(129.64, 430.97)];
    [flowOutofTap2Path addCurveToPoint: CGPointMake(315.42, 381.73) controlPoint1: CGPointMake(180.49, 422.61) controlPoint2: CGPointMake(298.55, 386.35)];
    [flowOutofTap2Path addCurveToPoint: CGPointMake(297.34, 336.65) controlPoint1: CGPointMake(346.43, 373.23) controlPoint2: CGPointMake(308.7, 346.83)];
    [flowOutofTap2Path addCurveToPoint: CGPointMake(263.51, 314.71) controlPoint1: CGPointMake(269.99, 318.24) controlPoint2: CGPointMake(266.05, 318.5)];
    [flowOutofTap2Path addCurveToPoint: CGPointMake(263.95, 313.54) controlPoint1: CGPointMake(263.22, 314.27) controlPoint2: CGPointMake(264.05, 310.14)];
    [flowOutofTap2Path addCurveToPoint: CGPointMake(284.78, 306.09) controlPoint1: CGPointMake(267.2, 311.5) controlPoint2: CGPointMake(283.11, 310.82)];
    [flowOutofTap2Path addLineToPoint: CGPointMake(287.36, 300.5)];
    [flowOutofTap2Path addCurveToPoint: CGPointMake(282.12, 298.22) controlPoint1: CGPointMake(287.36, 300.5) controlPoint2: CGPointMake(283.41, 294.9)];
    [flowOutofTap2Path addCurveToPoint: CGPointMake(279.32, 304.28) controlPoint1: CGPointMake(281.16, 300.69) controlPoint2: CGPointMake(279.32, 304.28)];
    [flowOutofTap2Path closePath];
    [color setFill];
    [flowOutofTap2Path fill];


    //// Oval 3 Drawing
    UIBezierPath* oval3Path = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(179.83, 147.34, 16, 16)];
    [color setFill];
    [oval3Path fill];


    //// Bezier 19 Drawing
    UIBezierPath* bezier19Path = UIBezierPath.bezierPath;
    [bezier19Path moveToPoint: CGPointMake(177.18, 176.81)];
    [bezier19Path addCurveToPoint: CGPointMake(188.31, 183.51) controlPoint1: CGPointMake(177.18, 176.81) controlPoint2: CGPointMake(180.77, 183.51)];
    [bezier19Path addCurveToPoint: CGPointMake(199.48, 176.81) controlPoint1: CGPointMake(195.86, 183.51) controlPoint2: CGPointMake(199.48, 176.81)];
    [color setStroke];
    bezier19Path.lineWidth = 3;
    [bezier19Path stroke];


    //// Bezier 20 Drawing
    UIBezierPath* bezier20Path = UIBezierPath.bezierPath;
    [bezier20Path moveToPoint: CGPointMake(162.83, 196.8)];
    [bezier20Path addCurveToPoint: CGPointMake(188.79, 210.12) controlPoint1: CGPointMake(162.83, 196.8) controlPoint2: CGPointMake(171.19, 210.12)];
    [bezier20Path addCurveToPoint: CGPointMake(214.83, 196.8) controlPoint1: CGPointMake(206.38, 210.12) controlPoint2: CGPointMake(214.83, 196.8)];
    [color setStroke];
    bezier20Path.lineWidth = 3;
    [bezier20Path stroke];


    //// Bezier 21 Drawing
    UIBezierPath* bezier21Path = UIBezierPath.bezierPath;
    [bezier21Path moveToPoint: CGPointMake(142.5, 217.38)];
    [bezier21Path addCurveToPoint: CGPointMake(187.75, 239.62) controlPoint1: CGPointMake(142.5, 217.38) controlPoint2: CGPointMake(157.08, 239.62)];
    [bezier21Path addCurveToPoint: CGPointMake(233.16, 217.38) controlPoint1: CGPointMake(218.42, 239.62) controlPoint2: CGPointMake(233.16, 217.38)];
    [color setStroke];
    bezier21Path.lineWidth = 3;
    [bezier21Path stroke];


    //// Bezier 22 Drawing
    UIBezierPath* bezier22Path = UIBezierPath.bezierPath;
    [bezier22Path moveToPoint: CGPointMake(119.38, 239.62)];
    [bezier22Path addCurveToPoint: CGPointMake(188.71, 276.41) controlPoint1: CGPointMake(119.38, 239.62) controlPoint2: CGPointMake(141.71, 276.41)];
    [bezier22Path addCurveToPoint: CGPointMake(258.29, 239.62) controlPoint1: CGPointMake(235.7, 276.41) controlPoint2: CGPointMake(258.29, 239.62)];
    [color setStroke];
    bezier22Path.lineWidth = 3;
    [bezier22Path stroke];
}

+ (void)drawRecordButton
{
    //// Color Declarations
    UIColor* black = [UIColor colorWithRed: 0 green: 0 blue: 0 alpha: 1];
    UIColor* red = [UIColor colorWithRed: 0.992 green: 0.188 blue: 0.11 alpha: 1];

    //// Oval 2 Drawing
    UIBezierPath* oval2Path = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(-0, 0.47, 256, 256)];
    [red setFill];
    [oval2Path fill];


    //// Oval 7 Drawing
    UIBezierPath* oval7Path = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(10, 10.47, 236, 236)];
    [red setFill];
    [oval7Path fill];
    [UIColor.blackColor setStroke];
    oval7Path.lineWidth = 10;
    [oval7Path stroke];


    //// Group
    {
        //// Rectangle 8 Drawing
        UIBezierPath* rectangle8Path = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(108, 82.48, 40, 71.99) cornerRadius: 20];
        [black setFill];
        [rectangle8Path fill];


        //// Rectangle 9 Drawing
        UIBezierPath* rectangle9Path = UIBezierPath.bezierPath;
        [rectangle9Path moveToPoint: CGPointMake(128.5, 135.97)];
        [rectangle9Path addCurveToPoint: CGPointMake(152.42, 126.97) controlPoint1: CGPointMake(128.5, 135.97) controlPoint2: CGPointMake(152.47, 122.82)];
        [rectangle9Path addCurveToPoint: CGPointMake(151, 144.47) controlPoint1: CGPointMake(152.38, 131.12) controlPoint2: CGPointMake(153, 139.47)];
        [rectangle9Path addCurveToPoint: CGPointMake(131.46, 159.06) controlPoint1: CGPointMake(147.84, 150.46) controlPoint2: CGPointMake(142.46, 158.06)];
        [rectangle9Path addLineToPoint: CGPointMake(126.75, 159.06)];
        [rectangle9Path addCurveToPoint: CGPointMake(104.92, 143.43) controlPoint1: CGPointMake(116.98, 159.06) controlPoint2: CGPointMake(108.26, 152.81)];
        [rectangle9Path addCurveToPoint: CGPointMake(103.56, 126.47) controlPoint1: CGPointMake(103.05, 137.39) controlPoint2: CGPointMake(103.6, 130.31)];
        [rectangle9Path addCurveToPoint: CGPointMake(128.5, 135.97) controlPoint1: CGPointMake(103.52, 122.63) controlPoint2: CGPointMake(128.5, 135.97)];
        [rectangle9Path closePath];
        [black setStroke];
        rectangle9Path.lineWidth = 5;
        [rectangle9Path stroke];


        //// Rectangle 13 Drawing
        UIBezierPath* rectangle13Path = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(108, 168.47, 40, 6) cornerRadius: 2];
        [black setFill];
        [rectangle13Path fill];


        //// Rectangle 14 Drawing
        UIBezierPath* rectangle14Path = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(125, 157.47, 6, 15) cornerRadius: 3];
        [black setFill];
        [rectangle14Path fill];
    }
}

+ (void)drawEmptyCIrcleWithColor: (UIColor*)color
{

    //// Oval 3 Drawing
    UIBezierPath* oval3Path = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(3, 3, 250, 250)];
    [color setStroke];
    oval3Path.lineWidth = 6;
    [oval3Path stroke];
}

+ (void)drawSettingsScreenWithColor: (UIColor*)color
{
    //// General Declarations
    CGContextRef context = UIGraphicsGetCurrentContext();

    //// Oval 3 Drawing
    UIBezierPath* oval3Path = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(62.5, 3, 250, 250)];
    [color setStroke];
    oval3Path.lineWidth = 6;
    [oval3Path stroke];


    //// Path- Drawing
    CGContextSaveGState(context);
    CGContextTranslateCTM(context, 231.34, 29.09);
    CGContextRotateCTM(context, 33.03 * M_PI / 180);

    UIBezierPath* pathPath = UIBezierPath.bezierPath;
    [pathPath moveToPoint: CGPointMake(59.75, 7.13)];
    [pathPath addCurveToPoint: CGPointMake(66.86, 14.14) controlPoint1: CGPointMake(62.04, 9.39) controlPoint2: CGPointMake(66.86, 14.14)];
    [pathPath addCurveToPoint: CGPointMake(64.31, 25.74) controlPoint1: CGPointMake(66.86, 14.14) controlPoint2: CGPointMake(61.81, 20.92)];
    [pathPath addCurveToPoint: CGPointMake(74.15, 31.64) controlPoint1: CGPointMake(66.81, 30.57) controlPoint2: CGPointMake(74.15, 31.64)];
    [pathPath addLineToPoint: CGPointMake(74.15, 41.52)];
    [pathPath addCurveToPoint: CGPointMake(64.31, 47.2) controlPoint1: CGPointMake(74.15, 41.52) controlPoint2: CGPointMake(66.62, 42.62)];
    [pathPath addCurveToPoint: CGPointMake(66.81, 58.88) controlPoint1: CGPointMake(61.73, 52.34) controlPoint2: CGPointMake(66.81, 58.88)];
    [pathPath addLineToPoint: CGPointMake(59.75, 65.84)];
    [pathPath addCurveToPoint: CGPointMake(47.84, 63.26) controlPoint1: CGPointMake(59.75, 65.84) controlPoint2: CGPointMake(52.05, 61.39)];
    [pathPath addCurveToPoint: CGPointMake(42.71, 73.09) controlPoint1: CGPointMake(43.63, 65.12) controlPoint2: CGPointMake(42.71, 73.09)];
    [pathPath addLineToPoint: CGPointMake(32.02, 73.09)];
    [pathPath addCurveToPoint: CGPointMake(25.67, 63.26) controlPoint1: CGPointMake(32.02, 73.09) controlPoint2: CGPointMake(30.86, 65.2)];
    [pathPath addCurveToPoint: CGPointMake(14.46, 65.89) controlPoint1: CGPointMake(20.47, 61.31) controlPoint2: CGPointMake(14.46, 65.89)];
    [pathPath addLineToPoint: CGPointMake(7.28, 58.9)];
    [pathPath addCurveToPoint: CGPointMake(9.7, 47.2) controlPoint1: CGPointMake(7.28, 58.9) controlPoint2: CGPointMake(12.37, 52.16)];
    [pathPath addCurveToPoint: CGPointMake(0.01, 41.54) controlPoint1: CGPointMake(7.02, 42.25) controlPoint2: CGPointMake(0.01, 41.54)];
    [pathPath addLineToPoint: CGPointMake(0, 31.54)];
    [pathPath addCurveToPoint: CGPointMake(9.96, 25.45) controlPoint1: CGPointMake(0, 31.54) controlPoint2: CGPointMake(8.01, 30.53)];
    [pathPath addCurveToPoint: CGPointMake(7.29, 14.18) controlPoint1: CGPointMake(11.92, 20.37) controlPoint2: CGPointMake(7.29, 14.18)];
    [pathPath addLineToPoint: CGPointMake(14.31, 7.13)];
    [pathPath addCurveToPoint: CGPointMake(26.14, 9.65) controlPoint1: CGPointMake(14.31, 7.13) controlPoint2: CGPointMake(20.89, 12.03)];
    [pathPath addCurveToPoint: CGPointMake(32, 0) controlPoint1: CGPointMake(31.39, 7.26) controlPoint2: CGPointMake(32, 0)];
    [pathPath addLineToPoint: CGPointMake(42.12, 0)];
    [pathPath addCurveToPoint: CGPointMake(47.84, 9.65) controlPoint1: CGPointMake(42.12, 0) controlPoint2: CGPointMake(43.28, 7.42)];
    [pathPath addCurveToPoint: CGPointMake(59.75, 7.13) controlPoint1: CGPointMake(52.39, 11.87) controlPoint2: CGPointMake(59.7, 7.08)];
    [pathPath closePath];
    [pathPath moveToPoint: CGPointMake(37.2, 56.89)];
    [pathPath addCurveToPoint: CGPointMake(57.98, 36.41) controlPoint1: CGPointMake(48.68, 56.89) controlPoint2: CGPointMake(57.98, 47.72)];
    [pathPath addCurveToPoint: CGPointMake(37.2, 15.92) controlPoint1: CGPointMake(57.98, 25.09) controlPoint2: CGPointMake(48.68, 15.92)];
    [pathPath addCurveToPoint: CGPointMake(16.42, 36.41) controlPoint1: CGPointMake(25.73, 15.92) controlPoint2: CGPointMake(16.42, 25.09)];
    [pathPath addCurveToPoint: CGPointMake(37.2, 56.89) controlPoint1: CGPointMake(16.42, 47.72) controlPoint2: CGPointMake(25.73, 56.89)];
    [pathPath closePath];
    [pathPath moveToPoint: CGPointMake(37.06, 49.16)];
    [pathPath addCurveToPoint: CGPointMake(49.84, 36.55) controlPoint1: CGPointMake(44.12, 49.16) controlPoint2: CGPointMake(49.84, 43.51)];
    [pathPath addCurveToPoint: CGPointMake(37.06, 23.94) controlPoint1: CGPointMake(49.84, 29.59) controlPoint2: CGPointMake(44.12, 23.94)];
    [pathPath addCurveToPoint: CGPointMake(24.27, 36.55) controlPoint1: CGPointMake(30, 23.94) controlPoint2: CGPointMake(24.27, 29.59)];
    [pathPath addCurveToPoint: CGPointMake(37.06, 49.16) controlPoint1: CGPointMake(24.27, 43.51) controlPoint2: CGPointMake(30, 49.16)];
    [pathPath closePath];
    pathPath.miterLimit = 4;

    pathPath.usesEvenOddFillRule = YES;

    [color setFill];
    [pathPath fill];
    [color setStroke];
    pathPath.lineWidth = 1;
    [pathPath stroke];

    CGContextRestoreGState(context);


    //// Path-1 Drawing
    CGContextSaveGState(context);
    CGContextTranslateCTM(context, 134.36, 3);
    CGContextRotateCTM(context, 33.31 * M_PI / 180);

    UIBezierPath* path1Path = UIBezierPath.bezierPath;
    [path1Path moveToPoint: CGPointMake(89.57, 10.83)];
    [path1Path addCurveToPoint: CGPointMake(100.21, 21.49) controlPoint1: CGPointMake(93, 14.28) controlPoint2: CGPointMake(100.21, 21.49)];
    [path1Path addCurveToPoint: CGPointMake(96.4, 39.13) controlPoint1: CGPointMake(100.21, 21.49) controlPoint2: CGPointMake(92.65, 31.8)];
    [path1Path addCurveToPoint: CGPointMake(111.14, 48.09) controlPoint1: CGPointMake(100.15, 46.46) controlPoint2: CGPointMake(111.14, 48.09)];
    [path1Path addLineToPoint: CGPointMake(111.15, 63.11)];
    [path1Path addCurveToPoint: CGPointMake(96.4, 71.74) controlPoint1: CGPointMake(111.15, 63.11) controlPoint2: CGPointMake(99.85, 64.78)];
    [path1Path addCurveToPoint: CGPointMake(100.15, 89.49) controlPoint1: CGPointMake(92.53, 79.55) controlPoint2: CGPointMake(100.15, 89.49)];
    [path1Path addLineToPoint: CGPointMake(89.57, 100.07)];
    [path1Path addCurveToPoint: CGPointMake(71.71, 96.14) controlPoint1: CGPointMake(89.57, 100.07) controlPoint2: CGPointMake(78.02, 93.31)];
    [path1Path addCurveToPoint: CGPointMake(64.03, 111.09) controlPoint1: CGPointMake(65.4, 98.98) controlPoint2: CGPointMake(64.03, 111.09)];
    [path1Path addLineToPoint: CGPointMake(47.99, 111.09)];
    [path1Path addCurveToPoint: CGPointMake(38.48, 96.14) controlPoint1: CGPointMake(47.99, 111.09) controlPoint2: CGPointMake(46.26, 99.1)];
    [path1Path addCurveToPoint: CGPointMake(21.67, 100.15) controlPoint1: CGPointMake(30.69, 93.19) controlPoint2: CGPointMake(21.67, 100.15)];
    [path1Path addLineToPoint: CGPointMake(10.92, 89.53)];
    [path1Path addCurveToPoint: CGPointMake(14.54, 71.74) controlPoint1: CGPointMake(10.92, 89.53) controlPoint2: CGPointMake(18.55, 79.27)];
    [path1Path addCurveToPoint: CGPointMake(0.02, 63.14) controlPoint1: CGPointMake(10.53, 64.21) controlPoint2: CGPointMake(0.02, 63.14)];
    [path1Path addLineToPoint: CGPointMake(0, 47.94)];
    [path1Path addCurveToPoint: CGPointMake(14.94, 38.68) controlPoint1: CGPointMake(0, 47.94) controlPoint2: CGPointMake(12, 46.41)];
    [path1Path addCurveToPoint: CGPointMake(10.93, 21.56) controlPoint1: CGPointMake(17.87, 30.96) controlPoint2: CGPointMake(10.93, 21.56)];
    [path1Path addLineToPoint: CGPointMake(21.44, 10.83)];
    [path1Path addCurveToPoint: CGPointMake(39.18, 14.66) controlPoint1: CGPointMake(21.44, 10.83) controlPoint2: CGPointMake(31.31, 18.29)];
    [path1Path addCurveToPoint: CGPointMake(47.97, 0) controlPoint1: CGPointMake(47.06, 11.03) controlPoint2: CGPointMake(47.97, 0)];
    [path1Path addLineToPoint: CGPointMake(63.14, 0)];
    [path1Path addCurveToPoint: CGPointMake(71.71, 14.66) controlPoint1: CGPointMake(63.14, 0) controlPoint2: CGPointMake(64.88, 11.28)];
    [path1Path addCurveToPoint: CGPointMake(89.57, 10.83) controlPoint1: CGPointMake(78.54, 18.05) controlPoint2: CGPointMake(89.49, 10.75)];
    [path1Path closePath];
    [path1Path moveToPoint: CGPointMake(55.77, 86.47)];
    [path1Path addCurveToPoint: CGPointMake(86.91, 55.33) controlPoint1: CGPointMake(72.97, 86.47) controlPoint2: CGPointMake(86.91, 72.53)];
    [path1Path addCurveToPoint: CGPointMake(55.77, 24.2) controlPoint1: CGPointMake(86.91, 38.14) controlPoint2: CGPointMake(72.97, 24.2)];
    [path1Path addCurveToPoint: CGPointMake(24.62, 55.33) controlPoint1: CGPointMake(38.56, 24.2) controlPoint2: CGPointMake(24.62, 38.14)];
    [path1Path addCurveToPoint: CGPointMake(55.77, 86.47) controlPoint1: CGPointMake(24.62, 72.53) controlPoint2: CGPointMake(38.56, 86.47)];
    [path1Path closePath];
    [path1Path moveToPoint: CGPointMake(55.55, 74.71)];
    [path1Path addCurveToPoint: CGPointMake(74.72, 55.55) controlPoint1: CGPointMake(66.13, 74.71) controlPoint2: CGPointMake(74.72, 66.14)];
    [path1Path addCurveToPoint: CGPointMake(55.55, 36.39) controlPoint1: CGPointMake(74.72, 44.97) controlPoint2: CGPointMake(66.13, 36.39)];
    [path1Path addCurveToPoint: CGPointMake(36.38, 55.55) controlPoint1: CGPointMake(44.96, 36.39) controlPoint2: CGPointMake(36.38, 44.97)];
    [path1Path addCurveToPoint: CGPointMake(55.55, 74.71) controlPoint1: CGPointMake(36.38, 66.14) controlPoint2: CGPointMake(44.96, 74.71)];
    [path1Path closePath];
    path1Path.miterLimit = 4;

    path1Path.usesEvenOddFillRule = YES;

    [color setFill];
    [path1Path fill];
    [color setStroke];
    path1Path.lineWidth = 1;
    [path1Path stroke];

    CGContextRestoreGState(context);


    //// Path- 2 Drawing
    CGContextSaveGState(context);
    CGContextTranslateCTM(context, 120.26, 125.21);
    CGContextRotateCTM(context, -33.03 * M_PI / 180);

    UIBezierPath* path2Path = UIBezierPath.bezierPath;
    [path2Path moveToPoint: CGPointMake(-41.03, 19.3)];
    [path2Path addCurveToPoint: CGPointMake(-48.13, 26.31) controlPoint1: CGPointMake(-43.32, 21.57) controlPoint2: CGPointMake(-48.13, 26.31)];
    [path2Path addCurveToPoint: CGPointMake(-45.59, 37.91) controlPoint1: CGPointMake(-48.13, 26.31) controlPoint2: CGPointMake(-43.09, 33.09)];
    [path2Path addCurveToPoint: CGPointMake(-55.43, 43.81) controlPoint1: CGPointMake(-48.09, 42.74) controlPoint2: CGPointMake(-55.43, 43.81)];
    [path2Path addLineToPoint: CGPointMake(-55.43, 53.7)];
    [path2Path addCurveToPoint: CGPointMake(-45.59, 59.37) controlPoint1: CGPointMake(-55.43, 53.7) controlPoint2: CGPointMake(-47.89, 54.79)];
    [path2Path addCurveToPoint: CGPointMake(-48.09, 71.05) controlPoint1: CGPointMake(-43.01, 64.51) controlPoint2: CGPointMake(-48.09, 71.05)];
    [path2Path addLineToPoint: CGPointMake(-41.03, 78.01)];
    [path2Path addCurveToPoint: CGPointMake(-29.12, 75.43) controlPoint1: CGPointMake(-41.03, 78.01) controlPoint2: CGPointMake(-33.33, 73.56)];
    [path2Path addCurveToPoint: CGPointMake(-23.99, 85.26) controlPoint1: CGPointMake(-24.91, 77.29) controlPoint2: CGPointMake(-23.99, 85.26)];
    [path2Path addLineToPoint: CGPointMake(-13.3, 85.26)];
    [path2Path addCurveToPoint: CGPointMake(-6.95, 75.43) controlPoint1: CGPointMake(-13.3, 85.26) controlPoint2: CGPointMake(-12.14, 77.37)];
    [path2Path addCurveToPoint: CGPointMake(4.26, 78.07) controlPoint1: CGPointMake(-1.75, 73.48) controlPoint2: CGPointMake(4.26, 78.07)];
    [path2Path addLineToPoint: CGPointMake(11.44, 71.07)];
    [path2Path addCurveToPoint: CGPointMake(9.02, 59.37) controlPoint1: CGPointMake(11.44, 71.07) controlPoint2: CGPointMake(6.35, 64.33)];
    [path2Path addCurveToPoint: CGPointMake(18.71, 53.71) controlPoint1: CGPointMake(11.7, 54.42) controlPoint2: CGPointMake(18.71, 53.71)];
    [path2Path addLineToPoint: CGPointMake(18.72, 43.71)];
    [path2Path addCurveToPoint: CGPointMake(8.76, 37.62) controlPoint1: CGPointMake(18.72, 43.71) controlPoint2: CGPointMake(10.71, 42.7)];
    [path2Path addCurveToPoint: CGPointMake(11.43, 26.35) controlPoint1: CGPointMake(6.8, 32.54) controlPoint2: CGPointMake(11.43, 26.35)];
    [path2Path addLineToPoint: CGPointMake(4.41, 19.3)];
    [path2Path addCurveToPoint: CGPointMake(-7.42, 21.82) controlPoint1: CGPointMake(4.41, 19.3) controlPoint2: CGPointMake(-2.17, 24.21)];
    [path2Path addCurveToPoint: CGPointMake(-13.28, 12.17) controlPoint1: CGPointMake(-12.67, 19.43) controlPoint2: CGPointMake(-13.28, 12.17)];
    [path2Path addLineToPoint: CGPointMake(-23.4, 12.17)];
    [path2Path addCurveToPoint: CGPointMake(-29.12, 21.82) controlPoint1: CGPointMake(-23.4, 12.17) controlPoint2: CGPointMake(-24.56, 19.59)];
    [path2Path addCurveToPoint: CGPointMake(-41.03, 19.3) controlPoint1: CGPointMake(-33.67, 24.05) controlPoint2: CGPointMake(-40.98, 19.25)];
    [path2Path closePath];
    [path2Path moveToPoint: CGPointMake(-18.48, 69.06)];
    [path2Path addCurveToPoint: CGPointMake(-39.26, 48.58) controlPoint1: CGPointMake(-29.96, 69.06) controlPoint2: CGPointMake(-39.26, 59.89)];
    [path2Path addCurveToPoint: CGPointMake(-18.48, 28.09) controlPoint1: CGPointMake(-39.26, 37.26) controlPoint2: CGPointMake(-29.96, 28.09)];
    [path2Path addCurveToPoint: CGPointMake(2.3, 48.58) controlPoint1: CGPointMake(-7.01, 28.09) controlPoint2: CGPointMake(2.3, 37.26)];
    [path2Path addCurveToPoint: CGPointMake(-18.48, 69.06) controlPoint1: CGPointMake(2.3, 59.89) controlPoint2: CGPointMake(-7.01, 69.06)];
    [path2Path closePath];
    [path2Path moveToPoint: CGPointMake(-18.34, 61.33)];
    [path2Path addCurveToPoint: CGPointMake(-31.12, 48.72) controlPoint1: CGPointMake(-25.4, 61.33) controlPoint2: CGPointMake(-31.12, 55.68)];
    [path2Path addCurveToPoint: CGPointMake(-18.34, 36.11) controlPoint1: CGPointMake(-31.12, 41.76) controlPoint2: CGPointMake(-25.4, 36.11)];
    [path2Path addCurveToPoint: CGPointMake(-5.55, 48.72) controlPoint1: CGPointMake(-11.27, 36.11) controlPoint2: CGPointMake(-5.55, 41.76)];
    [path2Path addCurveToPoint: CGPointMake(-18.34, 61.33) controlPoint1: CGPointMake(-5.55, 55.68) controlPoint2: CGPointMake(-11.27, 61.33)];
    [path2Path closePath];
    path2Path.miterLimit = 4;

    path2Path.usesEvenOddFillRule = YES;

    [color setFill];
    [path2Path fill];
    [color setStroke];
    path2Path.lineWidth = 1;
    [path2Path stroke];

    CGContextRestoreGState(context);


    //// Path- 3 Drawing
    CGContextSaveGState(context);
    CGContextTranslateCTM(context, 207.68, 99.12);
    CGContextRotateCTM(context, -33.31 * M_PI / 180);

    UIBezierPath* path3Path = UIBezierPath.bezierPath;
    [path3Path moveToPoint: CGPointMake(-62.91, 28.35)];
    [path3Path addCurveToPoint: CGPointMake(-73.56, 39.01) controlPoint1: CGPointMake(-66.34, 31.79) controlPoint2: CGPointMake(-73.56, 39.01)];
    [path3Path addCurveToPoint: CGPointMake(-69.74, 56.64) controlPoint1: CGPointMake(-73.56, 39.01) controlPoint2: CGPointMake(-65.99, 49.31)];
    [path3Path addCurveToPoint: CGPointMake(-84.49, 65.6) controlPoint1: CGPointMake(-73.49, 63.97) controlPoint2: CGPointMake(-84.49, 65.6)];
    [path3Path addLineToPoint: CGPointMake(-84.49, 80.63)];
    [path3Path addCurveToPoint: CGPointMake(-69.74, 89.26) controlPoint1: CGPointMake(-84.49, 80.63) controlPoint2: CGPointMake(-73.2, 82.29)];
    [path3Path addCurveToPoint: CGPointMake(-73.49, 107.01) controlPoint1: CGPointMake(-65.87, 97.07) controlPoint2: CGPointMake(-73.49, 107.01)];
    [path3Path addLineToPoint: CGPointMake(-62.91, 117.59)];
    [path3Path addCurveToPoint: CGPointMake(-45.05, 113.66) controlPoint1: CGPointMake(-62.91, 117.59) controlPoint2: CGPointMake(-51.36, 110.83)];
    [path3Path addCurveToPoint: CGPointMake(-37.37, 128.6) controlPoint1: CGPointMake(-38.74, 116.49) controlPoint2: CGPointMake(-37.37, 128.6)];
    [path3Path addLineToPoint: CGPointMake(-21.33, 128.6)];
    [path3Path addCurveToPoint: CGPointMake(-11.82, 113.66) controlPoint1: CGPointMake(-21.33, 128.6) controlPoint2: CGPointMake(-19.6, 116.61)];
    [path3Path addCurveToPoint: CGPointMake(4.99, 117.67) controlPoint1: CGPointMake(-4.03, 110.7) controlPoint2: CGPointMake(4.99, 117.67)];
    [path3Path addLineToPoint: CGPointMake(15.74, 107.04)];
    [path3Path addCurveToPoint: CGPointMake(12.12, 89.26) controlPoint1: CGPointMake(15.74, 107.04) controlPoint2: CGPointMake(8.11, 96.79)];
    [path3Path addCurveToPoint: CGPointMake(26.64, 80.66) controlPoint1: CGPointMake(16.13, 81.73) controlPoint2: CGPointMake(26.64, 80.66)];
    [path3Path addLineToPoint: CGPointMake(26.66, 65.45)];
    [path3Path addCurveToPoint: CGPointMake(11.72, 56.2) controlPoint1: CGPointMake(26.66, 65.45) controlPoint2: CGPointMake(14.66, 63.92)];
    [path3Path addCurveToPoint: CGPointMake(15.73, 39.07) controlPoint1: CGPointMake(8.79, 48.48) controlPoint2: CGPointMake(15.73, 39.07)];
    [path3Path addLineToPoint: CGPointMake(5.21, 28.35)];
    [path3Path addCurveToPoint: CGPointMake(-12.53, 32.18) controlPoint1: CGPointMake(5.21, 28.35) controlPoint2: CGPointMake(-4.65, 35.81)];
    [path3Path addCurveToPoint: CGPointMake(-21.31, 17.52) controlPoint1: CGPointMake(-20.4, 28.55) controlPoint2: CGPointMake(-21.31, 17.52)];
    [path3Path addLineToPoint: CGPointMake(-36.48, 17.51)];
    [path3Path addCurveToPoint: CGPointMake(-45.05, 32.18) controlPoint1: CGPointMake(-36.48, 17.51) controlPoint2: CGPointMake(-38.22, 28.79)];
    [path3Path addCurveToPoint: CGPointMake(-62.91, 28.35) controlPoint1: CGPointMake(-51.88, 35.56) controlPoint2: CGPointMake(-62.83, 28.27)];
    [path3Path closePath];
    [path3Path moveToPoint: CGPointMake(-29.11, 103.99)];
    [path3Path addCurveToPoint: CGPointMake(-60.26, 72.85) controlPoint1: CGPointMake(-46.31, 103.99) controlPoint2: CGPointMake(-60.26, 90.05)];
    [path3Path addCurveToPoint: CGPointMake(-29.11, 41.71) controlPoint1: CGPointMake(-60.26, 55.65) controlPoint2: CGPointMake(-46.31, 41.71)];
    [path3Path addCurveToPoint: CGPointMake(2.04, 72.85) controlPoint1: CGPointMake(-11.91, 41.71) controlPoint2: CGPointMake(2.04, 55.65)];
    [path3Path addCurveToPoint: CGPointMake(-29.11, 103.99) controlPoint1: CGPointMake(2.04, 90.05) controlPoint2: CGPointMake(-11.91, 103.99)];
    [path3Path closePath];
    [path3Path moveToPoint: CGPointMake(-28.89, 92.23)];
    [path3Path addCurveToPoint: CGPointMake(-48.06, 73.07) controlPoint1: CGPointMake(-39.48, 92.23) controlPoint2: CGPointMake(-48.06, 83.65)];
    [path3Path addCurveToPoint: CGPointMake(-28.89, 53.91) controlPoint1: CGPointMake(-48.06, 62.48) controlPoint2: CGPointMake(-39.48, 53.91)];
    [path3Path addCurveToPoint: CGPointMake(-9.72, 73.07) controlPoint1: CGPointMake(-18.3, 53.91) controlPoint2: CGPointMake(-9.72, 62.48)];
    [path3Path addCurveToPoint: CGPointMake(-28.89, 92.23) controlPoint1: CGPointMake(-9.72, 83.65) controlPoint2: CGPointMake(-18.3, 92.23)];
    [path3Path closePath];
    path3Path.miterLimit = 4;

    path3Path.usesEvenOddFillRule = YES;

    [color setFill];
    [path3Path fill];
    [color setStroke];
    path3Path.lineWidth = 1;
    [path3Path stroke];

    CGContextRestoreGState(context);
}

#pragma mark Generated Images

+ (UIImage*)imageOfFullViewWithColor: (UIColor*)color
{
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(375, 2001), NO, 0.0f);
    [WireTapStyleKit drawFullViewWithColor: color];

    UIImage* imageOfFullView = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return imageOfFullView;
}

@end
