//
//  ZFJFormTextFieldCell.m
//  ZFJFormKit
//
//  Created by 张福杰 on 2018/4/22.
//  Copyright © 2019 张福杰. All rights reserved.
//

#import "ZFJFormTextFieldCell.h"
#import "ZFJFormModel.h"
#import "ZFJFormCommon.h"

@interface ZFJFormTextFieldCell ()

@property (nonatomic,strong) UITextField *textField;

@end

@implementation ZFJFormTextFieldCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)uiConfig{
    [super uiConfig];
    [self.contentView addSubview:self.textField];
}

- (void)configCellWithModel:(ZFJFormModel *)model{
    [super configCellWithModel:model];
    if(self.model.isShowCellRightImg){
        self.textField.frame = CGRectMake(CGRectGetMaxX(self.titleLab.frame) + self.model.configModel.marginSize, self.model.configModel.marginTopBot, ZFJForm_ScreenWidth - (CGRectGetMaxX(self.titleLab.frame) + self.model.configModel.marginSize) - self.model.configModel.marginSize - KLeftImgViewSize - 8, self.model.height - self.model.configModel.marginTopBot * 2);
    }else{
        self.textField.frame = CGRectMake(CGRectGetMaxX(self.titleLab.frame) + self.model.configModel.marginSize, self.model.configModel.marginTopBot, ZFJForm_ScreenWidth - (CGRectGetMaxX(self.titleLab.frame) + self.model.configModel.marginSize) - self.model.configModel.marginSize, self.model.height - self.model.configModel.marginTopBot * 2);
    }
    
    self.textField.text = self.model.value;
    
    self.textField.placeholder = self.model.placeholder;
    
    if(self.model.configModel.valueFont != nil){
        self.textField.font = self.model.configModel.valueFont;
    }
    
    if(self.model.configModel.valueColor != nil){
        self.textField.textColor = self.model.configModel.valueColor;
    }
    
    self.textField.keyboardType = self.model.keyboardType;
    
    if(self.model.configModel.placeholderColor){
        [self.textField setValue:self.model.configModel.placeholderColor forKeyPath:@"_placeholderLabel.textColor"];
    }
}

- (void)textFieldDidChanged:(UITextField *)textField{
    if(self.model.valueDidChangedBlock){
        self.model.valueDidChangedBlock(textField.text);
    }
    self.model.value = textField.text;
}

- (UITextField *)textField{
    if(_textField == nil){
        _textField = [[UITextField alloc] init];
        _textField.font = [UIFont systemFontOfSize:14];
        _textField.clearButtonMode = UITextFieldViewModeWhileEditing;
        [_textField addTarget:self action:@selector(textFieldDidChanged:) forControlEvents:UIControlEventEditingChanged];
        _textField.textAlignment = NSTextAlignmentRight;
    }
    return _textField;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
