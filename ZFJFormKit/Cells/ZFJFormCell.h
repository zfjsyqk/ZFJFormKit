//
//  ZFJFormCell.h
//  ZFJFormKit
//
//  Created by 张福杰 on 2018/4/22.
//  Copyright © 2019 张福杰. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZFJFormCellDelegate.h"

@class ZFJFormModel,ZFJFormCommon;

NS_ASSUME_NONNULL_BEGIN

@interface ZFJFormCell : UITableViewCell<ZFJFormCellDelegate>

/**
 CELL的数据源模型
 */
@property (nonatomic,readonly) ZFJFormModel *model;

/**
 标题Lab
 */
@property (nonatomic,strong) UILabel *titleLab;

/**
 左边Icon
 */
@property (nonatomic,strong) UIImageView *iconImgView;

/**
 CELL分割线
 */
@property (nonatomic,strong) UIView *separatorLine;

/**
 CELL的UITableView
 */
@property (nonatomic, strong) UITableView *tableView;

/**
 CELL向右小图标
 */
@property (nonatomic,strong) UIImageView *leftImgView;

/**
 UI配置
 */
- (void)uiConfig;


@end

NS_ASSUME_NONNULL_END
