#import "RecordingCell.h"
#import "WireTapStyleKit.h"
#import "UIColor+Palette.h"
#import "Recording.h"
#import "OBShapedButton.h"
#import "SCWaveformView.h"
#import "RecordingCellModel.h"

/*
 self.recording.title = title;
 [[DataSourceController sharedDataSource] saveData];
 */

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

@property (nonatomic, strong, readwrite) RecordingCellModel *cellModel;
@property (assign, nonatomic) BOOL isObserving;
@property (strong, nonatomic) NSTimer *timer;

@end

@implementation RecordingCell

- (void)layoutSubviews {
    [super layoutSubviews];
    
//    self.layer.masksToBounds = YES;
//    self.bottomSeparator.backgroundColor = [UIColor blackColor];
//    self.bottomSeparator.alpha = .5f;
    
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
    self.playPauseImageView.image = [WireTapStyleKit imageOfPlayAssetWithArcStart:self.cellModel.angle+90 arcEnd:self.cellModel.angle];
    
    if (!self.isObserving) {
        [cellModel addObserver:self forKeyPath:@"state" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:NULL];
        self.isObserving = YES;
    }
    
    self.title.text = cellModel.title;
    self.length.text = cellModel.recording.lengthToDiplay;
    self.date.text = cellModel.recording.dateAsString;
    
    [self setupViewBasedOnState];
    
    UILongPressGestureRecognizer *longPressGestureRecognizer = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleLongPress:)];
    longPressGestureRecognizer.minimumPressDuration = 0.8;
    longPressGestureRecognizer.delegate = self;
    [self.contentView addGestureRecognizer:longPressGestureRecognizer];

    self.title.delegate = self;
    self.title.userInteractionEnabled = NO;
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[WireTapStyleKit imageOfClearButton] forState:UIControlStateNormal];
    [button setFrame:CGRectMake(0.0f, 0.0f, 15.0f, 15.0f)];
    self.title.rightView = button;
    self.title.rightViewMode = UITextFieldViewModeWhileEditing;
    [button addTarget:self action:@selector(clearText) forControlEvents:UIControlEventTouchUpInside];
}

- (void)dealloc {
    if (self.isObserving) {
        [self.cellModel removeObserver:self forKeyPath:@"state"];
        self.isObserving = NO;
    }
}

#pragma mark - State Methods

- (void)setupViewBasedOnState { 
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
    if (self.length.hidden) {
        [self.timer invalidate];
        [UIView transitionFromView:self.playPauseImageView toView:self.length duration:.4 options:UIViewAnimationOptionTransitionFlipFromTop | UIViewAnimationOptionShowHideTransitionViews completion:nil];
    }
}

- (void)setupViewForPlayingState {
    [self.timer invalidate];
    self.playPauseImageView.image = [WireTapStyleKit imageOfPlayAssetWithArcStart:self.cellModel.angle+90 arcEnd:self.cellModel.angle];
    if (self.length.hidden) {
        [UIView transitionWithView:self.playPauseImageView duration:.4 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{
            self.playPauseImageView.image = self.playPauseImageView.image;
        } completion:^(BOOL finished) {
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
                
                [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSDefaultRunLoopMode];
                
                [self.timer fire];
            }
        }];
    } else {
        [UIView transitionFromView:self.length toView:self.playPauseImageView duration:.4 options:UIViewAnimationOptionTransitionFlipFromTop | UIViewAnimationOptionShowHideTransitionViews completion:^(BOOL finished) {
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
                
                [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSDefaultRunLoopMode];
                
                [self.timer fire];
            }
        }];
    }
}

- (void)setupViewForPausedState {
    [self.timer invalidate];
    if (self.length.hidden) {
        [UIView transitionWithView:self.playPauseImageView duration:.25 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{
            self.playPauseImageView.image = [WireTapStyleKit imageOfPauseAsset];
        } completion:^(BOOL finished) {
        }];
    } else {
        [UIView transitionFromView:self.length toView:self.playPauseImageView duration:.4 options:UIViewAnimationOptionTransitionFlipFromTop | UIViewAnimationOptionShowHideTransitionViews completion:nil];
    }
}

- (void)drivePlayButtonAnimation {
    NSLog(@"driving %f", self.cellModel.angle);
    self.playPauseImageView.image = [WireTapStyleKit imageOfPlayAssetWithArcStart:self.cellModel.angle+90 arcEnd:self.cellModel.angle];
    self.cellModel.angle = self.cellModel.angle - 3;
}

- (void)prepareForReuse {
    if (self.isObserving) {
        [self.cellModel removeObserver:self forKeyPath:@"state"];
        self.isObserving = NO;
    }
    self.cellModel = nil;
    [self.timer invalidate];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    [self bindToModel:object];
}

#pragma mark - UITextfield Delegate and Gesture Recognizer

- (void)textFieldDidEndEditing:(UITextField *)textField {
    [self saveTitleAndResignResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self saveTitleAndResignResponder];
    return YES;
}

- (void)handleLongPress:(UILongPressGestureRecognizer *)gestureRecognizer {
    if (gestureRecognizer.state == UIGestureRecognizerStateBegan) {
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
    if (self.title.text.length == 0) {
        self.title.text = self.cellModel.title;
    }
}

- (void)clearText {
    self.title.text = @"";
}

@end
