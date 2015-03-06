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
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *length;
@property (weak, nonatomic) IBOutlet UIButton *editButton;

@property (nonatomic, strong) UIView *editingContainerView;

@property (nonatomic, strong, readwrite) RecordingCellModel *cellModel;

@end

@implementation RecordingCell

-(void)layoutSubviews {
    [super layoutSubviews];
    
    self.backgroundColor = [UIColor blackColor];
    self.editButton.backgroundColor = [UIColor blackColor];
    self.title.textColor = [UIColor vibrantBlueText];
    self.length.textColor = [UIColor vibrantBlueText];
    self.layer.masksToBounds = YES;
    self.bottomSeparator.backgroundColor = [UIColor vibrantBlueHalfOpacity];
}

- (void)bindToModel:(RecordingCellModel *)cellModel {
    _cellModel = cellModel;
    
    [cellModel addObserver:self forKeyPath:@"state" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:NULL];
    
    self.title.text = cellModel.title;
    self.length.text = cellModel.length;
    [self.editButton setBackgroundImage:[WireTapStyleKit imageOfEditCircle] forState:UIControlStateNormal];
    
    [self setupViewBasedOnState];
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
