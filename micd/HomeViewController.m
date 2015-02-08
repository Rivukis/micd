//
//  HomeViewController.m
//  micd
//
//  Created by Timothy Hise on 2/7/15.
//  Copyright (c) 2015 CleverKnot. All rights reserved.
//

#import "HomeViewController.h"
#import "RecordButton.h"

@interface HomeViewController () <UIGestureRecognizerDelegate>

@property (strong, nonatomic) RecordButton *recordButton;
@property (strong, nonatomic) UIPanGestureRecognizer *panGesture;
@property (assign, nonatomic) BOOL isMovingDown;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
    self.panGesture.delegate = self;
    [self.view addGestureRecognizer:self.panGesture];
    
    self.recordButton = [[RecordButton alloc] init];
    [self.view addSubview:self.recordButton];
}

#pragma mark - PanGestureRecognizer

-(void)handlePan:(UIPanGestureRecognizer *)gestureRecognizer {
    switch (gestureRecognizer.state) {
        case UIGestureRecognizerStateBegan: {
            if (self.view.frame.origin.y <= self.view.window.frame.size.height * -0.91f) {
                self.isMovingDown = YES;
            } else {
                self.isMovingDown = NO;
            }
            break;
        }
        case UIGestureRecognizerStateChanged: {
            
            CGPoint translation = [gestureRecognizer translationInView:gestureRecognizer.view];
            [self.movementDelegate shouldMoveWithTranslation:translation];
            [gestureRecognizer setTranslation:CGPointMake(0, 0) inView:gestureRecognizer.view];
            break;
        }
        case UIGestureRecognizerStateEnded: {
            BOOL didMoveEnough;
            if (self.isMovingDown) {
                didMoveEnough = self.view.frame.origin.y <= self.view.window.frame.size.height * -1.6f;
                if (didMoveEnough) {
                    [self.movementDelegate shouldMoveToPositionState:HomeViewContollerPositionStateHome];
                } else {
                    [self.movementDelegate shouldMoveToPositionState:HomeViewContollerPositionStateRecordings];
                }
            } else {
                didMoveEnough = self.view.frame.origin.y >= self.view.window.frame.size.height * -0.63f;
                if (didMoveEnough) {
                    [self.movementDelegate shouldMoveToPositionState:HomeViewContollerPositionStateRecordings];
                } else {
                    [self.movementDelegate shouldMoveToPositionState:HomeViewContollerPositionStateHome];
                }
            }
        }
        default:
            break;
    }
}

#pragma mark - SetFramesProtocol

- (void)setInitialStateFrame {
    self.view.frame = CGRectMake((self.view.window.frame.size.width - 375.0f) / 2.0f,
                                 -1092.0f,
                                 self.view.window.frame.size.width,
                                 self.view.window.frame.size.height * 3.13f);
    self.recordButton.frame = CGRectMake(self.view.window.frame.size.width / 2.0f - 128.0f - self.view.frame.origin.x,
                                         self.view.window.frame.size.height / 2.0f - 128.0f - self.view.frame.origin.y,
                                         256.0f,
                                         256.0f);
}

- (void)setFrameBasedOnState:(HomeViewContollerPositionState)state {
    CGRect frame = self.view.frame;
    switch (state) {
        case HomeViewContollerPositionStateHome:
            frame.origin.y = -1092.0f;
            break;
        case HomeViewContollerPositionStateRecordings:
            frame.origin.y = self.view.window.frame.size.height * -0.57f;
            break;
        case HomeViewContollerPositionStateSettings:
            
            break;
        default:
            break;
    }
    self.view.frame = frame;
}

- (void)adjustFrameBasedOnTranslation:(CGPoint)translation {
    CGRect frame = self.view.frame;
    frame.origin.y += translation.y;
    self.view.frame = frame;
}

@end
