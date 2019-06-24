//
//  ZFJFormSwitchwCell.m
//  ZFJFormKit
//
//  Created by 张福杰 on 2018/4/24.
//  Copyright © 2019 张福杰. All rights reserved.
//

#import "ZFJFormSwitchwCell.h"
#import "ZFJFormModel.h"
#import "ZFJFormCommon.h"

@interface ZFJFormSwitchwCell ()

@property (nonatomic,strong) UISwitch *switchBtn;

@end

@implementation ZFJFormSwitchwCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)uiConfig{
    [super uiConfig];
    [self.contentView addSubview:self.switchBtn];
}

- (void)configCellWithModel:(ZFJFormModel *)model{
    [super configCellWithModel:model];
    
    if(self.model.isShowCellRightImg){
        self.switchBtn.frame = CGRectMake(ZFJForm_ScreenWidth - 51 - self.model.configModel.marginSize - KLeftImgViewSize - 8, (self.model.height - 31)/2, 51, 31);
    }else{
        self.switchBtn.frame = CGRectMake(ZFJForm_ScreenWidth - 51 - self.model.configModel.marginSize, (self.model.height - 31)/2, 51, 31);
    }
    
    self.switchBtn.on = self.model.value != nil ? YES : NO;
}

- (void)switchAction:(UISwitch *)switchBtn{
    NSString *value = switchBtn.on ? @"switchBtn.on" : nil;
    if(self.model.valueDidChangedBlock){
        self.model.valueDidChangedBlock(value);
    }
    self.model.value = value;
}

- (UISwitch *)switchBtn{
    if(_switchBtn == nil){
        _switchBtn = [[UISwitch alloc] init];
        [_switchBtn addTarget:self action:@selector(switchAction:) forControlEvents:UIControlEventValueChanged];
    }
    return _switchBtn;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
