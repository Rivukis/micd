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

@interface RecordingCell ()

@property (weak, nonatomic) IBOutlet UIView *bottomSeparator;
@property (weak, nonatomic) IBOutlet UIView *roundedBackerView;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *length;
@property (weak, nonatomic) IBOutlet UIButton *editButton;

@property (nonatomic, strong) UIView *editingContainerView;

@property (nonatomic, strong, readwrite) RecordingCellModel *cellModel;

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
    self.roundedBackerView.backgroundColor = [UIColor blackColor];
//    self.roundedBackerView.layer.borderWidth = 2;
//    self.roundedBackerView.layer.borderColor = [UIColor vibrantDarkBlue].CGColor;
//    self.roundedBackerView.layer.cornerRadius = self.roundedBackerView.frame.size.height/2;
//    self.roundedBackerView.layer.masksToBounds = YES;
    
    self.bottomSeparator.backgroundColor = [UIColor vibrantDarkBlue];
    self.bottomSeparator.alpha = .5;
    
}

- (void)bindToModel:(RecordingCellModel *)cellModel {
    _cellModel = cellModel;
    
    [cellModel addObserver:self forKeyPath:@"state" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:NULL];
    
    self.title.text = cellModel.title;
    self.length.text = cellModel.length;
    [self.editButton setBackgroundImage:[WireTapStyleKit imageOfEditCircle] forState:UIControlStateNormal];
    
    [self setupViewBasedOnState];
}

- (void)dealloc {
    [self.cellModel removeObserver:self forKeyPath:@"state"];
}

#pragma mark - State Methods

- (void)setupViewBasedOnState { 
    switch (self.cellModel.state) {
        case CellStateDefault:
            [self setupViewForCollapsedState];
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

- (void)setupViewForCollapsedState {
    if ([self.subviews containsObject:self.editingContainerView]) {
        [self.editingContainerView removeFromSuperview];
    }
}

- (void)setupViewForPlayingState {
    if ([self.subviews containsObject:self.editingContainerView]) {
        [self.editingContainerView removeFromSuperview];
    }
    
}

- (void)setupViewForEditingState {
    
    //TODO: add editing view
}

- (void)setupViewForEditingWhilePlayingState {
    //TODO: add editing and playing view
}

- (void)playPauseButtonPressed:(UIButton *)sender {
    
}

- (IBAction)editButtonPressed:(UIButton *)sender {
    switch (self.cellModel.state) {
        case CellStateDefault:
            self.cellModel.state = CellStateEditing;
            break;
        case CellStateEditing:
            self.cellModel.state = CellStateDefault;
            break;
        case CellStatePlaying:
            self.cellModel.state = CellStatePlayingAndEditing;
            break;
        case CellStatePlayingAndEditing:
            self.cellModel.state = CellStatePlaying;
            break;
    }
}

- (void)prepareForReuse {
    [self.cellModel removeObserver:self forKeyPath:@"state"];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    [self setupViewBasedOnState];
}

@end
