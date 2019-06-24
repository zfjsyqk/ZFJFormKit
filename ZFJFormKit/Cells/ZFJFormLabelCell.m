//
//  ZFJFormLabelCell.m
//  ZFJFormKit
//
//  Created by 张福杰 on 2018/4/22.
//  Copyright © 2019 张福杰. All rights reserved.
//

#import "ZFJFormLabelCell.h"
#import "ZFJFormModel.h"
#import "ZFJFormCommon.h"

@interface ZFJFormLabelCell ()

@property (nonatomic,strong) UILabel *valueLab;

@end

@implementation ZFJFormLabelCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)uiConfig{
    [super uiConfig];
    [self.contentView addSubview:self.valueLab];
}

- (void)configCellWithModel:(ZFJFormModel *)model{
    [super configCellWithModel:model];
    CGFloat valueLab_wid = ZFJForm_ScreenWidth - self.model.configModel.marginSize * 3 - ZFJForm_ScreenWidth/3;
    
    if(self.model.isShowCellRightImg){
        self.valueLab.frame = CGRectMake(ZFJForm_ScreenWidth - valueLab_wid - self.model.configModel.marginSize, self.model.configModel.marginTopBot, valueLab_wid - KLeftImgViewSize - 8, self.model.height - self.model.configModel.marginTopBot * 2);
    }else{
        self.valueLab.frame = CGRectMake(ZFJForm_ScreenWidth - valueLab_wid - self.model.configModel.marginSize, self.model.configModel.marginTopBot, valueLab_wid, self.model.height - self.model.configModel.marginTopBot * 2);
    }
    
    if(self.model.value != nil && self.model.value.length > 0){
        self.valueLab.text = self.model.value;
        if(self.model.configModel.valueColor != nil){
            self.valueLab.textColor = self.model.configModel.valueColor;
        }
    }else{
        if(self.model.configModel.placeholderColor){
            self.valueLab.textColor = self.model.configModel.placeholderColor;
        }
        
        if(self.model.placeholder){
            self.valueLab.text = self.model.placeholder;
        }
    }
    
    if(self.model.configModel.valueFont != nil){
        self.valueLab.font = self.model.configModel.valueFont;
    }
}

- (UILabel *)valueLab{
    if(_valueLab == nil){
        _valueLab = [[UILabel alloc] init];
        _valueLab.font = [UIFont systemFontOfSize:14];
        _valueLab.textAlignment = NSTextAlignmentRight;
    }
    return _valueLab;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
