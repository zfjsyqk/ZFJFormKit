//
//  ZFJFormTextViewCell.m
//  ZFJFormKit
//
//  Created by 张福杰 on 2018/4/22.
//  Copyright © 2019 张福杰. All rights reserved.
//

#import "ZFJFormTextViewCell.h"
#import "ZFJPlacehoderTextView.h"
#import "ZFJFormModel.h"
#import "ZFJFormCommon.h"

@interface ZFJFormTextViewCell ()<UITextViewDelegate>

@property (nonatomic,strong) ZFJPlacehoderTextView *textView;

@end

@implementation ZFJFormTextViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)uiConfig{
    [super uiConfig];
    [self.contentView addSubview:self.textView];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    CGRect frame_icon = self.iconImgView.frame;
    frame_icon.origin.y = (self.model.height - self.model.configModel.iconSize.height)/2;
    self.iconImgView.frame = frame_icon;
 
    CGRect frame = self.titleLab.frame;
    frame.origin.y = self.model.configModel.marginTopBot;
    frame.size.height = self.model.height - self.model.configModel.marginTopBot * 2;
    self.titleLab.frame = frame;
    
    self.leftImgView.frame = CGRectMake(ZFJForm_ScreenWidth - KLeftImgViewSize - self.model.configModel.marginSize, (self.model.height - KLeftImgViewSize)/2, KLeftImgViewSize, KLeftImgViewSize);
    
    self.separatorLine.frame = CGRectMake(self.model.configModel.marginSize, self.model.height - 1, ZFJForm_ScreenWidth - self.model.configModel.marginSize * 2, 1.0);
}

- (void)configCellWithModel:(ZFJFormModel *)model{
    [super configCellWithModel:model];
    
    self.model.textView_maxHeight = self.model.textView_maxHeight == 0 ? self.model.height : 100;
    
    if(self.model.isShowCellRightImg){
        self.textView.frame = CGRectMake(CGRectGetMaxX(self.titleLab.frame) + self.model.configModel.marginSize + 3, self.model.configModel.marginTopBot, ZFJForm_ScreenWidth - (CGRectGetMaxX(self.titleLab.frame) + self.model.configModel.marginSize) - self.model.configModel.marginSize - KLeftImgViewSize - 8, self.model.height - self.model.configModel.marginTopBot * 2);
    }else{
        self.textView.frame = CGRectMake(CGRectGetMaxX(self.titleLab.frame) + self.model.configModel.marginSize + 3, self.model.configModel.marginTopBot, ZFJForm_ScreenWidth - (CGRectGetMaxX(self.titleLab.frame) + self.model.configModel.marginSize) - self.model.configModel.marginSize, self.model.height - self.model.configModel.marginTopBot * 2);
    }
    
    self.textView.text = self.model.value;
    
    self.textView.placeholder = self.model.placeholder;
    
    if(self.model.configModel.valueFont != nil){
        self.textView.font = self.model.configModel.valueFont;
    }
    
    if(self.model.configModel.valueColor != nil){
        self.textView.textColor = self.model.configModel.valueColor;
    }
    
    self.textView.keyboardType = self.model.keyboardType;
    
    if(self.model.configModel.placeholderColor){
        self.textView.placeholderColor = self.model.configModel.placeholderColor;
    }
}

- (void)textViewDidChange:(UITextView *)textView{
    if(self.model.valueDidChangedBlock){
        self.model.valueDidChangedBlock(textView.text);
    }
    self.model.value = textView.text;
    
    [textView flashScrollIndicators];
 
    CGRect frame = textView.frame;
    CGSize constraintSize = CGSizeMake(frame.size.width, MAXFLOAT);
    CGSize size = [textView sizeThatFits:constraintSize];
    if(size.height >= self.model.textView_maxHeight){
        size.height = self.model.textView_maxHeight;
        textView.scrollEnabled = YES;
    }else{
        textView.scrollEnabled = NO;
    }
    textView.frame = CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, size.height);
    
    self.model.height = size.height + self.model.configModel.marginTopBot * 2;

    [UIView performWithoutAnimation:^{
        [self.tableView beginUpdates];
        [self.tableView endUpdates];
    }];
}

- (ZFJPlacehoderTextView *)textView{
    if(_textView == nil){
        _textView = [[ZFJPlacehoderTextView alloc] init];
        _textView.font = [UIFont systemFontOfSize:14];
        _textView.delegate = self;
        _textView.textAlignment = NSTextAlignmentRight;
    }
    return _textView;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
