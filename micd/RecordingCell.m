#import "RecordingCell.h"
#import "WireTapStyleKit.h"
#import "UIColor+Palette.h"
#import "Recording.h"
#import "OBShapedButton.h"
#import "RecordingCellModel.h"
#import "PopViewAnimator.h"

#define kUpdateInterval             0.02

@interface RecordingCell () <UITextFieldDelegate, UIGestureRecognizerDelegate>

@property (weak, nonatomic) IBOutlet UIView *bottomSeparator;
@property (weak, nonatomic) IBOutlet UITextField *title;
@property (weak, nonatomic) IBOutlet UILabel *length;
@property (weak, nonatomic) IBOutlet UILabel *date;
@property (weak, nonatomic) IBOutlet UIImageView *playStateImageView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *playStateImageViewWidthConstraint;
@property (weak, nonatomic) IBOutlet UIView *lengthContainerView;
@property (weak, nonatomic) IBOutlet UIImageView *playPauseImageView;
@property (strong, nonatomic) UILongPressGestureRecognizer *longPressGestureRecognizer;

@property (nonatomic, strong, readwrite) RecordingCellModel *cellModel;
@property (assign, nonatomic) BOOL isObserving;
@property (strong, nonatomic) NSTimer *timer;

@end

@implementation RecordingCell

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.bottomSeparator.backgroundColor = [UIColor vibrantVeryDarkBlue];
}

- (void)bindToModel:(RecordingCellModel *)cellModel {
    _cellModel = cellModel;
    
    self.backgroundColor = [UIColor clearColor];
    self.length.textColor = [UIColor vibrantLightBlueText];
    self.date.textColor = [UIColor vibrantDarkBlue];
    self.title.textColor = [UIColor vibrantLightBlueText];
    self.title.tintColor = [UIColor vibrantLightBlueText];
    self.lengthContainerView.backgroundColor = [UIColor clearColor];
    
    if (!self.isObserving) {
        [cellModel addObserver:self forKeyPath:@"state" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:NULL];
        self.isObserving = YES;
    }
    
    self.title.text = cellModel.title;
    self.length.text = cellModel.recording.lengthToDiplay;
    self.date.text = cellModel.recording.dateAsString;
    
    [self setupViewBasedOnState];
    
    if (!self.longPressGestureRecognizer) {
        self.longPressGestureRecognizer = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleLongPress:)];
        self.longPressGestureRecognizer.minimumPressDuration = 0.5;
        self.longPressGestureRecognizer.delegate = self;
        [self.contentView addGestureRecognizer:self.longPressGestureRecognizer];
    }

    self.title.delegate = self;
    self.title.userInteractionEnabled = NO;
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[WireTapStyleKit imageOfClearButton] forState:UIControlStateNormal];
    [button setFrame:CGRectMake(0.0f, 0.0f, 15.0f, 15.0f)];
    self.title.rightView = button;
    self.title.rightViewMode = UITextFieldViewModeWhileEditing;
    [button addTarget:self action:@selector(clearText) forControlEvents:UIControlEventTouchUpInside];
    
    self.cellModel.shouldAnimateStateChanges = NO;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    self.cellModel.shouldAnimateStateChanges = YES;
    [self setupViewBasedOnState];
    self.cellModel.shouldAnimateStateChanges = NO;
}

- (void)prepareForReuse {
    [self.timer invalidate];
    self.cellModel.shouldAnimateStateChanges = NO;
    if (self.isObserving) {
        [self.cellModel removeObserver:self forKeyPath:@"state"];
        self.isObserving = NO;
    }
    self.cellModel = nil;
}

- (void)dealloc {
    [self.timer invalidate];
    if (self.isObserving) {
        [self.cellModel removeObserver:self forKeyPath:@"state"];
        self.isObserving = NO;
    }
}

#pragma mark - State Methods

- (void)setupViewBasedOnState {
    [self.timer invalidate];
    
    switch (self.cellModel.state) {
        case CellStateDefault:
            [self setupViewForDefaultState];
            break;
        case CellStatePaused:
            [self setupViewForPausedState];
            break;
        case CellStatePlaying:
            [self setupViewForPlayingState];
            break;
    }
}

- (void)setupViewForDefaultState {
    if (self.cellModel.shouldAnimateStateChanges) {
        [UIView transitionFromView:self.playPauseImageView
                            toView:self.length duration:.4
                           options:UIViewAnimationOptionTransitionFlipFromTop | UIViewAnimationOptionShowHideTransitionViews
                        completion:nil];
    } else {
        self.playPauseImageView.hidden = YES;
        self.length.hidden = NO;
    }
}

