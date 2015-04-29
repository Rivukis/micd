//
//  IOSWindowHackImageView.h
//  micd
//
//  Created by Brian Radebaugh on 4/29/15.
//  Copyright (c) 2015 CleverKnot. All rights reserved.
//

#import <UIKit/UIKit.h>

@class IOSWindowHackImageView;

@protocol IOSWindowHackImageViewDelegate <NSObject>
- (void)destroyAndRecreatMe:(IOSWindowHackImageView *)capinoView;
@end

@interface IOSWindowHackImageView : UIImageView

@property (weak, nonatomic) id<IOSWindowHackImageViewDelegate> delegate;

@end