#import "RecordingCell.h"
#import "WireTapStyleKit.h"
#import "UIColor+Palette.h"
#import "Recording.h"
#import "OBShapedButton.h"
#import "SCWaveformView.h"
#import "RecordingCellModel.h"
#import "PlayerController.h"
#import "DataSourceController.h"

@interface RecordingCell ()

@property (weak, nonatomic) IBOutlet UIView *bottomSeparator;
@property (weak, nonatomic) IBOutlet UIView *roundedBackerView;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *length;
@property (weak, nonatomic) IBOutlet UIButton *editButton;

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
    self.editButton.backgroundColor = [UIColor clearColor];
    self.title.textColor = [UIColor vibrantLightBlueText];
    
    if (!self.isObserving) {
        [cellModel addObserver:self forKeyPath:@"state" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:NULL];
        self.isObserving = YES;
    }
    
    self.title.text = cellModel.recording.title;
    self.length.text = cellModel.recording.lengthToDiplay;
    
    [self setupViewBasedOnState];
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
//    [UIView animateWithDuration:.25 animations:^{
        self.contentView.backgroundColor = [UIColor clearColor];
        [self.editButton setBackgroundImage:[WireTapStyleKit imageOfEditCircleWithVeryDarkBlue:[UIColor vibrantVeryDarkBlue]] forState:UIControlStateNormal];
//    }];
//    [UIView transitionWithView:self.length duration:0.25 options:UIViewAnimationOptionCurveLinear animations:^{
        self.length.textColor = [UIColor vibrantLightBlueText];
//    } completion:^(BOOL finished) {
//    }];
}

- (void)setupViewForPlayingState {
//    self.contentView.backgroundColor = [UIColor blueColor];
    [self.editButton setBackgroundImage:[WireTapStyleKit imageOfEditCircleWithVeryDarkBlue:[UIColor vibrantVeryDarkBlue]] forState:UIControlStateNormal];
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

@end
