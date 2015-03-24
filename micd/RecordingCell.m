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

@interface RecordingCell () <UITextFieldDelegate, UIGestureRecognizerDelegate>

@property (weak, nonatomic) IBOutlet UIView *bottomSeparator;
@property (weak, nonatomic) IBOutlet UIView *roundedBackerView;
@property (weak, nonatomic) IBOutlet UITextField *title;
@property (weak, nonatomic) IBOutlet UILabel *length;
@property (weak, nonatomic) IBOutlet UILabel *date;

@property (nonatomic, strong, readwrite) RecordingCellModel *cellModel;
@property (assign, nonatomic) BOOL isObserving;

@end

@implementation RecordingCell

- (void)layoutSubviews {
    [super layoutSubviews];
    
//    self.layer.masksToBounds = YES;
//    self.bottomSeparator.backgroundColor = [UIColor blackColor];
//    self.bottomSeparator.alpha = .5f;
    
    ////rounded backer view can be deleted if i dont end up using it
    self.roundedBackerView.backgroundColor = [UIColor clearColor];
//    self.roundedBackerView.layer.borderWidth = 2;
//    self.roundedBackerView.layer.borderColor = [UIColor vibrantDarkBlue].CGColor;
//    self.roundedBackerView.layer.cornerRadius = self.roundedBackerView.frame.size.height/2;
//    self.roundedBackerView.layer.masksToBounds = YES;
    
    self.bottomSeparator.backgroundColor = [UIColor vibrantVeryDarkBlue];
}

- (void)bindToModel:(RecordingCellModel *)cellModel {
    _cellModel = cellModel;
    
    self.backgroundColor = [UIColor clearColor];
    self.length.textColor = [UIColor vibrantLightBlueText];
    self.date.textColor = [UIColor vibrantDarkBlue];
    self.title.textColor = [UIColor vibrantLightBlueText];
    self.title.tintColor = [UIColor vibrantLightBlueText];
    
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
    self.contentView.backgroundColor = [UIColor clearColor];
}

- (void)setupViewForPlayingState {
//    self.contentView.backgroundColor = [UIColor blueColor];
}

- (void)setupViewForPausedState {
//    self.contentView.backgroundColor = [UIColor cyanColor];
}

- (void)prepareForReuse {
    if (self.isObserving) {
        [self.cellModel removeObserver:self forKeyPath:@"state"];
        self.isObserving = NO;
    }
    self.cellModel = nil;
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