- (void)setupViewForPlayingState {
    __weak __typeof(self) welf = self;
    
    if (self.cellModel.shouldAnimateStateChanges) {
        if (self.length.hidden) {
            [UIView transitionWithView:self.playPauseImageView
                              duration:.4
                               options:UIViewAnimationOptionTransitionFlipFromLeft
                            animations:^{
                self.playPauseImageView.image = [WireTapStyleKit imageOfPlayAssetWithArcStart:self.cellModel.angle+90 arcEnd:self.cellModel.angle];
                            } completion:^(BOOL finished) {
                                [welf startAnimating];
                            }];
        } else {
            self.playPauseImageView.image = [WireTapStyleKit imageOfPlayAssetWithArcStart:self.cellModel.angle+90 arcEnd:self.cellModel.angle];
            [UIView transitionFromView:self.length
                                toView:self.playPauseImageView
                              duration:.4
                               options:UIViewAnimationOptionTransitionFlipFromTop | UIViewAnimationOptionShowHideTransitionViews
                            completion:^(BOOL finished) {
                                [welf startAnimating];
                            }];
        }
        [self pop_removeAnimationForKey:@"cellBounce"];
        [self addBounceAnimationToView:self];
        NSLog(@"play");
    } else {
        self.length.hidden = YES;
        self.playPauseImageView.hidden = NO;
        [self startAnimating];
    }
}

- (void)setupViewForPausedState {
    __weak __typeof(self) welf = self;
    
    if (self.cellModel.shouldAnimateStateChanges) {
        if (self.length.hidden) {
            [UIView transitionWithView:self.playPauseImageView
                              duration:.25
                               options:UIViewAnimationOptionTransitionFlipFromLeft
                            animations:^{
                welf.playPauseImageView.image = [WireTapStyleKit imageOfPauseAsset];
                            } completion:nil];
        } else {
            [UIView transitionFromView:self.length
                                toView:self.playPauseImageView
                              duration:.4 options:UIViewAnimationOptionTransitionFlipFromTop | UIViewAnimationOptionShowHideTransitionViews
                            completion:^(BOOL finished) {
                welf.playPauseImageView.image = [WireTapStyleKit imageOfPauseAsset];
                            }];
        }
        [self pop_removeAnimationForKey:@"cellBounce"];
        [self addBounceAnimationToView:self];
        NSLog(@"pause");
    } else {
        self.playPauseImageView.image = [WireTapStyleKit imageOfPauseAsset];
        self.length.hidden = YES;
        self.playPauseImageView.hidden = NO;
    }
}

- (void)drivePlayButtonAnimation {
    self.playPauseImageView.image = [WireTapStyleKit imageOfPlayAssetWithArcStart:self.cellModel.angle+90 arcEnd:self.cellModel.angle];
    self.cellModel.angle = self.cellModel.angle - 3;
}

#pragma mark - Helper Methods

- (void)startAnimating {
    //due to animation time, if the duration of the recording is shorter then we need to check
    //state again
    if (self.cellModel.state == CellStatePaused || self.cellModel.state == CellStateDefault) {
        [self setupViewBasedOnState];
    } else {
        self.timer = [NSTimer timerWithTimeInterval:kUpdateInterval
                                             target:self
                                           selector:@selector(drivePlayButtonAnimation)
                                           userInfo:nil
                                            repeats:YES];
        
        [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
        [self.timer fire];
    }
}

- (void)addBounceAnimationToView:(UIView *)view {
    view.transform = CGAffineTransformIdentity;
    POPSpringAnimation *buttonPressedAnimation = [PopViewAnimator springAnimationCellBounce];
    [view pop_addAnimation:buttonPressedAnimation forKey:@"cellBounce"];
}

#pragma mark - UITextfield Delegate and Gesture Recognizer

- (void)textFieldDidEndEditing:(UITextField *)textField {
    [self saveTitleAndResignResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self.title resignFirstResponder];
    return YES;
}

- (void)handleLongPress:(UILongPressGestureRecognizer *)gestureRecognizer {
    if (gestureRecognizer.state == UIGestureRecognizerStateBegan) {
        [self.delegate cellDidBecomeFirstResponer:self];
        if ([self.title.text isEqualToString:[RecordingCellModel titlePlaceholderText]]) {
            self.title.text = @"";
        }
        self.title.userInteractionEnabled = YES;
        [self.title becomeFirstResponder];
    }
}

- (void)saveTitleAndResignResponder {
    self.title.userInteractionEnabled = NO;
    [self.cellModel changeRecordingTitle:self.title.text];
    [self.title resignFirstResponder];
    [self.delegate cellDidResignFirstResponer:self];
    if (self.title.text.length == 0) {
        self.title.text = self.cellModel.title;
    }
}

- (void)clearText {
    self.title.text = @"";
}

- (BOOL)resignFirstResponder {
    if ([self.title isFirstResponder]) {
        [self.title resignFirstResponder];
    }
    return YES;
}

@end
