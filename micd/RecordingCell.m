//
//  RecordingCell.m
//  micd
//
//  Created by Timothy Hise on 2/15/15.
//  Copyright (c) 2015 CleverKnot. All rights reserved.
//

#import "RecordingCell.h"
#import "WireTapStyleKit.h"
#import "UIColor+Palette.h"
#import "Recording.h"
#import "OBShapedButton.h"
#import "SCWaveformView.h"
#import "RecordingCellModel.h"
#import "PlayerController.h"
#import "DataSourceController.h"

@interface RecordingCell () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UIView *bottomSeparator;
@property (weak, nonatomic) IBOutlet UIView *roundedBackerView;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *length;
@property (weak, nonatomic) IBOutlet UIButton *editButton;

@property (strong, nonatomic) UIView *titleEditingBackingView;
@property (strong, nonatomic) UITextField *titleEditingTextField;

@property (nonatomic, strong, readwrite) RecordingCellModel *cellModel;
@property (assign, nonatomic) BOOL isObserving;

@end

@implementation RecordingCell

-(void)layoutSubviews {
    [super layoutSubviews];
    
    self.backgroundColor = [UIColor clearColor];
    self.editButton.backgroundColor = [UIColor clearColor];
    
    self.title.textColor = [UIColor vibrantLightBlueText];
    self.length.textColor = [UIColor vibrantLightBlueText];
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
    
    if (!self.isObserving) {
        [cellModel addObserver:self forKeyPath:@"state" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:NULL];
        self.isObserving = YES;
    }
    
    self.title.text = cellModel.title;
    self.titleEditingTextField.text = cellModel.title;
    self.length.text = cellModel.length;
    
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
        case CellStateEditing:
            [self setupViewForEditingState];
            break;
        case CellStatePlaying:
            [self setupViewForPlayingState];
            break;
        case CellStatePlayingAndEditing:
            [self setupViewForEditingWhilePlayingState];
            break;
    }
}

- (void)setupViewForDefaultState {
    self.title.hidden = NO;
    [self.titleEditingTextField removeFromSuperview];
    [self.titleEditingBackingView removeFromSuperview];
    self.contentView.backgroundColor = [UIColor clearColor];
    [self.editButton setBackgroundImage:[WireTapStyleKit imageOfEditCircleWithVeryDarkBlue:[UIColor vibrantVeryDarkBlue]] forState:UIControlStateNormal];
}

- (void)setupViewForEditingState {
    self.title.hidden = YES;
    [self addSubview:self.titleEditingBackingView];
    [self addSubview:self.titleEditingTextField];
    self.contentView.backgroundColor = [UIColor vibrantVeryDarkBlue];
    [self.editButton setBackgroundImage:[WireTapStyleKit imageOfEditCircleWithVeryDarkBlue:[UIColor vibrantDarkBlueHalfOpacity]] forState:UIControlStateNormal];
}

- (void)setupViewForPlayingState {
    self.title.hidden = NO;
    [self.titleEditingTextField removeFromSuperview];
    [self.titleEditingBackingView removeFromSuperview];
    self.contentView.backgroundColor = [UIColor cyanColor];
    [self.editButton setBackgroundImage:[WireTapStyleKit imageOfEditCircleWithVeryDarkBlue:[UIColor vibrantVeryDarkBlue]] forState:UIControlStateNormal];
}

- (void)setupViewForEditingWhilePlayingState {
    self.title.hidden = YES;
    [self addSubview:self.titleEditingBackingView];
    [self addSubview:self.titleEditingTextField];
    self.contentView.backgroundColor = [UIColor magentaColor];
}

- (IBAction)editButtonPressed:(UIButton *)sender {
    if ([self.titleEditingTextField isFirstResponder]) {
        [self.titleEditingTextField resignFirstResponder];
    }
    
    if (!self.titleEditingTextField) {
        [self setupEditingViews];
    }
    
    [self.cellModel editModeToggled];
}

- (void)prepareForReuse {
    if (self.isObserving) {
        [self.cellModel removeObserver:self forKeyPath:@"state"];
        self.isObserving = NO;
    }
    self.cellModel = nil;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    [self.cellModel titleDidChange:self.titleEditingTextField.text];
    [self bindToModel:object];
}

- (void)setupEditingViews {
    CGFloat multiplier = 1.5f;
    CGFloat leftShift = 7.0f;
    
    CGRect backingViewFrame = self.title.frame;
    
    backingViewFrame.size.height *= multiplier;
    backingViewFrame.size.width += (multiplier - 1) * self.title.frame.size.height / 2.0f;
    
    self.titleEditingBackingView = [[UIView alloc] initWithFrame:backingViewFrame];
    self.titleEditingBackingView.center = self.title.center;
    
    backingViewFrame = self.titleEditingBackingView.frame;
    backingViewFrame.origin.x -= leftShift;
    backingViewFrame.size.width += leftShift;
    self.titleEditingBackingView.frame = backingViewFrame; // again
    
    self.titleEditingTextField = [[UITextField alloc] initWithFrame:self.title.frame];
    self.titleEditingTextField.delegate = self;
    
    self.titleEditingBackingView.layer.cornerRadius = self.titleEditingBackingView.frame.size.height/2;
    self.titleEditingBackingView.backgroundColor = [UIColor vibrantBlueHalfOpacity];
    self.titleEditingTextField.clearButtonMode = UITextFieldViewModeAlways;
    self.titleEditingTextField.font = self.title.font;
    self.titleEditingTextField.textColor = self.title.textColor;
    [self.titleEditingTextField setTintColor:self.title.textColor];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self.cellModel turnOffEditingState];
    return YES;
}

@end
