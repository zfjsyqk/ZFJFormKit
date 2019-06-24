//
//  ZFJFormCellConfig.h
//  ZFJFormKit
//
//  Created by 张福杰 on 2018/4/22.
//  Copyright © 2019 张福杰. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/**
 CELL的通用配置Model，也可以根据不同的CELL分别配置
 */
@interface ZFJFormCellConfig : NSObject

/**
 标题颜色
 */
@property (nonatomic,strong) UIColor *titleColor;

/**
 标题字体
 */
@property (nonatomic,strong) UIFont *titleFont;

/**
 icon大小
 */
@property (nonatomic,assign) CGSize iconSize;

/**
 头像圆角大小(headImgRadius = -1,头像圆形)
 */
@property (nonatomic,assign) CGFloat headImgRadius;

/**
 值的颜色
 */
@property (nonatomic,strong) UIColor *valueColor;

/**
 值的字体
 */
@property (nonatomic,strong) UIFont *valueFont;

/**
 占位符颜色
 */
@property (nonatomic,strong) UIColor *placeholderColor;

/**
 是否隐藏CELL分割线（默认NO）
 */
@property (nonatomic,assign) BOOL isHiddenLine;

/**
 分割线颜色
 */
@property (nonatomic,strong) UIColor *separatorLineColor;

/**
 控件距离左右两边的距离
 */
@property (nonatomic,assign) CGFloat marginSize;

/**
 控件上下间距
 */
@property (nonatomic,assign) CGFloat marginTopBot;

@end

NS_ASSUME_NONNULL_END
