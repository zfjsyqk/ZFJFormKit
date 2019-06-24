//
//  ZFJFormCell.m
//  ZFJFormKit
//
//  Created by 张福杰 on 2018/4/22.
//  Copyright © 2019 张福杰. All rights reserved.
//

#import "ZFJFormCell.h"
#import "ZFJFormTool.h"
#import "ZFJFormModel.h"
#import "ZFJFormCommon.h"

@interface ZFJFormCell ()

@end

@implementation ZFJFormCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        [self uiConfig];
    }
    return self;
}

- (void)uiConfig{
    [self.contentView addSubview:self.titleLab];
    [self.contentView addSubview:self.iconImgView];
    [self.contentView addSubview:self.leftImgView];
    [self.contentView addSubview:self.separatorLine];
}

- (void)configCellWithModel:(ZFJFormModel *)model{
    _model = model;
    
    _model.height = (_model.height > 0) ? _model.height : 44;
    _model.configModel.marginSize = (_model.configModel.marginSize > 0) ? _model.configModel.marginSize : 10;
    
    _model.configModel.marginTopBot = _model.configModel.marginTopBot == 0 ? 8 : _model.configModel.marginTopBot;
    
    CGFloat left_space = _model.configModel.marginSize;
    //左边的图标
    if(_model.iconImg != nil){
        self.iconImgView.image = _model.iconImg;
        CGFloat width = _model.configModel.iconSize.width == 0 ? 20 : _model.configModel.iconSize.width;
        CGFloat height = _model.configModel.iconSize.height == 0 ? 20 : _model.configModel.iconSize.height;
        self.iconImgView.frame = CGRectMake(left_space, (_model.height - height)/2, width, height);
        left_space += (width + _model.configModel.marginSize);
    }
    
    UIFont *titleLab_font = _model.configModel.titleFont == nil ? [UIFont systemFontOfSize:14] : _model.configModel.titleFont;
    CGFloat titleLab_wid = [ZFJFormTool dynamicHeight:_model.title width:2000 height:_model.height font:titleLab_font].size.width;
    CGFloat screenWidth_3 = ZFJForm_ScreenWidth/3;
    titleLab_wid = titleLab_wid > screenWidth_3 ? titleLab_wid = screenWidth_3 : titleLab_wid;
    self.titleLab.frame = CGRectMake(left_space, _model.configModel.marginTopBot, titleLab_wid, _model.height - _model.configModel.marginTopBot * 2);
    self.titleLab.text = _model.title;
    
    if(_model.configModel.titleColor != nil){
        self.titleLab.textColor = _model.configModel.titleColor;
    }
    
    self.titleLab.font = titleLab_font;
    
    if(_model.configModel.separatorLineColor){
        self.separatorLine.backgroundColor = _model.configModel.separatorLineColor;
    }else{
        self.separatorLine.backgroundColor = [UIColor groupTableViewBackgroundColor];
    }
    self.separatorLine.frame = CGRectMake(_model.configModel.marginSize, _model.height - 1, ZFJForm_ScreenWidth - _model.configModel.marginSize * 2, 1.0);
    self.separatorLine.hidden = _model.configModel.isHiddenLine;
    
    self.leftImgView.frame = CGRectMake(ZFJForm_ScreenWidth - KLeftImgViewSize - _model.configModel.marginSize, (_model.height - KLeftImgViewSize)/2, KLeftImgViewSize, KLeftImgViewSize);
    
    self.leftImgView.hidden = !_model.isShowCellRightImg;
    
    self.leftImgView.image = _model.cellRightImg ? _model.cellRightImg : [UIImage imageNamed:@"cell_left_icon"];
}

- (UILabel *)titleLab{
    if(_titleLab == nil){
        _titleLab = [[UILabel alloc] init];
    }
    return _titleLab;
}

- (UIImageView *)iconImgView{
    if(_iconImgView == nil){
        _iconImgView = [[UIImageView alloc] init];
        //_iconImgView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    }
    return _iconImgView;
}

- (UIView *)separatorLine{
    if(_separatorLine == nil){
        _separatorLine = [[UIView alloc] init];
    }
    return _separatorLine;
}

- (UITableView *)tableView{
    UIView *tableView = self.superview;
    while (![tableView isKindOfClass:[UITableView class]] && tableView){
        tableView = tableView.superview;
    }
    return (UITableView *)tableView;
}

- (UIImageView *)leftImgView{
    if(_leftImgView == nil){
        _leftImgView = [[UIImageView alloc] init];
        _leftImgView.image = [UIImage imageNamed:@"cell_left_icon"];
    }
    return _leftImgView;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
